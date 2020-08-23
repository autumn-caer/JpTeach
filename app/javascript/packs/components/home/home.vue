<template>
      <div>
        <v-row min-height="700">
          <navBar></navBar>
          <v-col md="10">
            <v-card 
            　min-height="300"
              class="ma-md-3">
              <v-card-title class="headline">JpTech Sign Up</v-card-title>
            </v-card>
            <v-card 
            　min-height="600"
              class="ma-md-3">
              <v-card-title class="headline">JpTech Sign Up</v-card-title>
            </v-card>
            <v-card 
            　min-height="200"
              class="ma-md-3">
              <v-card-title class="headline">JpTech Sign Up</v-card-title>
            </v-card>
          </v-col>
          </v-row>
      </div>
</template>
<script>
  import NavBar from '../shared/navbar.vue';
  export default {
    data() {
      return {
      }
    },
    components: {
      navBar: NavBar
    }
  }
</script>