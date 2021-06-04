<template>
  <div>
    <form v-on:submit.prevent>
      <div class="field">
        <label for="location1">Location 1</label>
        <input type="text" name="one" v-model="this.locations[0]" />
        <button v-on:click.prevent="setLocation1">Set Location 1</button><br />
        <p>{{ this.locations[0] }}</p>
        <p>{{ this.locations[0].lat }}, {{ this.locations[0].lng }}</p>
        <p>{{ this.marker.position }}</p>
        <p>{{ this.marker.position.lat }},{{ this.marker.position.lng }}</p>
        <p>{{ this.testAddress }}</p>
        <label for="location2">Location 2</label>
        <input type="text" name="two" v-model="this.locations[1]" />
        <button v-on:click.prevent="setLocation2">Set Location 2</button><br />
        <label for="location3">Location 3</label>
        <input type="text" name="three" v-model="this.locations[2]" />
        <button v-on:click.prevent="setLocation3">Set Location 3</button><br />
      </div>
    </form>
    <div class="actions">
      <button type="submit" v-on:click="saveLocations()">Save Locations</button>
    </div>
    <router-view />
    <GmapMap
      :center="location"
      :zoom="16"
      style="width: 400px; height: 400px"
      :options="{
        zoomControl: true,
        mapTypeControl: false,
        scaleControl: false,
        streetViewControl: false,
        rotateControl: false,
        fullscreenControl: true,
        scrollwheel: true,
        draggable: true,
        disableDoubleClickZoom: false,
      }"
      @click="handleMapClick"
    >
      <GmapMarker
        :position="marker.position"
        :clickable="true"
        :draggable="true"
        @drag="handleMarkerDrag"
      />
    </GmapMap>
    <h1>Our Landmarks</h1>
    <p
      v-for="landmark in this.$store.state.landmarks"
      v-bind:key="landmark.landmarkID"
    >
      {{ landmark.landmarkID }} {{ landmark.placeName }}
      {{ landmark.imageRef1 }} {{ landmark.venueType }}
      {{ landmark.operatingHours }} {{ landmark.description }} 
      {{landmark.lat}},{{landmark.lng}}
    </p>
    <h2>More Stuff!</h2>
    <p v-for="favorite in this.$store.state.favorites" v-bind:key="favorite.id">
      {{ favorite.favoriteID }} {{ favorite.userID }} {{ favorite.placeName }}
    </p>
    <div>
      <p
        v-for="place in this.$store.state.userFavoritePlaceNames"
        v-bind:key="place.name"
      >
        {{ place }}
      </p>
    </div>
    <p v-for="location in this.$store.state.locations" v-bind:key="location.id">
      {{ location }}
    </p>
  </div>
</template>

<script>
import Vue from "vue";
import tourService from "@/services/TourService.js";

export default {
  name: "Tester",
  data() {
    return {
      testItinerary: {
        userID: 1,
        itineraryName: "Day One",
        itineraryDate: "2021-05-25",
        waypoint01Longitude: 12.500714355456267,
        waypoint01Latitude: 41.90182516201605,
        waypoint02Longitude: 12.483383805309131,
        waypoint02Latitude: 41.900930597011154,
        waypoint03Longitude: 12.48303486805753,
        waypoint03Latitude: 41.8948991703933,
        waypoint04Longitude: 12.493076506733445,
        waypoint04Latitude: 41.890310287283626,
        waypoint05Longitude: null,
        waypoint05Latitude: null,
        waypoint06Longitude: null,
        waypoint06Latitude: null,
        waypoint07Longitude: null,
        waypoint07Latitude: null,
        waypoint08Longitude: null,
        waypoint08Latitude: null,
        waypoint09Longitude: null,
        waypoint09Latitude: null,
        waypoint10Longitude: null,
        waypoint10Latitude: null,
        notes: "These are my notes!",
      },
      markerLocation: [],
      testAddress: '',
      locations: [
        { location1_lat: null, location1_lng: null },
        { location2_lat: null, location2_lng: null },
        { location3_lat: null, location3_lng: null },
        { location4_lat: null, location4_lng: null },
        { location5_lat: null, location5_lng: null },
        { location6_lat: null, location6_lng: null },
        { location7_lat: null, location7_lng: null },
        { location8_lat: null, location8_lng: null },
        { location9_lat: null, location9_lng: null },
        { location10_lat: null, location10_lng: null },
      ],
      location: { lat: 41.900930597011154, lng: 12.483383805309131 },
      marker: { position: { lat: 0, lng: 0 } },
    };
  },
  methods: {
    saveLocations() {
      console.log("Locations Saved!");
    },
    handleMapClick(e) {
      this.marker.position = { lat: e.latLng.lat(), lng: e.latLng.lng() };
      this.getLocation();
    },
    handleMarkerDrag(e) {
      this.marker.position = { lat: e.latLng.lat(), lng: e.latLng.lng() };
      this.getLocation();
    },
    setLocation1() {
      this.locations[0] = this.marker.position;
    },
    setLocation2() {
      this.locations[1] = this.marker.position;
    },
    setLocation3() {
      this.locations[2] = this.marker.position;
    },
    getLocation() {
      Vue.$geocoder.send(this.marker.position, (response) => {
        let address = String(response.results[0].formatted_address);
        this.testAddress = address;
      });
    },
  },
  computed: {
    
  },
  created() {
    tourService.getAllLandmarkData().then((response) => {
      this.$store.commit("SET_LANDMARKS", response.data);
    });
    tourService.getAllFavorites().then((response) => {
      this.$store.commit("SET_FAVORITES", response.data);
    });
    this.$store.commit("SET_ACTIVE_ITINERARY", this.testItinerary);
  },
};
</script>

<style>
</style>