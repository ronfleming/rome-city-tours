<template>
  <div id="location">
<GmapMap
      :center= 'location'
      :zoom='16'
      style='width:200px;  height: 200px;'
      :options= "{
          zoomControl: false,
          mapTypeControl: false,
          scaleControl: false,
          streetViewControl: false,
          rotateControl: false,
          fullscreenControl: true,
          scrollwheel: false,
          draggable: false,
          disableDoubleClickZoom: true
        }"
    >
    <GmapMarker
        :position= 'location'
        />
</GmapMap>
<p>{{google}}</p>
  </div>
</template>

<script>

export default {
    name: "Location",
    /* props: {
        location: Object
    }, */
    data() {
        return {
            location: { "lat": 41.900930597011154, "lng": 12.483383805309131 }
        }
    },
    computed: {
        
    }
}
</script>

<style>

</style>