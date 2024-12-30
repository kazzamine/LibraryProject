package org.example.library.servlets;

import org.example.library.dao.UserDAO;
import org.example.library.entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/users")
public class UserServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!isAdmin(request)) {
            response.sendRedirect("accessDenied.jsp");
            return;
        }

        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "addForm":
                showAddForm(request, response);
                break;
            case "editForm":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "list":
            default:
                listUsers(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!isAdmin(request)) {
            response.sendRedirect("accessDenied.jsp");
            return;
        }

        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addUser(request, response);
        } else if ("update".equals(action)) {
            updateUser(request, response);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = userDAO.findAll();
        System.out.println(users);
        request.setAttribute("users", users);
        request.getRequestDispatcher("/jsp/userManagement/users.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/userManagement/add-user.jsp").forward(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        boolean isAdmin = "ADMIN".equalsIgnoreCase(role);

        User user = new User();
        user.setNom(nom);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);
        user.setAdmin(isAdmin);

        userDAO.create(user);
        response.sendRedirect("users");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        User user = userDAO.findById(id);

        if (user != null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("/jsp/userManagement/edit-user.jsp").forward(request, response);
        } else {
            response.sendRedirect("users");
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        boolean isAdmin = "ADMIN".equalsIgnoreCase(role);

        User user = userDAO.findById(id);
        if (user != null) {
            user.setNom(nom);
            user.setEmail(email);
            user.setPassword(password);
            user.setRole(role);
            user.setAdmin(isAdmin);

            userDAO.update(user);
        }
        response.sendRedirect("users");
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        userDAO.delete(id);
        response.sendRedirect("users");
    }

    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("loggedUser");
        return loggedUser != null && loggedUser.isAdmin();
    }
}
