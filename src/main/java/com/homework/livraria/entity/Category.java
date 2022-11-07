package com.homework.livraria.entity;


import javax.persistence.*;

@Entity
@Table(name = "tbcategorias")
public class Category {

    @Id
    private String categoria;

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
}
