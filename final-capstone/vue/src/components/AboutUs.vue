<template>
<div> 
<div class="about-section">
  <h1>About Us Page</h1>
  <p>Meet the Team!</p>

</div>

<h2 class="Team" style="text-align:center">Our Team</h2>
<div class="row">
  <div class="column">
    <div class="card">
      <img src="../images/adam.jpg" alt="Jane" style="width:100%; height: 365px;">
      <div class="container">
        <h2>Adam Weaver</h2>
        <p class="title">Developer</p>
        <p>The CSS wizard behind our awesome page layout.</p>
        
     
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="../images/Redlogo.jpg" alt="Mike" style="width:100%; height: 335px;">
      <div class="container">
        <h2>Danial Rizvi</h2>
        <p class="title">Developer</p>
        <p>The heavy lifter DB person who helped our site look awesome.</p>
       
        
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="../images/ron.png" alt="John" style="width:100%">
      <div class="container">
        <h2>Ron Fleming</h2>
        <p class="title">Developer</p>
        <p>The Java superstar who got a lot of our functionality working.</p>
        
    
      </div>
    </div>
  </div>
   <div class="column">
    <div class="card">
      <img  src="../images/breanna1.jpg" style="width:100%; height: 40%; ">
      <div class="container">
        <h2>Breanna Thompson</h2>
        <p class="title">Developer</p>
        <p>The cheerleader/what can I work on person.</p>
       
       
      </div>
    </div>
  </div>
</div>
</div>
</template>

<script>
export default {

}
</script>

<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
  font-family: "Mate SC", serif;
 
}

.about-section {
  padding: 60px;
 font-family: "Mate SC", serif;
  text-align: center;
  background-color: #e5dbb7;
  color: rgb(15, 14, 14);
  
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
 
}

.title {
  color: grey;
  font-family: "Mate SC", serif;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}
.Team{
  font-family: "Mate SC", serif;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
</style>