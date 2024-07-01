package com.example.courierservice.controller;

import com.example.courierservice.model.Street;
import com.example.courierservice.service.StreetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/streets")
public class StreetController {

    @Autowired
    private StreetService streetService;

    @GetMapping
    public List<Street> getAllStreets() {
        return streetService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Street> getStreetById(@PathVariable Integer id) {
        Street street = streetService.findById(id);
        if (street != null) {
            return ResponseEntity.ok(street);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public Street createStreet(@RequestBody Street street) {
        return streetService.save(street);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Street> updateStreet(@PathVariable Integer id, @RequestBody Street streetDetails) {
        Street street = streetService.findById(id);
        if (street != null) {
            street.setStreet(streetDetails.getStreet());
            Street updatedStreet = streetService.save(street);
            return ResponseEntity.ok(updatedStreet);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteStreet(@PathVariable Integer id) {
        streetService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
