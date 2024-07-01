package com.example.courierservice.controller;

import com.example.courierservice.model.Price;
import com.example.courierservice.service.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/prices")
public class PriceController {

    @Autowired
    private PriceService priceService;

    @GetMapping
    public List<Price> getAllPrices() {
        return priceService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Price> getPriceById(@PathVariable Integer id) {
        Price price = priceService.findById(id);
        if (price != null) {
            return ResponseEntity.ok(price);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public Price createPrice(@RequestBody Price price) {
        return priceService.save(price);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Price> updatePrice(@PathVariable Integer id, @RequestBody Price priceDetails) {
        Price price = priceService.findById(id);
        if (price != null) {
            price.setPriceName(priceDetails.getPriceName());
            price.setPrice(priceDetails.getPrice());
            Price updatedPrice = priceService.save(price);
            return ResponseEntity.ok(updatedPrice);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePrice(@PathVariable Integer id) {
        priceService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
