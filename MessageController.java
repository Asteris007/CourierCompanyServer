package com.example.courierservice.controller;

import com.example.courierservice.model.Message;
import com.example.courierservice.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/messages")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @GetMapping
    public List<Message> getAllMessages() {
        return messageService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Message> getMessageById(@PathVariable Integer id) {
        Message message = messageService.findById(id);
        if (message != null) {
            return ResponseEntity.ok(message);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public Message createMessage(@RequestBody Message message) {
        return messageService.save(message);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Message> updateMessage(@PathVariable Integer id, @RequestBody Message messageDetails) {
        Message message = messageService.findById(id);
        if (message != null) {
            message.setMessageText(messageDetails.getMessageText());
            Message updatedMessage = messageService.save(message);
            return ResponseEntity.ok(updatedMessage);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteMessage(@PathVariable Integer id) {
        messageService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
