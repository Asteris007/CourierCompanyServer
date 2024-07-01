package com.example.courierservice.service;

import com.example.courierservice.model.CourierCompany;

import java.util.List;

public interface CourierCompanyService {
    List<CourierCompany> findAll();
    CourierCompany findById(Integer id);
    CourierCompany save(CourierCompany courierCompany);
    void deleteById(Integer id);

    CourierCompany findByName(String name);
}
