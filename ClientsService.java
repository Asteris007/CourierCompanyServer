package com.example.courierservice.service;

import com.example.courierservice.model.Clients;
import java.util.List;

public interface ClientsService {
    List<Clients> findAll();
    Clients findById(Integer id);
    Clients save(Clients client);
    void deleteById(Integer id);
}