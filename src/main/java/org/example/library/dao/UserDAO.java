package org.example.library.dao;

import org.example.library.entities.User;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

public class UserDAO {
    private EntityManagerFactory emf;

    public UserDAO() {
        this.emf = Persistence.createEntityManagerFactory("default");
    }

    // Find a user by email
    public User findByEmail(String email) {
        EntityManager em = emf.createEntityManager();
        try {
            List<User> users = em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class)
                    .setParameter("email", email)
                    .getResultList();
            return users.isEmpty() ? null : users.get(0);
        } finally {
            em.close();
        }
    }

    // Create a new user
    public void create(User user) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Update an existing user
    public void update(User user) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(user);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
