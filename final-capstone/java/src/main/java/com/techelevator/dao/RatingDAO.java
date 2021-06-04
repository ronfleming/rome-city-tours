package com.techelevator.dao;

import com.techelevator.model.Rating;

public interface RatingDAO {
    int getPlaceRating(String placeName);
    void addPlaceRating(Rating rating);
    void updatePlaceRating(Rating rating);
}
