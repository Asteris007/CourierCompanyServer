package com.example.courierservice.service;

import com.example.courierservice.model.Status;

import java.util.List;

public interface StatusService {
    List<Status> findAll();
    Status findById(Integer id);
    Status save(Status status);
    void deleteById(Integer id);
}
