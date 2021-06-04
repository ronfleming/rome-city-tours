package com.techelevator.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Itinerary {
    private int itineraryID;
    private int userID;
    private String itineraryName;
    private LocalDate itineraryDate; // Format 'yyyy-mm-dd'
    // can use .of and defaults representation as (yyyy, mm, dd).
    // Also DateTimeFormatter targetFormat - DateTimeFormatter.ofPattern("MM/dd/yyyy hh:mm a") if needed, such that
    // currentDateTime.format(targetFormat) renders the format.
    private int location1;
    private int location2;
    private int location3;
    private int location4;
    private int location5;
    private int location6;
    private int location7;
    private int location8;
    private int location9;
    private int location10;
    private String notes;

    public Itinerary () {

    }

    public int getItineraryID() {
        return itineraryID;
    }

    public void setItineraryID(int itineraryID) {
        this.itineraryID = itineraryID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getItineraryName() {
        return itineraryName;
    }

    public void setItineraryName(String itineraryName) {
        this.itineraryName = itineraryName;
    }

    public LocalDate getItineraryDate() {
        return itineraryDate;
    }

    public void setItineraryDate(LocalDate itineraryDate) {
        this.itineraryDate = itineraryDate;
    }

    public int getLocation1() {
        return location1;
    }

    public void setLocation1(int location1) {
        this.location1 = location1;
    }

    public int getLocation2() {
        return location2;
    }

    public void setLocation2(int location2) {
        this.location2 = location2;
    }

    public int getLocation3() {
        return location3;
    }

    public void setLocation3(int location3) {
        this.location3 = location3;
    }

    public int getLocation4() {
        return location4;
    }

    public void setLocation4(int location4) {
        this.location4 = location4;
    }

    public int getLocation5() {
        return location5;
    }

    public void setLocation5(int location5) {
        this.location5 = location5;
    }

    public int getLocation6() {
        return location6;
    }

    public void setLocation6(int location6) {
        this.location6 = location6;
    }

    public int getLocation7() {
        return location7;
    }

    public void setLocation7(int location7) {
        this.location7 = location7;
    }

    public int getLocation8() {
        return location8;
    }

    public void setLocation8(int location8) {
        this.location8 = location8;
    }

    public int getLocation9() {
        return location9;
    }

    public void setLocation9(int location9) {
        this.location9 = location9;
    }

    public int getLocation10() {
        return location10;
    }

    public void setLocation10(int location10) {
        this.location10 = location10;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
