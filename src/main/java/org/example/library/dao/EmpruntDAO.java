package org.example.library.dao;

import org.example.library.entities.Emprunt;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

public class EmpruntDAO {
    private EntityManagerFactory emf;

    public EmpruntDAO() {
        this.emf = Persistence.createEntityManagerFactory("default");
    }

    // Create a new borrowing transaction
    public void create(Emprunt emprunt) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(emprunt);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Find a borrowing transaction by ID
    public Emprunt findById(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Emprunt.class, id);
        } finally {
            em.close();
        }
    }

    // Find borrowing transactions by user ID
    public List<Emprunt> findByUserId(Long userId) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT e FROM Emprunt e WHERE e.user.id = :userId", Emprunt.class)
                    .setParameter("userId", userId)
                    .getResultList();
        } finally {
            em.close();
        }
    }

    // Find all borrowing transactions
    public List<Emprunt> findAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT e FROM Emprunt e", Emprunt.class).getResultList();
        } finally {
            em.close();
        }
    }

    // Update a borrowing transaction
    public void update(Emprunt emprunt) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(emprunt);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
