package com.example.courierservice.controller;

import com.example.courierservice.model.Status;
import com.example.courierservice.service.StatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/statuses")
public class StatusController {

    @Autowired
    private StatusService statusService;

    @GetMapping
    public List<Status> getAllStatuses() {
        return statusService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Status> getStatusById(@PathVariable Integer id) {
        Status status = statusService.findById(id);
        if (status != null) {
            return ResponseEntity.ok(status);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    public Status createStatus(@RequestBody Status status) {
        return statusService.save(status);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Status> updateStatus(@PathVariable Integer id, @RequestBody Status statusDetails) {
        Status status = statusService.findById(id);
        if (status != null) {
            status.setStatus(statusDetails.getStatus());
            Status updatedStatus = statusService.save(status);
            return ResponseEntity.ok(updatedStatus);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteStatus(@PathVariable Integer id) {
        statusService.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
