package com.example.courierservice.service.impl;

import com.example.courierservice.model.Street;
import com.example.courierservice.repository.StreetRepository;
import com.example.courierservice.service.StreetService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StreetServiceImpl implements StreetService {

    private final StreetRepository streetRepository;

    public StreetServiceImpl(StreetRepository streetRepository) {
        this.streetRepository = streetRepository;
    }

    @Override
    public List<Street> findAll() {
        return streetRepository.findAll();
    }

    @Override
    public Street findById(Integer id) {
        return streetRepository.findById(id).orElse(null);
    }

    @Override
    public Street save(Street street) {
        return streetRepository.save(street);
    }

    @Override
    public void deleteById(Integer id) {
        streetRepository.deleteById(id);
    }
}
