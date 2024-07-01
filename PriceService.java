package com.example.courierservice.service;

import com.example.courierservice.model.Price;

import java.util.List;

public interface PriceService {
    List<Price> findAll();
    Price findById(Integer id);
    Price save(Price price);
    void deleteById(Integer id);
}
