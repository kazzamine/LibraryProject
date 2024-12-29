package org.example.library.dao;

import org.example.library.entities.Category;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

public class CategoryDAO {
    private EntityManagerFactory emf;

    public CategoryDAO() {
        this.emf = Persistence.createEntityManagerFactory("default");
    }

    // Fetch all categories
    public List<Category> findAll() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT c FROM Category c", Category.class).getResultList();
        } finally {
            em.close();
        }
    }

    // Find a category by ID
    public Category findById(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Category.class, id);
        } finally {
            em.close();
        }
    }

    // Create a new category
    public void create(Category category) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(category);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Update an existing category
    public void update(Category category) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(category);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Delete a category by ID
    public void delete(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            Category category = em.find(Category.class, id);
            if (category != null) {
                em.remove(category);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
