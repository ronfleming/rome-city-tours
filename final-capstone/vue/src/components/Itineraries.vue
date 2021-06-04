<template>
  <div class="itineraries">
    <h1 class="welcome">Welcome Back {{ this.$store.state.user.username }}!</h1>
    <h2>Itineraries for {{ this.$store.state.user.username }}:</h2>
     
    <table>
      <thead>
        <tr class="titles">
          <th>Itinerary</th>
          <th>Edit</th>
          <th>Delete</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="itinerary in this.$store.state.userItineraries" v-bind:key="itinerary.itineraryID">
          <td width="80%">
            <router-link class="itineraryName"
              v-bind:to="{ name: 'ItineraryLocations', params: { id: itinerary.itineraryID } }"

            >{{ itinerary.itineraryName }}</router-link>
          </td>
          <td>
            <button class="itineraryButton" v-on:click="updateItinerary(itinerary.itineraryID)">Edit</button>
          </td>
          <td>
            <button class="itineraryButton" v-on:click="deleteItinerary(itinerary.itineraryID)">Delete</button>
          </td>
        </tr>
      </tbody><!-- <router-link
              
            >v-bind:to="{ name: 'UpdateItinerary', params: { id: itinerary.itineraryID } }"</router-link> -->
    </table>
  </div>
</template>

<script>
import tourService from '@/services/TourService.js'
export default {
name: "Itineraries",
methods: {
    getItineraries() {
    /* console.log(this.$store.state.user.id) */
    tourService
      .getItinerariesByUserID(this.$store.state.user.id)
      .then(response => {
        this.$store.commit("SET_USER_ITINERARIES", response.data);
      });
    },
    deleteItinerary(id) {
      tourService.deleteItinerary(id).then((response) => {
        console.log(response);
        this.getItineraries();
      });
    },
    updateItinerary(id) {
      
      const active = this.$store.state.userItineraries.find((itinerary) => {
        
          return itinerary.itineraryID === id;
        });
        this.$store.commit("SET_ACTIVE_ITINERARY", active);
      
     /*  tourService
      .getItineraryByItineraryID(id)
      .then((response) => {
        this.$store.commit("SET_ACTIVE_ITINERARY", response.data);
        
      }); */
      this.$router.push({ name: "UpdateItinerary" });
    },
   
  },
  mounted() {
    this.getItineraries();
  }
};
</script>

<style>

.topic {
  font-size: 24px;
  border-bottom: 1px solid #f2f2f2;
  padding: 10px 20px;
}
.topic:last-child {
  border: 0px;
}
table {
  text-align: left;
  width: 90%;
  border-collapse: collapse;
}
td {
  padding: 4px;
}
tbody tr:nth-child(even) {
  background-color: #e6e3e3;
}

.topic-list a:link,
.topic-list a:visited {
  color: rgb(204, 87, 76);
  text-decoration: none;
}
.topic-list a:hover {
  text-decoration: underline;
}
.itineraries{
   font-family: "Mate SC", serif;
   margin: 0 auto;
  max-width: 90%;
 
}
.itineraryButton {
  color: #fff !important;
  text-transform: uppercase;
  text-decoration: none;
  background: #d32929;
  padding: 5px;
  border-radius: 3px;
  display: inline-block;
  align-items: center;
  border: none;
  transition: all 0.4s ease 0s;
  width: 60%;
  font-size: 13px;
  font-family: "Mate SC", serif;
}

.itineraryButton:hover {
  background: #434343;
  -webkit-box-shadow: 0px 5px 40px -10px rgba(0, 0, 0, 0.57);
  -moz-box-shadow: 0px 5px 40px -10px rgba(0, 0, 0, 0.57);
  box-shadow: 5px 40px -10px rgba(0, 0, 0, 0.57);
  transition: all 0.4s ease 0s;
  font-family: "Mate SC", serif;
}
.titles{
  font-family: "Mate SC", serif;
  font-size: 25px;
}
.itineraryName{
 font-weight: bold;
 font-size: 20px;
}
.welcome{
  
  text-align: center;
  font-family: "Mate SC", serif;
 
 
}
</style>