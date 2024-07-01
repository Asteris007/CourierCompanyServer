package com.example.courierservice.repository;

import com.example.courierservice.model.PackageType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PackageTypeRepository extends JpaRepository<PackageType, Integer> {
}
