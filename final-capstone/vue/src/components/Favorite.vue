<template>
  <div class="favorite">
    <div v-bind:class="{ favorited: favorite.favorited }"  
       v-for="favorite in favoritedData" 
       v-bind:key="favorite.id">
    
    {{ favorite.placeName }}
   
    <button v-on:click="toggleFavorite">Delete from Favorites</button>
    <!-- <h4> {{ favoritedData }}</h4> -->
    <!-- <button v-on:click="addFavorite">Add</button> -->
    </div>
  </div>
</template>




<script>
import tourService from "@/services/TourService.js";

export default {
  name: "Favorite",
  data() {
    return { 
      name: "Favorite Location",
      description: "User can choose to select this location as Favorite.",
      favoritedData: [
        {
          favorites_id: 0,
          user_id: 0,
          place_name: "", 
          is_favorite: true
        },
  //       {
  //         favorites_id: 5,
  //         user_id: 1,
  //         place_name: "Palatine Hill",
	// is_favorite: true
  //       },
  //       {
  //         favorites_id: 6,
  //         user_id: 1,
  //         place_name: "Spanish Steps",
	// is_favorite: true
  //       },
  //       {
  //         favorites_id: 7,
  //         user_id: 1,
  //         place_name: "Trevi Fountain",
	// is_favorite: true
  //       }
      ]
    };
  },
  methods: {
    getFavorite(id) {
      tourService.getFavoritesByUserID(id).then((response) => {
        this.favorite = response.data;
        // this.$store.commit("SET_USER_FAVORITE", response.data);
      });
    },
    addFavorite(fav){
      tourService.addFavorite(fav).then((response) => {
        this.$store.commit("SET_FAVORITES", response.data);
      });
    },
    // getAllFavorite() {
    //   console.log(this.$store.state.user.id);
    //   tourService.getAllFavorites(this.$store.user.id).then((response) => {
    //     this.$store.commit("SET_USER_ALL_FAVORITE", response.data);
    //   });
    // },
    // deleteFavorite() {},

    toggleFavorite(index) {
      if(this.favoritedData[index].is_favorite == true) {
        this.favoritedData[index].is_favorite = false;
      } else {
        this.favoritedData[index].is_favorite = true;
      }console.log('Toggle status',this.favoritedData[index].is_favorite);
      // return this.favoritedData[index].is_favorite;
    }
  },
  created() {
    tourService.getFavoritesByUserID(this.$store.state.user.id).then((response) => {
      this.$store.commit("SET_FAVORITES", response.data);
      console.log(response.data)
      this.favoritedData = response.data;
    });
  },
};
</script>





<style>
</style>