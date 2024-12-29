package org.example.library.servlets;

import org.example.library.dao.UserDAO;
import org.example.library.entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    // Handle GET requests to display the registration form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/userManagement/register.jsp").forward(request, response);
    }

    // Handle POST requests to process the registration form
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String role = request.getParameter("role");

        // Check if user already exists
        if (userDAO.findByEmail(email) != null) {
            request.setAttribute("error", "Email is already registered.");
            request.getRequestDispatcher("/jsp/userManagement/register.jsp").forward(request, response);
            return;
        }

        // Create and save user
        User user = new User();
        user.setNom(nom);
        user.setEmail(email);
        user.setRole(role);
        userDAO.create(user);

        response.sendRedirect("login");
    }
}
