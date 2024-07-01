package com.example.courierservice.service;

import com.example.courierservice.model.Street;

import java.util.List;

public interface StreetService {
    List<Street> findAll();
    Street findById(Integer id);
    Street save(Street street);
    void deleteById(Integer id);
}
