package com.example.courierservice.model;

import jakarta.persistence.*;

@Entity
@Table(name = "clients")
public class Clients {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer clientId;

    @Column(nullable = false)
    private Integer userId;

    @Column(nullable = false)
    private Integer cityId;

    @Column(nullable = false)
    private Integer streetId;

    @Column(nullable = false)
    private Integer recordedByCourier;

    @Column(nullable = false)
    private Integer numberStreet;

    // Getters and setters
    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public Integer getStreetId() {
        return streetId;
    }

    public void setStreetId(Integer streetId) {
        this.streetId = streetId;
    }

    public Integer getRecordedByCourier() {
        return recordedByCourier;
    }

    public void setRecordedByCourier(Integer recordedByCourier) {
        this.recordedByCourier = recordedByCourier;
    }

    public Integer getNumberStreet() {
        return numberStreet;
    }

    public void setNumberStreet(Integer numberStreet) {
        this.numberStreet = numberStreet;
    }
}
