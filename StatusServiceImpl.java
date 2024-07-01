package com.example.courierservice.service.impl;

import com.example.courierservice.model.Status;
import com.example.courierservice.repository.StatusRepository;
import com.example.courierservice.service.StatusService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatusServiceImpl implements StatusService {

    private final StatusRepository statusRepository;

    public StatusServiceImpl(StatusRepository statusRepository) {
        this.statusRepository = statusRepository;
    }

    @Override
    public List<Status> findAll() {
        return statusRepository.findAll();
    }

    @Override
    public Status findById(Integer id) {
        return statusRepository.findById(id).orElse(null);
    }

    @Override
    public Status save(Status status) {
        return statusRepository.save(status);
    }

    @Override
    public void deleteById(Integer id) {
        statusRepository.deleteById(id);
    }
}
