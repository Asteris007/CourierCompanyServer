package com.example.courierservice.model;

import jakarta.persistence.*;

@Entity
@Table(name = "package_type")
public class PackageType {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer packageTypeId;

    @Column(nullable = false, length = 50)
    private String packageTypeName;

    // Getters and setters
    public Integer getPackageTypeId() {
        return packageTypeId;
    }

    public void setPackageTypeId(Integer packageTypeId) {
        this.packageTypeId = packageTypeId;
    }

    public String getPackageTypeName() {
        return packageTypeName;
    }

    public void setPackageTypeName(String packageTypeName) {
        this.packageTypeName = packageTypeName;
    }
}
