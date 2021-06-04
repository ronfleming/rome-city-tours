package com.techelevator.dao;

import com.techelevator.model.Itinerary;

import java.util.List;

public interface ItineraryDAO {
    void createItinerary(Itinerary itinerary);
    List<Itinerary> getItinerariesByUser(int userID);
    void updateItinerary(Itinerary itinerary);
    void deleteItineraryByItineraryID(int id);
    Itinerary getItineraryByItineraryID(int id);

}
