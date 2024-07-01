package com.example.courierservice.service.impl;

import com.example.courierservice.model.Office;
import com.example.courierservice.repository.OfficeRepository;
import com.example.courierservice.service.OfficeService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OfficeServiceImpl implements OfficeService {

    private final OfficeRepository officeRepository;

    public OfficeServiceImpl(OfficeRepository officeRepository) {
        this.officeRepository = officeRepository;
    }

    @Override
    public List<Office> findAll() {
        return officeRepository.findAll();
    }

    @Override
    public Office findById(Integer id) {
        return officeRepository.findById(id).orElse(null);
    }

    @Override
    public Office save(Office office) {
        return officeRepository.save(office);
    }

    @Override
    public void deleteById(Integer id) {
        officeRepository.deleteById(id);
    }
}
