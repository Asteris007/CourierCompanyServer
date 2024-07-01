package com.example.courierservice.controller;

import com.example.courierservice.model.Office;
import com.example.courierservice.service.OfficeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/offices")
public class OfficeController {

    @Autowired
    private OfficeService officeService;

    @GetMapping
    public List<Office> getAllOffices() {
        return officeService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Office> getOfficeById(@PathVariable Integer id) {
        Office office = officeService.findById(id);
        if (office != null) {
            return ResponseEntity.ok(office);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public Office createOffice(@RequestBody Office office) {
        return officeService.save(office);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Office> updateOffice(@PathVariable Integer id, @RequestBody Office officeDetails) {
        Office office = officeService.findById(id);
        if (office != null) {
            office.setCompanyId(officeDetails.getCompanyId());
            office.setCityId(officeDetails.getCityId());
            office.setStreetId(officeDetails.getStreetId());
            office.setNumber(officeDetails.getNumber());
            Office updatedOffice = officeService.save(office);
            return ResponseEntity.ok(updatedOffice);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOffice(@PathVariable Integer id) {
        officeService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
