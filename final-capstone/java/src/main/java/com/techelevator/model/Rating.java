package com.techelevator.model;

public class Rating {
    private int ratingID;
    private String placeName;
    private int userID;
    private int rating; // 1 or -1

    public Rating() {

    }

    public Rating(String placeName, int userID, int rating) {
        this.placeName = placeName;
        this.userID = userID;
        this.rating = rating;
    }

    public int getRatingID() {
        return ratingID;
    }

    public void setRatingID(int ratingID) {
        this.ratingID = ratingID;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
}
