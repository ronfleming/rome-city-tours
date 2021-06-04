package com.techelevator.model;

import java.math.BigDecimal;

public class Landmark {
    private int landmarkID;
    private String placeName;
    private String imageRef1;
    private String imageRef2;
    private String imageRef3;
    private String venueType;
    private String operatingHours;
    private String description;
    private BigDecimal lat;
    private BigDecimal lng;

    public Landmark() {

    }

    public int getLandmarkID() {
        return landmarkID;
    }

    public void setLandmarkID(int landmarkID) {
        this.landmarkID = landmarkID;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public String getImageRef1() {
        return imageRef1;
    }

    public void setImageRef1(String imageRef1) {
        this.imageRef1 = imageRef1;
    }

    public String getImageRef2() {
        return imageRef2;
    }

    public void setImageRef2(String imageRef2) {
        this.imageRef2 = imageRef2;
    }

    public String getImageRef3() {
        return imageRef3;
    }

    public void setImageRef3(String imageRef3) {
        this.imageRef3 = imageRef3;
    }

    public String getVenueType() {
        return venueType;
    }

    public void setVenueType(String venueType) {
        this.venueType = venueType;
    }

    public String getOperatingHours() {
        return operatingHours;
    }

    public void setOperatingHours(String operatingHours) {
        this.operatingHours = operatingHours;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getLat() {
        return lat;
    }

    public void setLat(BigDecimal lat) {
        this.lat = lat;
    }

    public BigDecimal getLng() {
        return lng;
    }

    public void setLng(BigDecimal lng) {
        this.lng = lng;
    }
}
