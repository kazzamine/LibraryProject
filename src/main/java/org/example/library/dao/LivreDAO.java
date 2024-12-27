package org.example.library.dao;

import org.example.library.entities.Livre;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

public class LivreDAO {
    private EntityManagerFactory emf;

    public LivreDAO() {
        this.emf = Persistence.createEntityManagerFactory("default");
    }

    // Create a new Livre
    public void create(Livre livre) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(livre);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Find a Livre by ID
    public Livre findById(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Livre.class, id);
        } finally {
            em.close();
        }
    }

    // Find all Livres
    public List<Livre> findAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT l FROM Livre l", Livre.class).getResultList();
        } finally {
            em.close();
        }
    }

    // Update an existing Livre
    public void update(Livre livre) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(livre);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Delete a Livre by ID
    public void delete(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Livre livre = em.find(Livre.class, id);
            if (livre != null) {
                em.remove(livre);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
