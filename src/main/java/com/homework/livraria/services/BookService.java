package com.homework.livraria.services;

import com.homework.livraria.entity.Book;
import com.homework.livraria.repository.BookRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Optional;

@Service
public class BookService {

    @Resource
    private BookRepository bookRepository;

    public List<Book> findAllBooksByCategory(final String category) {
        return bookRepository.findBookByCategoria(category);

    }

    public Book findBooksByID(String id) {
        Optional<Book> bookOptional = bookRepository.findById(id);
        return bookOptional.orElse(null);
    }

    public void createOrUpdateBook(Book book) {
        Optional<Book> bookOptional = bookRepository.findById(book.getCodlivro());
        if (bookOptional.isPresent()) {
            Book b = bookOptional.get();
            b.setAutor(book.getAutor());
            b.setTitulo(book.getTitulo());
            b.setValor(book.getValor());
            b.setCategoria(book.getCategoria());
            bookRepository.save(b);

        } else {
            bookRepository.save(book);
        }
    }


    public void removeBookByID(String id) {
        bookRepository.deleteById(id);
    }
}
