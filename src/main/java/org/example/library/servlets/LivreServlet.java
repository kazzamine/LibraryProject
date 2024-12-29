package org.example.library.servlets;

import org.example.library.dao.CategoryDAO;
import org.example.library.dao.LivreDAO;
import org.example.library.entities.Category;
import org.example.library.entities.Livre;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/livres")
public class LivreServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LivreDAO livreDAO;

    @Override
    public void init() throws ServletException {
        livreDAO = new LivreDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "addForm":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteLivre(request, response);
                break;
            case "list":
            default:
                listLivres(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addLivre(request, response);
        } else if ("update".equals(action)) {
            updateLivre(request, response);
        }
    }

    private void listLivres(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Livre> livres = livreDAO.findAll();
        request.setAttribute("livres", livres);
        request.getRequestDispatcher("/jsp/livres.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("showAddForm");
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> categories = categoryDAO.findAll();
        System.out.println(categories);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/jsp/add-livre.jsp").forward(request, response);
    }

    private void addLivre(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Retrieve form parameters
        String titre = request.getParameter("titre");
        String auteur = request.getParameter("auteur");
        boolean dispo = Boolean.parseBoolean(request.getParameter("dispo"));
        Long categoryId = Long.parseLong(request.getParameter("categoryId"));

        // Find the associated category
        CategoryDAO categoryDAO = new CategoryDAO();
        Category category = categoryDAO.findById(categoryId);

        // Validate that the category exists
        if (category != null) {
            // Create a new Livre instance
            Livre livre = new Livre();
            livre.setTitre(titre);
            livre.setAuteur(auteur);
            livre.setDispo(dispo);
            livre.setCategory(category); // Set the associated category

            // Save the book to the database
            livreDAO.create(livre);
        }

        // Redirect back to the list of books
        response.sendRedirect("livres");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Livre livre = livreDAO.findById(id);

        if (livre != null) {
            CategoryDAO categoryDAO = new CategoryDAO();
            List<Category> categories = categoryDAO.findAll();

            request.setAttribute("livre", livre);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/jsp/edit-livre.jsp").forward(request, response);
        } else {
            response.sendRedirect("livres");
        }
    }

    private void updateLivre(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String titre = request.getParameter("titre");
        String auteur = request.getParameter("auteur");
        boolean dispo = Boolean.parseBoolean(request.getParameter("dispo"));
        Long categoryId = Long.parseLong(request.getParameter("categoryId"));

        // Find the associated category
        CategoryDAO categoryDAO = new CategoryDAO();
        Category category = categoryDAO.findById(categoryId);

        // Find the existing Livre instance
        Livre livre = livreDAO.findById(id);
        if (livre != null && category != null) {
            livre.setTitre(titre);
            livre.setAuteur(auteur);
            livre.setDispo(dispo);
            livre.setCategory(category); // Update the category

            // Update the book in the database
            livreDAO.update(livre);
        }

        // Redirect back to the list of books
        response.sendRedirect("livres");
    }

    private void deleteLivre(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        livreDAO.delete(id);
        response.sendRedirect("livres");
    }
}
