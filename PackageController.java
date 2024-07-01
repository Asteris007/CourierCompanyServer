package com.example.courierservice.controller;

import com.example.courierservice.model.Package;
import com.example.courierservice.service.PackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/packages")
public class PackageController {

    @Autowired
    private PackageService packageService;

    @GetMapping
    public List<Package> getAllPackages() {
        return packageService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Package> getPackageById(@PathVariable Integer id) {
        Package pkg = packageService.findById(id);
        if (pkg != null) {
            return ResponseEntity.ok(pkg);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public Package createPackage(@RequestBody Package pkg) {
        return packageService.save(pkg);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Package> updatePackage(@PathVariable Integer id, @RequestBody Package packageDetails) {
        Package pkg = packageService.findById(id);
        if (pkg != null) {
            pkg.setClientId(packageDetails.getClientId());
            pkg.setCourierId(packageDetails.getCourierId());
            packageDetails.setRegistrationDate(pkg.getRegistrationDate());
            pkg.setDeliveryDate(packageDetails.getDeliveryDate());
            pkg.setPackageTypeId(packageDetails.getPackageTypeId());
            pkg.setStatusId(packageDetails.getStatusId());
            pkg.setPriceId(packageDetails.getPriceId());
            pkg.setCashOnDelivery(packageDetails.getCashOnDelivery());
            Package updatedPackage = packageService.save(pkg);
            return ResponseEntity.ok(updatedPackage);
        } else {
            return ResponseEntity.notFound().build();
        }
    }


}
