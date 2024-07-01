package com.example.courierservice.service;

import com.example.courierservice.model.Notification;
import java.util.List;

public interface NotificationService {
    List<Notification> findAll();
    Notification findById(Integer id);
    Notification save(Notification notification);
    void deleteById(Integer id);
}
