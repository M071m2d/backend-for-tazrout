package com.tazrout.tazrout_backend;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/api/v1/")
public class router {
    @GetMapping("")
    public static String hello(String[] args) {
        return "hello world";
    }   
}
