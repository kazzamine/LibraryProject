package org.example.library.servlets;

import org.example.library.entities.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("loggedUser");

        if (loggedUser == null || !"ADMIN".equalsIgnoreCase(loggedUser.getRole())) {
            response.sendRedirect("login");
            return;
        }

        request.getRequestDispatcher("/jsp/adminSection/adminDashboard.jsp").forward(request, response);
    }
}
