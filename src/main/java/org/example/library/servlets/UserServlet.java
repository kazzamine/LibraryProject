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
        if (action == null || action.equals("list")) {
            listUsers(request, response);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = userDAO.findAll();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/jsp/userManagement/users.jsp").forward(request, response);
    }

    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User loggedUser = (User) session.getAttribute("loggedUser");
        return loggedUser != null && loggedUser.isAdmin();
    }
}
