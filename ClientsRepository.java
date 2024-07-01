package com.example.courierservice.repository;

import com.example.courierservice.model.Clients;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClientsRepository extends JpaRepository<Clients, Integer> {
}