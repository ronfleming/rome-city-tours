import axios from 'axios';

const http = axios.create({
  baseURL: "http://localhost:8080"
});

export default {

getPlaceRating(placeName) {
    return http.get('/ratings', placeName);
},

addPlaceRating(rating) {
    return http.post('/ratings', rating);
},

getAllFavorites() {
    return http.get('/favorites');
},

addFavorite(favorite) {
    return http.post('/favorites', favorite);
},

getFavoritesByUserID(userID) {
    return http.get(`/favorites/${userID}`);
},

deleteFavorite(favoriteID) {
    return http.delete(`/favorites/${favoriteID}`);
},

addItinerary(itinerary) {
    return http.post('/itineraries', itinerary);
},

getItinerariesByUserID(userID) {
    return http.get(`/itineraries/${userID}`);
},

updateItinerary(itinerary) {
    return http.put('/itineraries', itinerary);
},

deleteItinerary(itineraryID) {
    return http.delete(`/itineraries/${itineraryID}`);
},

getAllLandmarkData() {
    return http.get('/landmarks');
},

getLandmarkByLandmarkID(landmarkID) {
    return http.get(`/landmarks/${landmarkID}`);
},

getUserIDByUsername(username) {
    return http.get('/users', username);
},

getItineraryByItineraryID(id) {
    return http.get(`/itinerary/${id}`);
}


}