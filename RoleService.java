package com.example.courierservice.service;

import com.example.courierservice.model.Role;

import java.util.List;

public interface RoleService {
    List<Role> findAll();
    Role findById(Integer id);
    Role save(Role role);
    void deleteById(Integer id);
}
