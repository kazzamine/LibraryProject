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
    // Handle GET requests to display the registration form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/userManagement/login.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Find user by email
        User user = userDAO.findByEmail(email);

        if (user == null || !password.equals(user.getPassword())) {
            request.setAttribute("error", "Invalid email or password.");
            request.getRequestDispatcher("/jsp/userManagement/login.jsp").forward(request, response);
            return;
        }

        // Store user in session
        HttpSession session = request.getSession();
        session.setAttribute("loggedUser", user);

        // Redirect based on role or isAdmin
        if (user.isAdmin() || "ADMIN".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("admin/dashboard");
        } else {
            response.sendRedirect("livres");
        }
    }
}
