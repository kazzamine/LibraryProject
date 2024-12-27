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

    public Emprunt findById(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Emprunt.class, id);
        } finally {
            em.close();
        }
    }

    public List<Emprunt> findAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT e FROM Emprunt e", Emprunt.class).getResultList();
        } finally {
            em.close();
        }
    }

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

    public void delete(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Emprunt emprunt = em.find(Emprunt.class, id);
            if (emprunt != null) {
                em.remove(emprunt);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
