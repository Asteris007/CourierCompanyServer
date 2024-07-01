package com.example.courierservice.service.impl;

import com.example.courierservice.model.Price;
import com.example.courierservice.repository.PriceRepository;
import com.example.courierservice.service.PriceService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PriceServiceImpl implements PriceService {

    private final PriceRepository priceRepository;

    public PriceServiceImpl(PriceRepository priceRepository) {
        this.priceRepository = priceRepository;
    }

    @Override
    public List<Price> findAll() {
        return priceRepository.findAll();
    }

    @Override
    public Price findById(Integer id) {
        return priceRepository.findById(id).orElse(null);
    }

    @Override
    public Price save(Price price) {
        return priceRepository.save(price);
    }

    @Override
    public void deleteById(Integer id) {
        priceRepository.deleteById(id);
    }
}
