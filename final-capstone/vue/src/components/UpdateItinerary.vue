<template>
  <div id="create">
    <div id="landmarkinfo">
      <h1>{{ this.landmark.placeName }}</h1>
      <p>Hours: {{ this.landmark.operatingHours }}</p>
      <p>{{ this.landmark.description }}</p>
      <p>Venue Type: {{ this.landmark.venueType }}</p>
      <img id="image" src="../assets/Colosseum-Rome-Italy.jpg" />
    </div>

    <form class="new-itinerary-form" v-on:submit.prevent="saveItinerary">
      <h2 class="test">Update Itinerary</h2>
      <input
        class="name-input"
        type="text"
        placeholder="Itinerary Name"
        v-model="formItinerary.itineraryName"
      />
      <input
        class="date-input"
        type="date"
        placeholder="Date"
        v-model="formItinerary.itineraryDate"
      />
      <br /><br />

      <label for="first-dropdown">Select Location 1: </label>
      <select
        name="first-dropdown"
        v-model="formItinerary.location1"
        v-on:change="getLandmark($event)"
      >
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.id"
          :value="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br /><br />
      <label for="second-dropdown">Select Location 2: </label>
      <select
        name="second-dropdown"
        v-model="formItinerary.location2"
        v-on:change="getLandmark($event)"
      >
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.id"
          :value="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br /><br />
      <label for="second-dropdown">Select Location 3: </label>
      <select
        name="second-dropdown"
        v-model="formItinerary.location3"
        v-on:change="getLandmark($event)"
      >
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.id"
          :value="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br /><br />
      <label for="second-dropdown">Select Location 4: </label>
      <select
        name="second-dropdown"
        v-model="formItinerary.location4"
        v-on:change="getLandmark($event)"
      >
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.id"
          :value="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br /><br />
      <label for="second-dropdown">Select Location 5: </label>
      <select
        name="second-dropdown"
        v-model="formItinerary.location5"
        v-on:change="getLandmark($event)"
      >
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.id"
          :value="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br /><br />
      <label for="second-dropdown">Select Location 6: </label>
      <select
        name="second-dropdown"
        v-model="formItinerary.location6"
        v-on:change="getLandmark($event)"
      >
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.id"
          :value="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br /><br />
      <label for="second-dropdown">Select Location 7: </label>
      <select
        name="second-dropdown"
        v-model="formItinerary.location7"
        v-on:change="getLandmark($event)"
      >
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.id"
          :value="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br /><br />
      <label for="second-dropdown">Select Location 8: </label>
      <select
        name="second-dropdown"
        v-model="formItinerary.location8"
        v-on:change="getLandmark($event)"
      >
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.id"
          :value="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br /><br />
      <label for="second-dropdown">Select Location 9: </label>
      <select
        name="second-dropdown"
        v-model="formItinerary.location9"
        v-on:change="getLandmark($event)"
      >
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.id"
          :value="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br /><br />
      <label for="second-dropdown">Select Location 10: </label>
      <select
        name="second-dropdown"
        v-model="formItinerary.location10"
        v-on:change="getLandmark($event)"
      >
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.id"
          :value="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br /><br />
      <label>Add Notes About Your Trip! </label><br />
      <textarea placeholder="Notes" v-model="formItinerary.notes" /> <br />
      <br /><br />
      <button class="example_b">Update Itinerary</button>
    </form>

    <GmapMap
      class="map"
      :center="this.location"
      :zoom="19"
      map-type-id="hybrid"
      style="width: 600px; height: 400px"
      :options="{
        zoomControl: false,
        mapTypeControl: false,
        scaleControl: false,
        streetViewControl: false,
        rotateControl: false,
        fullscreenControl: true,
        scrollwheel: true,
        draggable: true,
        disableDoubleClickZoom: true,
      }"
    >
      <GmapMarker :position="this.location" />
    </GmapMap>
  </div>
</template>

<script>
import UpdateItinerary from "@/components/UpdateItinerary.vue";
import tourService from "@/services/TourService.js";
export default {
  name: UpdateItinerary,
  data() {
    return {
      location: { lat: null, lng: null },
      landmarkIndex: null,
      landmark: {},
      formItinerary: {
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
    };
  },

  methods: {
    getLandmark(evt) {
      const locationId = evt.target.value;
      tourService.getLandmarkByLandmarkID(locationId).then((response) => {
        this.landmark = response.data;
        this.location = { lat: this.landmark.lat, lng: this.landmark.lng };
        document.getElementById("image").src = this.landmark.imageRef1;
        require(`@/assets/${this.landmark.imageRef1}`);
      });
    },
    saveItinerary() {
      //test below
      /*this.$store.commit("SET_ACTIVE_ITINERARY", this.formItinerary);
      console.log(this.$store.state.activeItinerary);
      console.log(this.$store.state.locations); */
      //end test
      tourService.updateItinerary(this.formItinerary).then((response) => {
        console.log(response.status);
        if (response.status === 202) {
          this.formItinerary = {};
          this.$router.push({ name: "Profile" });
        }
      });
    },
  },
  created() {
    tourService.getAllLandmarkData().then((response) => {
      this.$store.commit("SET_LANDMARKS", response.data);
    });
    /* tourService
      .getItineraryByItineraryID(this.$route.params.id)
      .then((response) => {
        this.$store.commit("SET_ACTIVE_ITINERARY", response.data);
        this.itinerary = response.data;
      });
    console.log(this.$store.state.activeItinerary); */
    this.formItinerary = this.$store.state.activeItinerary;
    tourService
      .getLandmarkByLandmarkID(this.formItinerary.location1)
      .then((response) => {
        this.landmark = response.data;
        this.location = { lat: this.landmark.lat, lng: this.landmark.lng };
        document.getElementById("image").src = this.landmark.imageRef1;
        require(`@/assets/${this.landmark.imageRef1}`);
      });
  },
  mounted() {
    /* document.getElementById("image").src = this.landmark.imageRef1;
    require(`@/assets/${this.landmark.imageRef1}`); */
  },
};
</script>

<style>
.new-itinerary-form {
  font-family: "Mate SC", serif;
  grid-area: form;
  background-color: #e5dbb7;
  padding: 30px;
  margin: 10px;
  width: 500px;
  height: 860px;
  border-radius: 30px;
  margin-right: 10px;
  margin-left: 9px;
}
#image {
  width: 400px;
  height: 250px;
}
#create {
  background-color: #fff5e6;
  display: grid;
  grid-template-columns: 1fr 1fr;

  grid-template-areas:
    "new-itinerary-form ."
    "form landmarkinfo"
    ". map";
}
.map {
  grid-area: map;
  top: -98%;
}
.test {
  grid-area: new-itinerary-form;
}
.example_b {
  color: #fff !important;
  text-transform: uppercase;
  text-decoration: none;
  background: #d32929;
  padding: 10px;
  border-radius: 2px;
  display: inline-block;
  border: none;
  transition: all 0.4s ease 0s;
  width: 80%;
  font-family: "Mate SC", serif;
}

.example_b:hover {
  background: #434343;
  -webkit-box-shadow: 0px 5px 40px -10px rgba(0, 0, 0, 0.57);
  -moz-box-shadow: 0px 5px 40px -10px rgba(0, 0, 0, 0.57);
  box-shadow: 5px 40px -10px rgba(0, 0, 0, 0.57);
  transition: all 0.4s ease 0s;
  font-family: "Mate SC", serif;
}

#landmarkinfo {
  padding: 30px;
  margin: 3px;
  border: 1px;
  border-radius: 30px;
  width: 550px;
  height: 470px;
  font-family: "Mate SC", serif;
  background-color: #cac198;
  line-height: 15px;
  top: 30%;
  grid-area: landmarkinfo;
}
</style>