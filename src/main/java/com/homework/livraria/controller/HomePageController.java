package com.homework.livraria.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePageController {

    @GetMapping(name = "/")
    public String HomePage() {
        return "index";
    }
}
