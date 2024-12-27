package org.example.library.servlet;

import org.example.library.entities.Category;
import org.example.library.entities.Livre;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/test")
public class PersistenceTestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Initialize EntityManager
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();

            // Create and persist a Category
            Category category = new Category();
            category.setName("scifi");
            em.persist(category);

            // Create and persist a Livre with the Category
            Livre livre = new Livre();
            livre.setTitre("Test Book");
            livre.setAuteur("Test Author");
            livre.setDispo(true);
            livre.setCategory(category); // Assign the category

            em.persist(livre);

            em.getTransaction().commit();

            response.getWriter().println("Persistence test successful! Livre and Category entities saved to database.");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error during persistence test: " + e.getMessage());
        } finally {
            em.close();
            emf.close();
        }
    }
}
