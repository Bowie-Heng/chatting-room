package com.bowie.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    @Value("${user}")
    private String user;

    @Value("${websocket.address}")
    private String websocketAddress;

    @RequestMapping(value = "/talk",method = RequestMethod.GET)
    public String index(Model model){
        model.addAttribute("name", user);
        model.addAttribute("address", websocketAddress);
        return "index";
    }
}
