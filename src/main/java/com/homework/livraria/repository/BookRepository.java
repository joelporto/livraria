package com.homework.livraria.repository;

import com.homework.livraria.entity.Book;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BookRepository extends CrudRepository<Book, String> {

    public List<Book> findBookByCategoria(String category);
}
