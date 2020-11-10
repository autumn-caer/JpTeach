<template>
<div>
    <v-container fluid>
      <v-row justify="center">
      <v-col lg="5" md="5" sm="12" cols="12"
            class="">
        <v-card
          class ="pa-lg-4 pa-md-4 pa-sm-8 pa-8" outlined tile
          min-height="380"
        >
          <v-card-title class="headline">JpTech Sign Up</v-card-title>
          <v-card-subtitle>Listen to your favorite artists and albums whenever and wherever, online and offline.</v-card-subtitle>
          <v-card-actions>
            <v-btn text>Start Now</v-btn>
          </v-card-actions>
        </v-card> 
      </v-col>
      <v-col lg="5" md="5" sm="12" cols="12"
              class="">
        <v-card
          class ="pa-lg-8 pa-md-8 pa-sm-8 pa-10" outlined tile
          min-height="380"
        >
          <v-form
              ref="form"
              v-model="valid"
              lazy-validation
          >
            <v-text-field
              v-model="name"
              :counter="10"
              :rules="nameRules"
              label="Name"
              required
            ></v-text-field>
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
              v-model="confirmPassword"
              :rules="confirmPasswordRules"
                label="Conform-Password"
                required
              ></v-text-field>
            <v-select
                v-model="select"
                :items="items"
                :rules="[v => !!v || 'Item is required']"
                label="Item"
                required
            ></v-select>
            <v-checkbox
                v-model="checkbox"
                :rules="[v => !!v || 'You must agree to continue!']"
                label="Do you agree?"
                required
            ></v-checkbox>
            <v-row justify="center">
              <v-col lg="3" md="3" sm="12" cols="12">
                <v-btn
                block
                :disabled="!valid"
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
        </v-col>
      </v-row>
    <v-container>
</div>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';

  export default {

    data: () => ({
      valid: true,
      name: '',
      nameRules: [
        v => !!v || 'Name is required',
        v => (v && v.length <= 10) || 'Name must be less than 10 characters',
      ],
      email: '',
      emailRules: [
        v => !!v || 'E-mail is required',
        v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
      ],
      password: '',
      passwordRules: [
        v => !!v || 'Password is required',
      ],
      confirmPassword: '',
      confirmPasswordRules: [
        v => !!v || 'Confirm-Passward is required',
      ],
      select: null,
      items: [
        'Item 1',
        'Item 2',
        'Item 3',
        'Item 4',
      ],
      checkbox: false,
    }),
 
    mounted: function(){
      console.log(this.$vuetify.breakpoint)
    },

    methods: {
      log () {
        console.log('here')
         console.log(this.$vuetify.breakpoint)
      },
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
              .post('http://localhost:3000/api/auth/', {
                  email: this.email,
                  name: this.name,
                  password: this.password,
                      password_confirmation: this.confirmPassword
                  
              })
              .then(response => (this.info = response))
              .catch 
            

      }

    },
  }
</script>