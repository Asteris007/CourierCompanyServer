package com.example.courierservice.service;

import com.example.courierservice.model.Message;

import java.util.List;

public interface MessageService {
    List<Message> findAll();
    Message findById(Integer id);
    Message save(Message message);
    void deleteById(Integer id);
}
