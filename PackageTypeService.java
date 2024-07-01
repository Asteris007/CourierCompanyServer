package com.example.courierservice.service;

import com.example.courierservice.model.PackageType;

import java.util.List;

public interface PackageTypeService {
    List<PackageType> findAll();
    PackageType findById(Integer id);
    PackageType save(PackageType packageType);
    void deleteById(Integer id);
}
