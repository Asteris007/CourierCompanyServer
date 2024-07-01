package com.example.courierservice.service.impl;

import com.example.courierservice.model.Courier;
import com.example.courierservice.repository.CourierRepository;
import com.example.courierservice.service.CourierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourierServiceImpl implements CourierService {

    @Autowired
    private CourierRepository courierRepository;

    @Override
    public List<Courier> findByCompanyId(Integer companyId) {
        return courierRepository.findByCompanyId(companyId);
    }

    @Override
    public Courier save(Courier courier) {
        return courierRepository.save(courier);
    }
}
