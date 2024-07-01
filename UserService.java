package com.example.courierservice.service;

import com.example.courierservice.model.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    User findById(Integer id);
    User save(User user);
    void deleteById(Integer id);
    User findByUsernameAndPassword(String username, String password);
}
