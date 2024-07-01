package com.example.courierservice.controller;

import com.example.courierservice.model.Courier;
import com.example.courierservice.model.CourierCompanyInfo;
import com.example.courierservice.requestResponse.CourierRequest;
import com.example.courierservice.service.CourierService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/couriers")
public class CourierController {

    @Autowired
    private CourierService courierService;

    @PersistenceContext
    private EntityManager entityManager;

    @GetMapping("/company/{companyId}")
    public ResponseEntity<List<Courier>> getCouriersByCompanyId(@PathVariable Integer companyId) {
        List<Courier> couriers = courierService.findByCompanyId(companyId);
        return ResponseEntity.ok(couriers);
    }

    @PostMapping
    public ResponseEntity<Courier> addCourier(@RequestBody CourierRequest courierRequest) {
        Courier courier = new Courier();
        courier.setUserId(courierRequest.getUserId());
        courier.setCompanyId(courierRequest.getCompanyId());
        Courier savedCourier = courierService.save(courier);
        return ResponseEntity.ok(savedCourier);
    }
    @GetMapping("/courier-companies-with-users")
    public ResponseEntity<List<CourierCompanyInfo>> getCourierCompanyInfo() {
        String sql = "SELECT cc.name AS companyName, u.first_name || ' ' || u.last_name AS courierName " +
                "FROM couriers c " +
                "JOIN couriercompanies cc ON c.company_id = cc.company_id " +
                "JOIN users u ON c.user_id = u.user_id";

        Query query = entityManager.createNativeQuery(sql);

        List<Object[]> results = query.getResultList();
        List<CourierCompanyInfo> infoList = results.stream()
                .map(result -> new CourierCompanyInfo((String) result[0], (String) result[1]))
                .collect(Collectors.toList());

        return ResponseEntity.ok(infoList);
    }
}
