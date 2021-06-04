<template>
  <body>
    <div id="register" class="text-center">
      <form class="form-register" @submit.prevent="register">
        <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
        <div class="alert alert-danger" role="alert" v-if="registrationErrors">
          {{ registrationErrorMsg }}
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
        <input
          type="password"
          id="confirmPassword"
          class="form-control"
          placeholder="Confirm Password"
          v-model="user.confirmPassword"
          required
        /><br />
        <router-link :to="{ name: 'login' }">Have an account?</router-link>
        <br />
        <button class="btn btn-lg btn-primary btn-block" type="submit">
          Create Account
        </button>
      </form>
    </div>
  </body>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "register",
  data() {
    return {
      user: {
        username: "",
        password: "",
        confirmPassword: "",
        role: "user",
      },
      registrationErrors: false,
      registrationErrorMsg: "There were problems registering this user.",
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = "Password & Confirm Password do not match.";
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: "/login",
                query: { registration: "success" },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = "Bad Request: Validation Errors";
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = "There were problems registering this user.";
    },
  },
};
</script>

<style scoped>
h1 {
  text-align: center;
}
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
.form-register {
  background-color: white;
  opacity: 75%;
  width: 40%;
  margin-top: -12px;
  left: 435px;
  line-height: 20px;
  position: absolute;
  top: 25%;
}

@import url("https://fonts.googleapis.com/css2?family=Mate+SC&display=swap");
</style>
