<template>
  <div>
    <!-- <div>
      <GmapAutocomplete
        @place_changed='setPlace'
      />
      <button
        @click='addMarker'
      >
        Add
      </button>
    </div> -->
    <br><!-- map-type-id="hybrid" -->
    <GmapMap
      :center='center'
      :zoom='14'
      map-type-id="terrain"
      style='width:100%;  height: 500px;'
      
    >
    <GmapMarker
        :key="index"
        v-for="(m, index) in markers"
        :position="m.position"
        @click="center=m.position"
      />
    </GmapMap>
  </div>
</template>

<script>
export default {
  name: 'NewMap',
  data() {
    return {
      center: { lat: 41.8909, lng: 12.4896 },
      currentPlace: null,
      markers: [],
      places: [],
    }
  },
  methods: {
    setPlace(place) {
      this.currentPlace = place;
    },
    
    addMarker() {
      if (this.currentPlace) {
        const marker = {
          lat: this.currentPlace.geometry.location.lat(),
          lng: this.currentPlace.geometry.location.lng(),
        };
        this.markers.push({ position: marker });
        this.places.push(this.currentPlace);
        this.center = marker;
        this.currentPlace = null;
      }
    },
  },
}
</script>

<style>

</style>