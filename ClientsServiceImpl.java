package com.example.courierservice.service.impl;

import com.example.courierservice.model.Clients;
import com.example.courierservice.repository.ClientsRepository;
import com.example.courierservice.service.ClientsService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientsServiceImpl implements ClientsService {

    private final ClientsRepository clientsRepository;

    public ClientsServiceImpl(ClientsRepository clientsRepository) {
        this.clientsRepository = clientsRepository;
    }

    @Override
    public List<Clients> findAll() {
        return clientsRepository.findAll();
    }

    @Override
    public Clients findById(Integer id) {
        return clientsRepository.findById(id).orElse(null);
    }

    @Override
    public Clients save(Clients client) {
        return clientsRepository.save(client);
    }

    @Override
    public void deleteById(Integer id) {
        clientsRepository.deleteById(id);
    }
}
