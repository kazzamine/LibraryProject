package org.example.library.servlet;

import org.example.library.entities.User;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    private static final EntityManagerFactory entityManager= Persistence.createEntityManagerFactory("default");

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em=entityManager.createEntityManager();
        try{
            em.getTransaction().begin();
            User user=new User();
            user.setNom("fouad");
            em.persist(user);
            em.getTransaction().commit();

            req.setAttribute("user", user);

            req.getRequestDispatcher("jsp/user.jsp").forward(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }finally {
            em.close();
        }
    }

    @Override
    public void destroy() {
        entityManager.close();
    }
}
