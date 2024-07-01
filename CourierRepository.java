package com.example.courierservice.repository;

import com.example.courierservice.model.Courier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourierRepository extends JpaRepository<Courier, Integer> {
    List<Courier> findByCompanyId(Integer companyId);
}
