package com.example.courierservice.service.impl;

import com.example.courierservice.model.Package;
import com.example.courierservice.repository.PackageRepository;
import com.example.courierservice.service.PackageService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PackageServiceImpl implements PackageService {

    private final PackageRepository packageRepository;

    public PackageServiceImpl(PackageRepository packageRepository) {
        this.packageRepository = packageRepository;
    }

    @Override
    public List<Package> findAll() {
        return packageRepository.findAll();
    }

    @Override
    public Package findById(Integer id) {
        return packageRepository.findById(id).orElse(null);
    }

    @Override
    public Package save(Package pkg) {
        return packageRepository.save(pkg);
    }

}
