package com.homework.livraria.entity;

import javax.persistence.*;

@Entity
@Table(name = "tblivros")
public class Book {

    @Id
    private String codlivro;
    private String titulo;
    private String autor;
    private String categoria;
    private String valor;

    public String getCodlivro() {
        return codlivro;
    }

    public void setCodlivro(String codlivro) {
        this.codlivro = codlivro;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }
}
