<template>
  <div>
      <p>{{directionsURL}}</p>
    <div>
      <GmapAutocomplete @place_changed="setPlace" />
      <button @click="addMarker">Add</button>
    </div>
    <br /><!-- map-type-id="hybrid" -->
    <GmapMap
      :center="this.center"
      :zoom="14"
      map-type-id="terrain"
      style="width: 600px; height: 600px"
    >
      <GmapMarker
        :key="index"
        v-for="(m, index) in this.markers"
        :position="m.position"
        @click="center = m.position"
      />
    </GmapMap>
  </div>
  <!-- "panToMarker(m.position)" -->
</template>

<script>
import tourService from "@/services/TourService.js";
import { gmapApi } from "vue2-google-maps";
export default {
  name: "TestMap",
  data() {
    return {
      center: {}, // lat: 41.8909, lng: 12.4896
      currentPlace: null,
      markers: [],
      places: [],
      activeLandmarks: [
        {
          landmarkID: 3,
          placeName: "Roman Forum",
          imageRef1:
            "https://res.cloudinary.com/dba0u6779/image/upload/v1622565816/assets/rome-pantheon-02_etnhz5.jpg",
          imageRef2: null,
          imageRef3: null,
          venueType: "Museum",
          operatingHours: "M-F: 10:30 AM - 05:30 PM, Sa & Su: Closed",
          description:
            "Vast excavated area of Roman temples, squares & government buildings, some dating back 2,000 years.",
          lat: 41.893,
          lng: 12.486,
        },
        {
          landmarkID: 4,
          placeName: "Palatine Hill",
          imageRef1:
            "https://res.cloudinary.com/dba0u6779/image/upload/v1622565810/assets/palatine-hill-rome_e2x72n.jpg",
          imageRef2: null,
          imageRef3: null,
          venueType: "Historical landmark",
          operatingHours: "M-F, Sa & Su: 10:30AM - 07:15PM",
          description:
            "Guided tours are available of the archaeological site housing the ruins of ancient imperial palaces.",
          lat: 41.87,
          lng: 12.46,
        },
        {
          landmarkID: 5,
          placeName: "St. Peter's Basilica",
          imageRef1:
            "https://res.cloudinary.com/dba0u6779/image/upload/v1622565818/assets/st-peters-basilica-01_rcaawi.jpg",
          imageRef2:
            "https://res.cloudinary.com/dba0u6779/image/upload/v1622565818/assets/st-peters-basilica-02_qmx2ea.jpg",
          imageRef3: null,
          venueType: "Basilica",
          operatingHours: "Consult Venue",
          description:
            "Late Renaissance church by architects including Michelangelo & holding up to 20,000 worshippers.",
          lat: 41.91,
          lng: 12.47,
        },
        {
          landmarkID: 6,
          placeName: "Spanish Steps",
          imageRef1:
            "../https://res.cloudinary.com/dba0u6779/image/upload/v1622565812/assets/piazza-di-spagna_ye6qei.jpg",
          imageRef2: null,
          imageRef3: null,
          venueType: "Landmark",
          operatingHours: "M-F, Sa & Su: 24HRS",
          description:
            "Refined 18th-century square, location of the Spanish Steps & the Church of TrinitÃ  dei Monti.",
          lat: 41.904,
          lng: 12.47,
        },
        {
          landmarkID: 7,
          placeName: "House of Augustus",
          imageRef1:
            "https://res.cloudinary.com/dba0u6779/image/upload/v1622565817/assets/casa-di-augusto_dytexi.jpg",
          imageRef2: null,
          imageRef3: null,
          venueType: "Historical landmark",
          operatingHours: "Guided Tour Only/Consult Venue",
          description:
            "Ruins of an ancient Roman imperial residence, with colorful frescoes, courtyards & studies.",
          lat: 41.888,
          lng: 12.484,
        },
      ],
    };
  },
  computed: {
    google: gmapApi,
    directionsURL() {
        let url = "";
        const baseURL = "https://www.google.com/maps/dir/?api=1&origin=";
        let origin = this.activeLandmarks[0].lat + ',' + this.activeLandmarks[0].lng;

        if(this.activeLandmarks.length > 1) {
            let destination = this.activeLandmarks[this.activeLandmarks.length - 1].lat + ',' 
            + this.activeLandmarks[this.activeLandmarks.length -1].lng;

            if(this.activeLandmarks.length === 2) {

                url = baseURL + origin + "&travelmode=walking&destination="  + destination;
                
                } else if (this.activeLandmarks.length > 2) {

                    let lastWayPoint = this.activeLandmarks[this.activeLandmarks.length - 2].lat + ','
                    + this.activeLandmarks[this.activeLandmarks.length - 2].lng;

                    url = baseURL + origin + "&travelmode=walking&waypoints=";

                    for (let i = 1; i < this.activeLandmarks.length - 3; i++) {
                        url += this.activeLandmarks[i].lat + ',' + this.activeLandmarks[i].lng + "|";
                    }

                    url += lastWayPoint + "&destination="  + destination;


                }






            

        }

        return url;

    }
   /*  centerLat() {
        let la = 0;
        this.markers.position.forEach((lat) => {
            la += lat;
        });
        return la / this.markers.length;
    },
    centerLng() {
        let lo = 0;
        this.markers.position.forEach((lng) => {
            lo += lng;
        });
        return lo / this.markers.length;
    }, */
  },
  methods: {
    setPlace(place) {
      this.currentPlace = place;
    },

    addMarker() {
      let centerLat = 0;
      let centerLng = 0;
      
      this.activeLandmarks.forEach((landmark) => {
        centerLat += landmark.lat;
        centerLng += landmark.lng;
        
        const marker = {
          lat: landmark.lat,
          lng: landmark.lng,
        };
        this.markers.push({ position: marker });
      });
      centerLat = centerLat / this.activeLandmarks.length;
      centerLng = centerLng / this.activeLandmarks.length;
      this.center = {lat: centerLat, lng: centerLng}
    },
    /*  panToMarker(position) {
        this.center = position;
        this.$refs.mapRef.panTo(position);
    }, */
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
      });
    this.addMarker();
    /* let lat = 0;
    let lng = 0;
    this.markers.position.forEach((marker) => {
      lat += marker.position.lat;
      lng += marker.position.lng;
    });
    console.log(lat);
    lat = lat / this.markers.length;
    lng = lng / this.markers.length;
    this.center = { "lat": lat, "lng": lng }; */
  },
};
</script>

<style>
</style>