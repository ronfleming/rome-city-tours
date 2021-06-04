<template>
  <div>
    <!-- <div>
      <GmapAutocomplete @place_changed="setPlace" />
      <button @click="addMarker">Add</button>
    </div> -->
    <br />
    <gmaps-map 
    :center="{ lat: 41.8958, lng: 12.4843 }" 
    :zoom="16" 
    map-type-id="hybrid"
    style="width: 100%; height: 500px">
      <gmaps-info-window
        v-for="(item, i) in items"
        :key="i"
        :options="item.options"
        @click="openWindow"
      >
        <!-- <p>Colosseum</p> -->
      </gmaps-info-window>
          <!-- <gmaps-info-window: :lat= "41.89001" :lng= "12.4922" >
      <img src="../assets/Colosseum-Rome-Italy.jpg" height="50px"/>
      </gmaps-info-window> -->
      <gmaps-marker
        :key="index"
        v-for="(m, index) in markers"
        :options="m.options"
        :position="m.position"
        :name="m.options"
        :clickable="true"
        @click="toggleInfo(m, index)"
      />
      <!-- <span @click="doSomething()">Do Something</span> -->
    </gmaps-map>
  </div>
</template>

<script>
import { gmapsMap, gmapsMarker, gmapsInfoWindow } from "x5-gmaps";
export default {
  components: { gmapsMap, gmapsMarker, gmapsInfoWindow },
  name: "BaseMap",

  data() {
    return {
      center: { lat: 41.8958, lng: 12.4843 },	
      currentPlace: null,
      markers: [
        {
          position: { lat: 41.89001, lng: 12.4922 },
        },
        {
          position: { lat: 41.88552, lng: 12.48576 },
        },
        {
          position: { lat: 41.898694, lng: 12.476757 },
        },
        {
          position: {lat: 41.89245, lng: 12.485331 },
        }, {
          position: {lat: 41.8894, lng: 12.4875 },
        },
        {
          position: {lat: 41.902202, lng: 12.454143 },
        },
        {
          position: { lat: 41.905973, lng: 12.482786 },
        },
        {
          position: { lat: 41.889015, lng: 12.485172},
        },
         {
          position: { lat: 41.8898, lng: 12.4906},
        },
         {
          position: { lat: 41.8958, lng: 12.4843},
        },
      ],
      places: [],
      items: [
        {
          options: {
            position: { lat: 41.89001, lng: 12.4922 },
            pixelOffset: {
              width: 0,
              height: -40,
            },
            content: "Colosseum ",
          },
        },
        {
          options: {
            position: { lat: 41.88552, lng: 12.48576 },
            pixelOffset: {
              width: 0,
              height: -40,
            },
            content: "Circus Maxiumus",
          },
        },
        {
          options: {
            position: { lat: 41.898694, lng: 12.476757 },
            pixelOffset: {
              width: 0,
              height: -40,
            },
            content: "Pantheon",
          },
        },
         {
          options: {
            position: { lat: 41.89245, lng: 12.485331 },
            pixelOffset: {
              width: 0,
              height: -40,
            },
            content: "Roman Forum",
          },
        },
        {
          options: {
            position: { lat: 41.8894, lng: 12.4875 },
            pixelOffset: {
              width: 0,
              height: -40,
            },
            content: "Palatine Hill",
          },
        },
         {
          options: {
            position: { lat: 41.902202, lng: 12.454143},
            pixelOffset: {
              width: 0,
              height: -40,
            },
            content: "St. Peter''s Basilica",
          },
        },
         {
          options: {
            position: { lat: 41.905973, lng: 12.482786},
            pixelOffset: {
              width: 0,
              height: -40,
            },
            content: "Spanish Steps",
          },
        },
         {
          options: {
            position: { lat: 41.889015, lng: 12.485172},
            pixelOffset: {
              width: 0,
              height: -40,
            },
            content: "House of Augustus",
          },
        },
            {
          options: {
            position: { lat: 41.8898, lng: 12.4906},
            pixelOffset: {
              width: 0,
              height: -40,
            },
            content: "Arch of Constantine",
          },
        },
         {
          options: {
            position: { lat: 41.8958, lng: 12.4843},
            pixelOffset: {
              width: 0,
              height: -40,
            },
            content: "Trajan''s Column",
          },
        },
      ],
    };
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


    // this doesn't work yet... see https://teunohooijer.com/tag/vue2-google-maps/
    toggleInfoWindow: function (marker, idx) {
        this.infoWindowPos = marker.position;
        this.infoContent = this.getInfoWindowContent(marker);

        //check if its the same marker that was selected if yes toggle
        if (this.currentMidx == idx) {
          this.infoWinOpen = !this.infoWinOpen;
        }
        //if different marker set infowindow to open and reset current marker index
        else {
          this.infoWinOpen = true;
          this.currentMidx = idx;
        }
      },



  },
};
</script>

<style>
</style>