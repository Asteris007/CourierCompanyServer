package com.example.courierservice.controller;

import com.example.courierservice.model.CourierCompany;
import com.example.courierservice.service.CourierCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/courier-companies")
public class CourierCompanyController {

    @Autowired
    private CourierCompanyService courierCompanyService;

    @GetMapping
    public List<CourierCompany> getAllCourierCompanies() {
        return courierCompanyService.findAll();
    }

    @PostMapping
    public ResponseEntity<CourierCompany> addCompany(@RequestBody CourierCompany company) {
        CourierCompany savedCompany = courierCompanyService.save(company);
        return ResponseEntity.ok(savedCompany);
    }

    @GetMapping("/{id}")
    public ResponseEntity<CourierCompany> getCourierCompanyById(@PathVariable Integer id) {
        CourierCompany courierCompany = courierCompanyService.findById(id);
        if (courierCompany != null) {
            return ResponseEntity.ok(courierCompany);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<CourierCompany> updateCourierCompany(@PathVariable Integer id, @RequestBody CourierCompany courierCompanyDetails) {
        CourierCompany courierCompany = courierCompanyService.findById(id);
        if (courierCompany != null) {
            courierCompany.setName(courierCompanyDetails.getName());
            courierCompany.setCityId(courierCompanyDetails.getCityId());
            courierCompany.setStreetId(courierCompanyDetails.getStreetId());
            courierCompany.setNumber(courierCompanyDetails.getNumber());
            courierCompany.setCreateFromAdmin(courierCompanyDetails.getCreateFromAdmin());
            CourierCompany updatedCourierCompany = courierCompanyService.save(courierCompany);
            return ResponseEntity.ok(updatedCourierCompany);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCourierCompany(@PathVariable Integer id) {
        courierCompanyService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
