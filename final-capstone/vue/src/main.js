import Vue from 'vue'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'
// import mapboxgl from "mapbox-gl";
import * as VueGoogleMaps from 'vue2-google-maps'
import geocoder from "@pderas/vue2-geocoder";
import x5GMaps from 'x5-gmaps'

Vue.use(x5GMaps, 'API_KEY')

Vue.use(VueGoogleMaps, {
  load: {
    key: 'API_KEY',
    libraries: 'places',
  },
});

Vue.use(geocoder, {
  defaultCountryCode: null, // e.g. 'CA'
  defaultLanguage:    null, // e.g. 'en'
  defaultMode:        'lat-lng', // or 'address'
  googleMapsApiKey:   'API_KEY'
});

Vue.config.productionTip = false

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

