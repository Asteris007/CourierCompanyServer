package com.example.courierservice.model;

public class CourierCompanyInfo {
    private String companyName;
    private String courierName;

    public CourierCompanyInfo(String companyName, String courierName) {
        this.companyName = companyName;
        this.courierName = courierName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCourierName() {
        return courierName;
    }

    public void setCourierName(String courierName) {
        this.courierName = courierName;
    }
}
