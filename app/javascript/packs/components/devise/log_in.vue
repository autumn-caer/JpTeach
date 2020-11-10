<template>
<div>
    <v-container fluid>
      <v-row justify="center">
      <v-col lg="5" md="5" sm="12" cols="12">
        <v-card
          class ="pa-lg-4 pa-md-4 pa-sm-8 pa-8" outlined tile
          min-height="380"
        >
          <v-card-title class="headline">JpTech Log In Page</v-card-title>
          <v-card-subtitle>Listen to your favorite artists and albums whenever and wherever, online and offline.</v-card-subtitle>
          <v-card-actions>
            <v-btn text>Start Now</v-btn>
          </v-card-actions>
        </v-card> 
      </v-col>
      <v-col lg="5" md="5" sm="12" cols="12">
        <v-card
          class ="pa-lg-4 pa-md-4 pa-sm-8 pa-8" outlined tile
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
            <v-row justify="center">
              <v-col lg="3" md="3" sm="12" cols="12">
                <v-btn
                    :disabled="!valid"
                    block
                    color="success"
                    class="mr-4"
                    @click="createUser"
                >
                    Validate
                </v-btn>
              </v-col>
              <v-col lg="4" md="4" sm="12" cols="12">
                <v-btn
                    block
                    color="error"
                    class="mr-4"
                    @click="reset"
                >
                    Reset Form
                </v-btn>
              </v-col>
              <v-col lg="5" md="5" sm="12" cols="12">
                <v-btn
                    block
                    color="warning"
                    @click="resetValidation"
                >
                    Reset Validation
                </v-btn>
              </v-col>
            </v-row>
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