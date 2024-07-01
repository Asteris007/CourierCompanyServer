package com.example.courierservice.model;

import jakarta.persistence.*;



@Entity
@Table(name = "couriercompanies")
public class CourierCompany {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer companyId;

    private String name;
    private Integer cityId;
    private Integer streetId;
    private String number;
    private Boolean createFromAdmin;



    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Boolean getCreateFromAdmin() {
        return createFromAdmin;
    }

    public void setCreateFromAdmin(Boolean createFromAdmin) {
        this.createFromAdmin = createFromAdmin;
    }
}
