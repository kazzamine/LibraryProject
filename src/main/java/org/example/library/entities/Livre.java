package org.example.library.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Livre
{

    @Id
    @GeneratedValue
    private Long id;
    private String titre;
    private String auteur;
    private String description;
    private int pages;
    private int dispo;

    public Livre() {
    }

    public Livre(String titre, String auteur, String description, int pages, int dispo) {
        this.titre = titre;
        this.auteur = auteur;
        this.description = description;
        this.pages = pages;
        this.dispo = dispo;
    }

    public int getDispo() {
        return dispo;
    }

    public void setDispo(int dispo) {
        this.dispo = dispo;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getAuteur() {
        return auteur;
    }

    public void setAuteur(String auteur) {
        this.auteur = auteur;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
