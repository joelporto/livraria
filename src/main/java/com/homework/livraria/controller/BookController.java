package com.homework.livraria.controller;

import com.homework.livraria.entity.Book;
import com.homework.livraria.entity.Category;
import com.homework.livraria.services.BookService;
import com.homework.livraria.services.CategoryService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class BookController {

    @Resource
    CategoryService categoryService;

    @Resource
    BookService bookService;

    @GetMapping(value = "/categories")
    private String findAllCategories(Model model) {
        List<Category> allCategories = categoryService.findAllCategories();
        model.addAttribute("allCategories", allCategories);

        return "listaLivrosporCategoria";
    }

    @GetMapping(value = "/addlivros")
    private String crud(Model model) {
        List<Category> allCategories = categoryService.findAllCategories();
        model.addAttribute("allCategories", allCategories);

        return "addlivros";
    }

    @GetMapping(value = "/mostrarLivros")
    private String showBooks(Model model) {
        return "mostrarLivros";
    }

    @GetMapping(value = "/books/{category}")
    @ResponseBody
    private ResponseEntity<List<Book>> findAllBooksByCategory(@PathVariable String category) {
        List<Book> allBooksByCategory = bookService.findAllBooksByCategory(category);
        if (!allBooksByCategory.isEmpty()) {
            return new ResponseEntity<>(allBooksByCategory, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @GetMapping(value = "/books/byID/{id}")
    @ResponseBody
    private ResponseEntity<Book> findBooksByID(@PathVariable String id) {
        Book book = bookService.findBooksByID(id);
        if (book != null) {
            return new ResponseEntity<>(book, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }


    @DeleteMapping(value = "/book/remove/{id}")
    @ResponseBody
    private ResponseEntity<Book> removeBookByID(@PathVariable String id) {
        try {
            bookService.removeBookByID(id);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping(value = "/books")
    @ResponseBody
    private ResponseEntity<Book> createBook(@RequestBody Book book) {
        try {
            bookService.createOrUpdateBook(book);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

}
