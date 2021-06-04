<template>
  <div id="app">
    <nav>
      <a href="#default" class="logo"
        ><img src="./images/AnimatedLogo.gif"
      /></a>
      <div>
        <h1>Rome Around City Tours</h1>
      </div>
      <ul>
        <li>
          <router-link class="example_a" v-bind:to="{ name: 'CreateItinerary' }"
            >Create Itinerary</router-link
          >
        </li>
        <li><router-link class="example_a" v-bind:to="{ name: 'Profile' }"
            >Profile</router-link
          ></li>
        <li>
          <router-link class="example_a" v-bind:to="{ name: 'home' }"
            >Home</router-link
          >
        </li>
        <li> <router-link class="example_a"
        v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token != ''"
        >Logout</router-link
      ></li>
      </ul>
      <hr />
    </nav>
    <br/> <br/> <br/> <br/><br/> <br/><br/> 


    <router-view />
  </div>
</template>

<script>
</script>

<style scoped>
nav {
  width: 101%;
  height: 128px;
  line-height: 0px;
  background-color: #cac198;
  position: fixed;
  padding: 7px 0px;
  margin-bottom: 4%;
  top: -8px;
  left: -8px;
  z-index: 999;
}

img {
  width: auto;
  height: 120px;
  display: flex;
  margin: -5px;
  justify-content: right;
}
h1 {
  font-size: 50px;
  font-family: "Mate SC", serif;
  padding-top: 10px;
}
nav .logo {
  float: left;
  width: 20%;
  height: 120px;
  display: flex;
  justify-content: center;
}
nav ul {
  font-weight: bold;
  margin-top: -10px;
  margin-right: 10px;
  float: right;
}

@media all and(max-width:30em) {
  .button1 {
    display: block;
    margin: 0.4em auto;
  }
}

.example_a {
  color: #fff !important;
  text-transform: uppercase;
  text-decoration: none;
  background: #d32929;
  padding: 10px;
  border-radius: 2px;
  display: inline-block;
  border: none;
  transition: all 0.4s ease 0s;
}

.example_a:hover {
  background: #434343;
  letter-spacing: 1px;
  -webkit-box-shadow: 0px 5px 40px -10px rgba(0, 0, 0, 0.57);
  -moz-box-shadow: 0px 5px 40px -10px rgba(0, 0, 0, 0.57);
  box-shadow: 5px 40px -10px rgba(0, 0, 0, 0.57);
  transition: all 0.4s ease 0s;
}

nav ul li {
  display: inline;
  text-align: center;
  padding: 4px;
  text-decoration: none;
  font-size: 16px;
  line-height: 2px;
  border-radius: 4px;
  height: 30px;
  font-family: "Mate SC", serif;
}
.signin {
  padding-top: 150px;
   color: #ffffff !important;
  text-transform: uppercase;
  text-decoration: none;
  background: #d32929;
  border-radius: 1px;
  display: inline-block;
  border: none;
  transition: all 0.4s ease 0s;

  text-decoration: none;
  font-size: 16px;
  height: 30px;
  font-family: "Mate SC", serif;
  
}
.signin:hover {
  background: #434343;
  letter-spacing: 1px;
  -webkit-box-shadow: 0px 5px 40px -10px rgba(0, 0, 0, 0.57);
  -moz-box-shadow: 0px 5px 40px -10px rgba(0, 0, 0, 0.57);
  box-shadow: 5px 40px -10px rgba(0, 0, 0, 0.57);
  transition: all 0.4s ease 0s;
}

hr {
  width: 100%;
  border-bottom: 4px solid rgb(211, 41, 41);
  margin-right: auto;
  margin-left: auto;
  padding-top: -10px;

}




@import url("https://fonts.googleapis.com/css2?family=Mate+SC&display=swap");
</style>