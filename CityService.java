package com.example.courierservice.service;

import com.example.courierservice.model.City;
import java.util.List;

public interface CityService {
    List<City> findAll();
    City findById(Integer id);
    City save(City city);
    void deleteById(Integer id);
}
