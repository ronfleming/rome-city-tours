<template>
  <div class="home">
    <h1>Welcome to Rome Around City Tours!</h1>
    <p>Start mapping out your trip!</p>
    <NewMap />
  </div>
</template>


<script>
import NewMap from '../components/NewMap.vue';
export default {
  components: { NewMap },
  name: "home",
};
</script>

<style scoped>
h1{
  text-align: center;
  font-family: "Mate SC", serif;
}
p{
  text-align: center;
  font-family: "Mate SC", serif;
  font-size: 20px;
}
</style>
