<template>
  <div class="itinerary">
    <Itinerary :key="componentKey" />
    <h1>{{ this.$store.state.activeItinerary.itineraryName }}</h1>
    <h3>Date of Trip: {{ this.$store.state.activeItinerary.itineraryDate }}</h3>
    <br />
    <GmapMap
      :center="this.$store.state.activeCenter"
      :zoom="14"
      map-type-id="terrain"
      style="width: 100%; height: 600px"
      :options="{
        zoomControl: true,
        mapTypeControl: false,
        scaleControl: false,
        streetViewControl: true,
        rotateControl: false,
        fullscreenControl: true,
        scrollwheel: false,
        draggable: true,
        disableDoubleClickZoom: false,
      }"
    >
      <GmapMarker
        :key="index"
        v-for="(m, index) in this.$store.state.activeMarkers"
        :position="m.position"
        @click="center = m.position"
      />
    </GmapMap>
    <div
      class="card"
      v-for="(landmark, index) in $store.state.activeLandmarks"
      v-bind:key="landmark.index"
    >
      <div class="info">
        <h2>{{ landmark.placeName }}</h2>
      </div>
      <div class="info">
        <h3>{{ landmark.venueType }}</h3>
      </div>

      <div class="info">
        <img
          id="downarrow"
          v-if="index + 1 != $store.state.activeLandmarks.length"
          src="../assets/downarrow.png"
        />
      </div>
    </div>
    <button class="example_a" v-on:click="deleteItinerary">
      Delete This Itinerary
    </button>
    <button class="example_a" v-on:click="updateItinerary">
      Change This Itinerary
    </button>
    <button class="example_a" @click="addDirections()">Directions</button>
  </div>
</template>

<script>
import tourService from "@/services/TourService.js";
import Itinerary from "@/components/Itinerary.vue";
export default {
  name: Itinerary,
  data() {
    return {
      itinerary: {
        userID: this.$store.state.user.id,
        itineraryName: "",
        itineraryDate: "",
        location1: null,
        location2: null,
        location3: null,
        location4: null,
        location5: null,
        location6: null,
        location7: null,
        location8: null,
        location9: null,
        location10: null,
        notes: "",
      },
      landmarks: [],
      markers: [],
      center: {},
      componentKey: 0,
    };
  },
  props: {
    itineraryId: Number,
  },
  computed: {
    directionsURL() {
      let url = "";
      const baseURL = "https://www.google.com/maps/dir/?api=1&origin=";
      let origin =
        this.$store.state.activeLandmarks[0].lat +
        "," +
        this.$store.state.activeLandmarks[0].lng;

      if (this.$store.state.activeLandmarks.length > 1) {
        let destination =
          this.$store.state.activeLandmarks[
            this.$store.state.activeLandmarks.length - 1
          ].lat +
          "," +
          this.$store.state.activeLandmarks[
            this.$store.state.activeLandmarks.length - 1
          ].lng;

        if (this.$store.state.activeLandmarks.length === 2) {
          url =
            baseURL + origin + "&travelmode=walking&destination=" + destination;
        } else if (this.$store.state.activeLandmarks.length > 2) {
          let lastWayPoint =
            this.$store.state.activeLandmarks[
              this.$store.state.activeLandmarks.length - 2
            ].lat +
            "," +
            this.$store.state.activeLandmarks[
              this.$store.state.activeLandmarks.length - 2
            ].lng;

          url = baseURL + origin + "&travelmode=walking&waypoints=";

          for (
            let i = 1;
            i < this.$store.state.activeLandmarks.length - 2;
            i++
          ) {
            console.log(i);
            console.log(this.$store.state.activeLandmarks[i].lat);
            url +=
              this.$store.state.activeLandmarks[i].lat +
              "," +
              this.$store.state.activeLandmarks[i].lng +
              "|";
          }

          url += lastWayPoint + "&destination=" + destination;
        }
      }

      return url;
    },
  },
  methods: {
    addDirections() {
      window.open(this.directionsURL);
    },
    forceRerender() {
      this.componentKey += 1;
    },
    getLandmark(id) {
      tourService.getLandmarkByLandmarkID(id).then((response) => {
        this.landmark = response.data;
        this.location = { lat: this.landmark.lat, lng: this.landmark.lng };
      });
    },
    deleteItinerary() {
      tourService.deleteItinerary(this.itineraryId).then((response) => {
        console.log(response);
        this.$router.push({ name: "Profile" });
      });
    },
    updateItinerary() {
      this.$router.push({ name: "UpdateItinerary" });
    },
    addMarker() {
      /*   let centerLat = 0;
      let centerLng = 0;

      this.$store.state.activeLandmarks.forEach((landmark) => {
        centerLat += landmark.lat;
        centerLng += landmark.lng;

      });
      centerLat = centerLat / this.$store.state.activeLandmarks.length;
      centerLng = centerLng / this.$store.state.activeLandmarks.length;
      this.center = { lat: centerLat, lng: centerLng }; */
    },
  },
  created() {
    tourService.getAllLandmarkData().then((response) => {
      this.$store.commit("SET_LANDMARKS", response.data);
    });
    tourService
      .getItineraryByItineraryID(this.$route.params.id)
      .then((response) => {
        this.$store.commit("SET_ACTIVE_ITINERARY", response.data);
        /* this.itinerary = response.data; */
      }); //|| this.center === {} || this.markers[0].position.lat !== this.$store.state.activeLandmarks[0].lat
  },
  mounted() {
    if (isNaN(this.$store.state.activeCenter.lat)) {
      // this.$router.push({ name: "Itinerary" });
      this.forceRerender();
    }

    /* do {
      //this.markers = [];
    this.addMarker();
    } while (this.markers[0].position.lat !== this.$store.state.activeLandmarks[0].lat);
    this.markers = []; */
    /* this.markers = this.$store.state.activeMarkers;
    this.addMarker(); */
  },
};
</script>

<style scoped>
#downarrow {
  height: 100px;
  width: 80px;
}
h1 {
  font-family: "Mate SC", serif;
  display: flex;
  justify-content: center;
}
h3 {
  display: flex;
  justify-content: center;
  font-family: "Mate SC", serif;
}
.info {
  text-align: center;
}

.example_a {
  color: #fff !important;
  text-transform: uppercase;
  text-decoration: none;
  background: #d32929;
  padding: 10px;
  border-radius: 2px;
  display: inline-block;
  border: none;
  transition: all 0.4s ease 0s;
}

.example_a:hover {
  background: #434343;
  letter-spacing: 1px;
  -webkit-box-shadow: 0px 5px 40px -10px rgba(0, 0, 0, 0.57);
  -moz-box-shadow: 0px 5px 40px -10px rgba(0, 0, 0, 0.57);
  box-shadow: 5px 40px -10px rgba(0, 0, 0, 0.57);
  transition: all 0.4s ease 0s;
}

.card {
  border: 2px solid black;
  border-radius: 10px;
  padding: 3px;
  margin: 4%;
  box-shadow: 3px 2px 14px rgba(white, 0.2);
  transition: all 200ms ease-in-out;
  background-color: white;
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  opacity: 80%;
  color: rgb(8, 8, 4);
  filter: blur(0.7px);
}
</style>
