import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
//import tourService from '@/services/TourService.js'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if (currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    favorites: [],
    userFavorites: [],
    userFavoritePlaceNames: [],
    ratings: [],
    activeItinerary: {},
    userItineraries: [],
    landmarks: [],
    locations: [],
    matrixLocations: [],
    activeLandmarks: [],
    activeMarkers: [],
    activeCenter: [],


  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user', JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_FAVORITES(state, favorites) {
      state.favorites = favorites;
      state.userFavorites = favorites.filter((favorite) => {
        return favorite.userID === state.user.id;
      });
      state.userFavoritePlaceNames = state.userFavorites.map((favorite) => {
        return favorite.placeName;
      });
    },
    SET_RATINGS(state, ratings) {
      state.ratings = ratings;
    },
    SET_ACTIVE_ITINERARY(state, itinerary) {
      state.activeLandmarks = [];
      state.activeMarkers = [];
      state.activeItinerary = itinerary;
      state.locations = [
        itinerary.location1,
        itinerary.location2,
        itinerary.location3,
        itinerary.location4,
        itinerary.location5,
        itinerary.location6,
        itinerary.location7,
        itinerary.location8,
        itinerary.location9,
        itinerary.location10,
      ];
      
      state.locations = state.locations.filter((location) => {
        return location != null && location != 0;
      })
      state.locations.forEach((location) => {
        const filteredLandmark = state.landmarks.find((landmark) => {
          return landmark.landmarkID == location;
        });
        state.activeLandmarks.push(filteredLandmark);
      });
      state.activeLandmarks.forEach((landmark) => {
         const marker = {
          lat: landmark.lat,
          lng: landmark.lng,
        };
        state.activeMarkers.push({position: marker});
      });
      
      let centerLat = 0;
      let centerLng = 0;

      state.activeLandmarks.forEach((landmark) => {
        centerLat += landmark.lat;
        centerLng += landmark.lng;

      });
      centerLat = centerLat / state.activeLandmarks.length;
      centerLng = centerLng / state.activeLandmarks.length;
      state.activeCenter = { lat: centerLat, lng: centerLng };

    },
    SET_ACTIVE_ITINERARY_ID(state, id) {
      state.activeItineraryID = id;
    },

    SET_USER_ITINERARIES(state, userItineraries) {
      state.userItineraries = userItineraries;

    },
    SET_LANDMARKS(state, landmarks) {
      state.landmarks = landmarks;
    },
    SET_LOCATIONS(state, locations) {
      state.locations = locations;
    },
  }
})
