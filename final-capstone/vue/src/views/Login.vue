<template>
  <body>
    <div id="login" class="text-center">
      <form class="form-signin" @submit.prevent="login">
        <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
        <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
          Invalid username and password!
        </div>
        <div
          class="alert alert-success"
          role="alert"
          v-if="this.$route.query.registration"
        >
          Thank you for registering, please sign in.
        </div>
        <label for="username" class="sr-only">Username</label>
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus
        /><br />
        <label for="password" class="sr-only">Password</label>
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required
        /><br />
        <router-link :to="{ name: 'register' }">Need an account?</router-link>
        <br />
        <button type="submit">Sign in</button>
      </form>
    </div>
    <div class="footer">
  <router-link :to="{name: 'AboutUs'}">About Us</router-link>
</div>
  </body>
  
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            //console.log('userID: ' + response.data.user.id);
            this.$router.push("/");
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>
<style scoped>
button {
  background-color: #cac198;
  font-family: "Mate SC", serif;
  outline: 0;
  border: 0;
  border-radius: 80px;
  padding: 8px 2px;
  font-size: 18px;
  font-weight: bold;
  width: 100%;
}

h1 {
  text-align: center;
}
body {
  background-image: url("../images/background.jpg");
  background-size: 30%;
  height: 400px; /* You must set a specified height */
  background-position: center; /* Center the image */
  background-repeat: no-repeat; /* Do not repeat the image */
  background-size: cover;
  background-color: transparent;
}
form {
  display: flex;
  flex-direction: column;

  line-height: 25px;
  font-family: "Mate SC", serif;
  font-weight: bold;
}
.form-signin {
  background-color: white;
  opacity: 75%;
  width: 40%;
  margin-top: -12px;
  left: 435px;
  line-height: 25px;
  position: absolute;
  top: 25%;
}
.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  background-color:#cac198;
  color: white;
  text-align: center;
  padding: 10px;
}


@import url("https://fonts.googleapis.com/css2?family=Mate+SC&display=swap");
</style>

