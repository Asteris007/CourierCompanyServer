package com.example.courierservice.service.impl;

import com.example.courierservice.model.CourierCompany;
import com.example.courierservice.repository.CourierCompanyRepository;
import com.example.courierservice.service.CourierCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CourierCompanyServiceImpl implements CourierCompanyService {

    @Autowired
    private CourierCompanyRepository courierCompanyRepository;

    @Override
    public List<CourierCompany> findAll() {
        return courierCompanyRepository.findAll();
    }

    @Override
    public CourierCompany findById(Integer id) {
        Optional<CourierCompany> result = courierCompanyRepository.findById(id);
        return result.orElse(null);
    }

    @Override
    public CourierCompany save(CourierCompany courierCompany) {
        return courierCompanyRepository.save(courierCompany);
    }

    @Override
    public void deleteById(Integer id) {
        courierCompanyRepository.deleteById(id);
    }

    @Override
    public CourierCompany findByName(String name) {
        return courierCompanyRepository.findByName(name);
    }
}