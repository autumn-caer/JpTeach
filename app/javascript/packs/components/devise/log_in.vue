<template>
<div class="green accent-4">
    <v-container>
      <v-row>
      <v-col md="6"
            class="">
        <v-card
          class ="pa-md-4"
          max-width="900"
          min-height="380"
        >
          <v-card-title class="headline">JpTech Log In Page</v-card-title>
          <v-card-subtitle>Listen to your favorite artists and albums whenever and wherever, online and offline.</v-card-subtitle>
          <v-card-actions>
            <v-btn text>Start Now</v-btn>
          </v-card-actions>
        </v-card> 
      </v-col>
      <v-col md="6"
              class="ml-auto">
        <v-card
          class ="pa-md-8 float-lg-right d-flex"
          max-width="700"
          min-height="380"
        >
          <v-form
              ref="form"
              v-model="valid"
              lazy-validation
          >
            <v-text-field
              v-model="email"
              :rules="emailRules"
                label="E-mail"
                required
              ></v-text-field>
            <v-text-field
              v-model="password"
              :rules="passwordRules"
                label="Password"
                required
              ></v-text-field>
              <v-text-field
                v-model="info">
              </v-text-field>
            <v-btn
                :disabled="!valid"
                color="success"
                class="mr-4"
                @click="createUser"
            >
                Validate
            </v-btn>
            <v-btn
                color="error"
                class="mr-4"
                @click="reset"
            >
                Reset Form
            </v-btn>
            <v-btn
                color="warning"
                @click="resetValidation"
            >
                Reset Validation
            </v-btn>
            </v-form>
          </v-card>
        <v-col>
      <v-row>
    <v-container>
</div>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';

  export default {

    data: () => ({
      valid: true,
      email: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
      ],
      password: '',
      passwordRules: [
        v => !!v || 'Password is required',
      ],
      info:'',
      flag:''
    }),

    methods: {
      validate () {
        this.$refs.form.validate()
      },
      reset () {
        this.$refs.form.reset()
      },
      resetValidation () {
        this.$refs.form.resetValidation()
      },
      createUser () {
         axios
              .post('http://localhost:3000/api/auth/sign_in', {
                  email: this.email,
                  password: this.password,
                  password_confirmation: this.password
              })
              .then(response => {this.info = response.data.data.name;
                                 this.$store.commit('setUserId',response.data.data.id);
                                 this.$store.commit('setUserName',response.data.data.name);
                                 this.$store.commit('setUserEmail',response.data.data.email);
                                 this.$router.push('/userpage');
                                 localStorage.setItem("access-token", response.headers["access-token"])
                                 localStorage.setItem("client", response.headers.client)
                                 localStorage.setItem("uid", response.headers.uid)
                                 localStorage.setItem("token-type", response.headers["token-type"])

              })
              .catch(error => console.log(error))

      }

    },
  }
</script>