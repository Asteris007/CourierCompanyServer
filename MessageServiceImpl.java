package com.example.courierservice.service.impl;

import com.example.courierservice.model.Message;
import com.example.courierservice.repository.MessageRepository;
import com.example.courierservice.service.MessageService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    private final MessageRepository messageRepository;

    public MessageServiceImpl(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    @Override
    public List<Message> findAll() {
        return messageRepository.findAll();
    }

    @Override
    public Message findById(Integer id) {
        return messageRepository.findById(id).orElse(null);
    }

    @Override
    public Message save(Message message) {
        return messageRepository.save(message);
    }

    @Override
    public void deleteById(Integer id) {
        messageRepository.deleteById(id);
    }
}
