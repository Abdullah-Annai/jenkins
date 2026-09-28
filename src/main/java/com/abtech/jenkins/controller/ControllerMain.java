package com.abtech.jenkins.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ControllerMain {

    @GetMapping("/test")
    public String showData(){
        return "Hello from jenkins (changed)";
    }

    @GetMapping("/")
    public String home(){
        return "Hello, User";
    }


}
