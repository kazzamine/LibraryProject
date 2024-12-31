package org.example.library.servlets;

import org.example.library.dao.EmpruntDAO;
import org.example.library.dao.LivreDAO;
import org.example.library.entities.Emprunt;
import org.example.library.entities.Livre;
import org.example.library.entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/emprunts")
public class EmpruntServlet extends HttpServlet {
    private EmpruntDAO empruntDAO;
    private LivreDAO livreDAO;

    @Override
    public void init() throws ServletException {
        empruntDAO = new EmpruntDAO();
        livreDAO = new LivreDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "history"; // Default action for users
        }

        switch (action) {
            case "history":
                showBorrowHistory(request, response);
                break;
            case "requests":
                if (isAdmin(request)) {
                    showBorrowRequests(request, response);
                } else {
                    response.sendRedirect("accessDenied.jsp");
                }
                break;
            case "return":
                if (isAdmin(request)) {
                    showReturnList(request, response);
                } else {
                    response.sendRedirect("accessDenied.jsp");
                }
                break;
            case "approve": // Handle approve action in GET
                if (isAdmin(request)) {
                    approveRequest(request, response);
                } else {
                    response.sendRedirect("accessDenied.jsp");
                }
                break;
            case "reject": // Handle reject action in GET
                if (isAdmin(request)) {
                    rejectRequest(request, response);
                } else {
                    response.sendRedirect("accessDenied.jsp");
                }
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Unknown action: " + action);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("borrow".equals(action)) {
            borrowBook(request, response);
        } else if ("return".equals(action)) {
            returnBook(request, response);
        }
    }

    private void showBorrowHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("loggedUser");

        if (loggedUser == null) {
            response.sendRedirect("login");
            return;
        }

        List<Emprunt> emprunts = empruntDAO.findByUserId(loggedUser.getId());
        request.setAttribute("emprunts", emprunts);
        request.getRequestDispatcher("/jsp/emprunt/history.jsp").forward(request, response);
    }

    private void showBorrowRequests(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Emprunt> emprunts = empruntDAO.findAll().stream()
                .filter(e -> "PENDING".equals(e.getStatus()))
                .collect(Collectors.toList());
        request.setAttribute("emprunts", emprunts);
        request.getRequestDispatcher("/jsp/emprunt/requests.jsp").forward(request, response);
    }

    private void showReturnList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Emprunt> emprunts = empruntDAO.findAll().stream()
                .filter(e -> "BORROWED".equals(e.getStatus()))
                .collect(Collectors.toList());
        request.setAttribute("emprunts", emprunts);
        request.getRequestDispatcher("/jsp/emprunt/returns.jsp").forward(request, response);
    }

    private void borrowBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("loggedUser");

        if (loggedUser == null) {
            response.sendRedirect("login");
            return;
        }

        Long livreId = Long.parseLong(request.getParameter("livreId"));
        Livre livre = livreDAO.findById(livreId);

        if (livre == null || !Boolean.TRUE.equals(livre.getDispo())) {
            response.sendRedirect("livres?action=list&error=Book not available");
            return;
        }

        Emprunt emprunt = new Emprunt();
        emprunt.setUser(loggedUser);
        emprunt.setLivre(livre);
        emprunt.setStartDate(LocalDate.now());
        emprunt.setDueDate(LocalDate.now().plusDays(14));
        emprunt.setDateEmprunt(LocalDate.now());
        emprunt.setStatus("PENDING");

        empruntDAO.create(emprunt);
        response.sendRedirect("emprunts?action=history&success=Request submitted");
    }

    private void approveRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long empruntId = Long.parseLong(request.getParameter("id"));
        Emprunt emprunt = empruntDAO.findById(empruntId);

        if (emprunt != null && "PENDING".equals(emprunt.getStatus())) {
            emprunt.setStatus("BORROWED");
            emprunt.setDateEmprunt(LocalDate.now());
            empruntDAO.update(emprunt);

            Livre livre = emprunt.getLivre();
            livre.setDispo(false);
            livreDAO.update(livre);
        }

        response.sendRedirect("emprunts?action=requests");
    }

    private void rejectRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long empruntId = Long.parseLong(request.getParameter("id"));
        Emprunt emprunt = empruntDAO.findById(empruntId);

        if (emprunt != null && "PENDING".equals(emprunt.getStatus())) {
            emprunt.setStatus("REJECTED");
            empruntDAO.update(emprunt);
        }

        response.sendRedirect("emprunts?action=requests");
    }

    private void returnBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long empruntId = Long.parseLong(request.getParameter("id")); // Extract ID from request
        Emprunt emprunt = empruntDAO.findById(empruntId); // Find Emprunt by ID

        if (emprunt != null && "BORROWED".equals(emprunt.getStatus())) { // Check if it's borrowed
            // Mark as returned
            emprunt.setStatus("RETURNED");
            empruntDAO.update(emprunt); // Update Emprunt status

            // Update book availability
            Livre livre = emprunt.getLivre();
            livre.setDispo(true); // Make book available
            livreDAO.update(livre);

            // Redirect with success message
            response.sendRedirect("emprunts?action=return&success=Book returned successfully");
        } else {
            // Redirect with error message
            response.sendRedirect("emprunts?action=return&error=Invalid return request");
        }
    }


    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("loggedUser");
        return loggedUser != null && loggedUser.isAdmin();
    }
}
