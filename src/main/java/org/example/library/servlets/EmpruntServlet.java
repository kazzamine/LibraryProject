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
            action = "list"; // Default action
        }

        switch (action) {
            case "list":
                listEmprunts(request, response);
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

    private void listEmprunts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Emprunt> emprunts = empruntDAO.findAll();
        request.setAttribute("emprunts", emprunts);
        request.getRequestDispatcher("/jsp/emprunt/emprunts.jsp").forward(request, response);
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

        // Create a new borrowing transaction
        Emprunt emprunt = new Emprunt();
        emprunt.setUser(loggedUser);
        emprunt.setLivre(livre);
        emprunt.setStartDate(LocalDate.now());
        emprunt.setDueDate(LocalDate.now().plusDays(14)); // Borrow for 2 weeks
        emprunt.setDateEmprunt(LocalDate.now()); // Set the borrowing date
        emprunt.setStatus("BORROWED");

        empruntDAO.create(emprunt);

        // Update book availability
        livre.setDispo(false);
        livreDAO.update(livre);

        response.sendRedirect("livres?action=list&success=Book borrowed successfully");
    }

    private void returnBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long empruntId = Long.parseLong(request.getParameter("empruntId"));
        Emprunt emprunt = empruntDAO.findById(empruntId);

        if (emprunt != null && "BORROWED".equals(emprunt.getStatus())) {
            emprunt.setStatus("RETURNED");
            empruntDAO.update(emprunt);

            Livre livre = emprunt.getLivre();
            livre.setDispo(true);
            livreDAO.update(livre);

            response.sendRedirect("emprunts?action=list&success=Book returned successfully");
        } else {
            response.sendRedirect("emprunts?action=list&error=Invalid return request");
        }
    }
}
