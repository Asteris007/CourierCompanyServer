package com.example.courierservice.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "packages")
public class Package {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer packageId;

    @Column(nullable = false)
    private Integer clientId;

    @Column(nullable = false)
    private Integer courierId;

    @Column(nullable = false)
    private String registrationDate;

    @Column(nullable = false)
    private String deliveryDate;

    @Column(nullable = false)
    private Integer packageTypeId;

    @Column(nullable = false)
    private Integer statusId;

    @Column(nullable = false)
    private Integer priceId;

    @Column(nullable = false)
    private Boolean cashOnDelivery;

    // Getters and setters
    public Integer getPackageId() {
        return packageId;
    }

    public void setPackageId(Integer packageId) {
        this.packageId = packageId;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Integer getCourierId() {
        return courierId;
    }

    public void setCourierId(Integer courierId) {
        this.courierId = courierId;
    }

    public String getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(String registrationDate) {
        this.registrationDate = registrationDate;
    }

    public String getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(String deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public Integer getPackageTypeId() {
        return packageTypeId;
    }

    public void setPackageTypeId(Integer packageTypeId) {
        this.packageTypeId = packageTypeId;
    }

    public Integer getStatusId() {
        return statusId;
    }

    public void setStatusId(Integer statusId) {
        this.statusId = statusId;
    }

    public Integer getPriceId() {
        return priceId;
    }

    public void setPriceId(Integer priceId) {
        this.priceId = priceId;
    }

    public Boolean getCashOnDelivery() {
        return cashOnDelivery;
    }

    public void setCashOnDelivery(Boolean cashOnDelivery) {
        this.cashOnDelivery = cashOnDelivery;
    }
}
