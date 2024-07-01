package com.example.courierservice.service.impl;

import com.example.courierservice.model.City;
import com.example.courierservice.repository.CityRepository;
import com.example.courierservice.service.CityService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CityServiceImpl implements CityService {

    private final CityRepository cityRepository;

    public CityServiceImpl(CityRepository cityRepository) {
        this.cityRepository = cityRepository;
    }

    @Override
    public List<City> findAll() {
        return cityRepository.findAll();
    }

    @Override
    public City findById(Integer id) {
        return cityRepository.findById(id).orElse(null);
    }

    @Override
    public City save(City city) {
        return cityRepository.save(city);
    }

    @Override
    public void deleteById(Integer id) {
        cityRepository.deleteById(id);
    }
}
