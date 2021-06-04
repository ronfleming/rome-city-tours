<template>
  <itinerary v-bind:itinerary-id="parseInt($route.params.id)" />
</template>

<script>
import Itinerary from "../components/Itinerary.vue";
export default {
  name: "ItineraryLocations",
  components: { Itinerary },
};
</script>

<style>
</style>