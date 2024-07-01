package com.example.courierservice.controller;

import com.example.courierservice.model.PackageType;
import com.example.courierservice.service.PackageTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/package-types")
public class PackageTypeController {

    @Autowired
    private PackageTypeService packageTypeService;

    @GetMapping
    public List<PackageType> getAllPackageTypes() {
        return packageTypeService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<PackageType> getPackageTypeById(@PathVariable Integer id) {
        PackageType packageType = packageTypeService.findById(id);
        if (packageType != null) {
            return ResponseEntity.ok(packageType);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public PackageType createPackageType(@RequestBody PackageType packageType) {
        return packageTypeService.save(packageType);
    }

    @PutMapping("/{id}")
    public ResponseEntity<PackageType> updatePackageType(@PathVariable Integer id, @RequestBody PackageType packageTypeDetails) {
        PackageType packageType = packageTypeService.findById(id);
        if (packageType != null) {
            packageType.setPackageTypeName(packageTypeDetails.getPackageTypeName());
            PackageType updatedPackageType = packageTypeService.save(packageType);
            return ResponseEntity.ok(updatedPackageType);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePackageType(@PathVariable Integer id) {
        packageTypeService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
