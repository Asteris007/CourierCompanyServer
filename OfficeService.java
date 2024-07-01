package com.example.courierservice.service;

import com.example.courierservice.model.Office;

import java.util.List;

public interface OfficeService {
    List<Office> findAll();
    Office findById(Integer id);
    Office save(Office office);
    void deleteById(Integer id);
}
