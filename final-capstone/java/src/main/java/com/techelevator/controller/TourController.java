package com.techelevator.controller;

import com.techelevator.dao.*;
import com.techelevator.model.Favorite;
import com.techelevator.model.Itinerary;
import com.techelevator.model.Landmark;
import com.techelevator.model.Rating;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@PreAuthorize("isAuthenticated()")
@CrossOrigin
@RestController
public class TourController {

    @Autowired
    private ItineraryDAO itineraryDAO;

    @Autowired
    private FavoriteDAO favoriteDAO;

    @Autowired
    private RatingDAO ratingDAO;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private LandmarkDAO landmarkDAO;

    @ResponseStatus(HttpStatus.OK)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/ratings", method = RequestMethod.GET)
    public int getRating(@RequestParam String placeName) {
        int rating = ratingDAO.getPlaceRating(placeName);
        return rating;
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/ratings", method = RequestMethod.POST)
    public void addPlaceRating(@RequestBody Rating rating) {
        ratingDAO.addPlaceRating(rating);
    }

    @ResponseStatus(HttpStatus.ACCEPTED)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/ratings", method = RequestMethod.PUT)
    public void updatePlaceRating(@RequestBody Rating rating) {
        ratingDAO.updatePlaceRating(rating);
    }

    @ResponseStatus(HttpStatus.OK)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/favorites", method = RequestMethod.GET)
    public List<Favorite> getAllFavorites() {
        return favoriteDAO.getAllFavorites();
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/favorites", method = RequestMethod.POST)
    public void addFavorite(@RequestBody Favorite favorite) {
        favoriteDAO.addFavorite(favorite);
    }

    @ResponseStatus(HttpStatus.OK)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/favorites/{id}", method = RequestMethod.GET)
    public List<Favorite> getFavoritesByUserID(@PathVariable int id) {
        System.out.println(id);
        return favoriteDAO.getFavoritesByUserID(id);
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/favorites/{id}", method = RequestMethod.DELETE)
    public void deleteFavorite(@PathVariable int id) {
        favoriteDAO.deleteFavorite(id);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/itineraries", method = RequestMethod.POST)
    public void addItinerary(@RequestBody Itinerary itinerary) {
        itineraryDAO.createItinerary(itinerary);
    }

    @ResponseStatus(HttpStatus.OK)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/itineraries/{id}", method = RequestMethod.GET)
    public List<Itinerary> getItinerariesByUserID(@PathVariable int id) {
        return itineraryDAO.getItinerariesByUser(id);
    }

    @ResponseStatus(HttpStatus.ACCEPTED)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/itineraries", method = RequestMethod.PUT)
    public void updateItinerary(@RequestBody Itinerary itinerary) {
        itineraryDAO.updateItinerary(itinerary);
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/itineraries/{id}", method = RequestMethod.DELETE)
    public void deleteItinerary(@PathVariable int id) {
        itineraryDAO.deleteItineraryByItineraryID(id);
    }

    @ResponseStatus(HttpStatus.OK)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/itinerary/{id}", method = RequestMethod.GET)
    public Itinerary getItineraryByItineraryID(@PathVariable int id) {
        return itineraryDAO.getItineraryByItineraryID(id);
    }

    @ResponseStatus(HttpStatus.OK)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/landmarks", method = RequestMethod.GET)
    public List<Landmark> getLandmarkData() {
        return landmarkDAO.getLandmarksData();
    }

    @ResponseStatus(HttpStatus.OK)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/landmarks/{landmarkID}", method = RequestMethod.GET)
    public Landmark getLandmarkByLandmarkID(@PathVariable int landmarkID) {
        return landmarkDAO.getLandmarkByLandmarkID(landmarkID);
    }

    @ResponseStatus(HttpStatus.OK)
    @PreAuthorize("permitAll")
    @RequestMapping(path = "/users", method = RequestMethod.GET)
    public int getUserIDByUsername(String username) {
        return userDAO.findIdByUsername(username);
    }
}
