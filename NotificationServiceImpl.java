package com.example.courierservice.service.impl;

import com.example.courierservice.model.Notification;
import com.example.courierservice.repository.NotificationRepository;
import com.example.courierservice.service.NotificationService;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class NotificationServiceImpl implements NotificationService {

    private final NotificationRepository notificationRepository;

    public NotificationServiceImpl(NotificationRepository notificationRepository) {
        this.notificationRepository = notificationRepository;
    }

    @Override
    public List<Notification> findAll() {
        return notificationRepository.findAll();
    }

    @Override
    public Notification findById(Integer id) {
        return notificationRepository.findById(id).orElse(null);
    }

    @Override
    public Notification save(Notification notification) {
        return notificationRepository.save(notification);
    }

    @Override
    public void deleteById(Integer id) {
        notificationRepository.deleteById(id);
    }
}
