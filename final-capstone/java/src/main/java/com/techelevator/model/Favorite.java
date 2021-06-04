package com.techelevator.model;

public class Favorite {
    private int favoriteID;
    private int userID;
    private String placeName;
    private boolean isFavorite;

    public Favorite() {

    }

    public Favorite(int userID, String placeName, boolean isFavorite) {
        this.userID = userID;
        this.placeName = placeName;
        this.isFavorite = isFavorite;
    }

    public int getFavoriteID() {
        return favoriteID;
    }

    public void setFavoriteID(int favoriteID) {
        this.favoriteID = favoriteID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public boolean isFavorite() {
        return isFavorite;
    }

    public void setFavorite(boolean favorite) {
        isFavorite = favorite;
    }
}
