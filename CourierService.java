package com.example.courierservice.service;

import com.example.courierservice.model.Courier;

import java.util.List;

public interface CourierService {
    List<Courier> findByCompanyId(Integer companyId);
    Courier save(Courier courier);
}
