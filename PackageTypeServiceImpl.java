package com.example.courierservice.service.impl;

import com.example.courierservice.model.PackageType;
import com.example.courierservice.repository.PackageTypeRepository;
import com.example.courierservice.service.PackageTypeService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PackageTypeServiceImpl implements PackageTypeService {

    private final PackageTypeRepository packageTypeRepository;

    public PackageTypeServiceImpl(PackageTypeRepository packageTypeRepository) {
        this.packageTypeRepository = packageTypeRepository;
    }

    @Override
    public List<PackageType> findAll() {
        return packageTypeRepository.findAll();
    }

    @Override
    public PackageType findById(Integer id) {
        return packageTypeRepository.findById(id).orElse(null);
    }

    @Override
    public PackageType save(PackageType packageType) {
        return packageTypeRepository.save(packageType);
    }

    @Override
    public void deleteById(Integer id) {
        packageTypeRepository.deleteById(id);
    }
}
