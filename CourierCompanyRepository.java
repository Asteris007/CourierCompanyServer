package com.example.courierservice.repository;

import com.example.courierservice.model.CourierCompany;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CourierCompanyRepository extends JpaRepository<CourierCompany, Integer> {
    CourierCompany findByName(String name);}

