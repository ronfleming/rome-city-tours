<template>
<div>
<h2>Create Itinerary</h2>
  <form class="new-itinerary-form" v-on:submit.prevent="saveItinerary">
    <input class="name-input" type="text" placeholder="Itinerary Name" v-model="itinerary.name" />
    <input class="date-input" type="date" placeholder="Date" v-model="itinerary.date" />

    <!-- <label for="basic-dropdown">Basic dropdown: </label>
  <select name="basic-dropdown" v-model="itinerary">
    <option   v-for="landmark in this.$store.state.landmarks"
      v-bind:key="landmark.landmarkID">{{ landmark.placeName }}
    </option>
  </select> <br><br>
  -->
    <label for="basic-dropdown">Select Location 1: </label>
      <select name="basic-dropdown" v-model="itinerary.location1">
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br />
    <label for="second-dropdown">Select Location 2: </label>
      <select name="second-dropdown" v-model="itinerary.location2">
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br />
        <label for="second-dropdown">Select Location 3: </label>
      <select name="second-dropdown" v-model="itinerary.location3">
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br />
      <label for="second-dropdown">Select Location 4: </label>
      <select name="second-dropdown" v-model="itinerary.location4">
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br />
      <label for="second-dropdown">Select Location 5: </label>
      <select name="second-dropdown" v-model="itinerary.location5">
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br />
      <label for="second-dropdown">Select Location 6: </label>
      <select name="second-dropdown" v-model="itinerary.location6">
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br />
      <label for="second-dropdown">Select Location 7: </label>
      <select name="second-dropdown" v-model="itinerary.location7">
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br />
      <label for="second-dropdown">Select Location 8: </label>
      <select name="second-dropdown" v-model="itinerary.location8">
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br />
      <label for="second-dropdown">Select Location 9: </label>
      <select name="second-dropdown" v-model="itinerary.location5">
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br />
      <label for="second-dropdown">Select Location 10: </label>
      <select name="second-dropdown" v-model="itinerary.location10">
        <option
          v-for="landmark in this.$store.state.landmarks"
          v-bind:key="landmark.landmarkID"
        >
          {{ landmark.placeName }}
        </option>
      </select>
      <br /><br />
      <label >Add Notes About Your Trip! </label>
     <textarea  placeholder="Notes" v-model="itinerary.notes"/> <br/>
    <button>Save Itinerary</button>
  </form>
</div>
</template>

<script>
import tourService from '../services/TourService.js'
export default {
    name: "new-itinerary-form",
    data() {
        return {
            itinerary: {
                name: '',
                date: '',
                location1:'',
                location2:'',
                location3:'',
                location4:'',
                location5:'',
                location6:'',
                location7:'',
                location8:'',
                location9:'',
                location10:'',
                notes: ''
            }
        }
    },
    created(){
 tourService.getAllLandmarkData().then((response) => {
      this.$store.commit("SET_LANDMARKS", response.data);
    });
    
    },

    methods: {
        saveItinerary() {
            tourService.addItinerary( this.itinerary);
            this.$router.push({name: "Profile"});
            this.itinerary = {
               name: '',
                date: '',
                location1:'',
                location2:'',
                location3:'',
                location4:'',
                location5:'',
                location6:'',
                location7:'',
                location8:'',
                location9:'',
                location10:'',
                notes: ''
            };
        }
    }
}
</script>

<style>
h2{
text-align: center;
}
.new-itinerary-form {
    margin: 20px;
}

.new-itinerary-form input, .new-itinerary-form button {
    margin: 10px;
    font-size: 1rem;
}
.filters {
  width: 800px;
  margin: 0 auto;
}

.filter {
  text-align: left;
}

.result {
  margin-top: 30px;
  text-align: left;
}

label {
  display: block;
}
button {
 background-color: #cac198;
font-family: 'Mate SC', serif;
font-weight: bold;  

}
form{

 display: grid;
/* justify-content: space-around;  */
justify-content: center;
font-family: 'Mate SC', serif;
font-weight: bold;
}
</style>