package com.example.courierservice.service;

import com.example.courierservice.model.Package;

import java.util.List;

public interface PackageService {
    List<Package> findAll();
    Package findById(Integer id);
    Package save(Package pkg);

}
