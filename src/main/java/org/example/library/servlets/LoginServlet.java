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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/userManagement/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        System.out.println("Login attempt with email: " + email);

        // Find user
        User user = userDAO.findByEmail(email);
        if (user == null) {
            System.out.println("No user found for email: " + email);
            request.setAttribute("error", "Invalid email.");
            request.getRequestDispatcher("/jsp/userManagement/login.jsp").forward(request, response);
            return;
        }

        System.out.println("User logged in: " + user.getNom() + ", Role: " + user.getRole());

        // Set user in session
        HttpSession session = request.getSession();
        session.setAttribute("loggedUser", user);

        // Redirect based on role
        if ("ADMIN".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("admin/dashboard");
        } else {
            response.sendRedirect("livres");
        }
    }
}
