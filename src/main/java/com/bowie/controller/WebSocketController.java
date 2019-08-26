package com.bowie.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
public class WebSocketController {
    @Autowired
    WebSocketServer server;
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(String username) throws IOException {
        server.sendInfo(username + "进入了聊天室!");
        return username;
    }
}
