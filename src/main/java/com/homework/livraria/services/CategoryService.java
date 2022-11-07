package com.homework.livraria.services;

import com.homework.livraria.entity.Category;
import com.homework.livraria.repository.CategoryRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CategoryService {

    @Resource
    CategoryRepository categoryRepository;


    public List<Category> findAllCategories() {
        Iterable<Category> categories = categoryRepository.findAll();
        return (List<Category>) categories;
    }


}
