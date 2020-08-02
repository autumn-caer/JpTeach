<template>
  <div>
    <v-container fluid class="pa-md-0">
      <v-row>
        <v-col md="6" class="pa-md-0">
          <v-card
            class ="pa-md-6 profile"
            min-height="600"
          >
            <div class="white--text text-h3">user page</div>
          </v-card>
        </v-col>
        <v-col md="6" class="pa-md-0">
          <v-card
            class ="pa-md-6"
            min-height="600"
            >
            <v-card :elevation="0" color="amber lighten-5">
              <v-card-title class="headline">Profile</v-card-title>
              <v-card-subtitle>Listen to your favorite artists and albums whenever and wherever, online and offline.</v-card-subtitle>
              <v-card-text class="text--primary">
                <div>{{getUserId}}</div>
                <div>{{getUserName}}</div>
                <div>{{getEmail}}</div>
              </v-card-text>
             </v-card>
             <v-divider
                class="md-6"
                vertical
              ></v-divider>
            <v-card :elevation="0" color="amber lighten-5">
              <v-card-title class="headline">Test Page</v-card-title>
              <v-card-subtitle>Listen to your favorite artists and albums whenever and wherever, online and offline.</v-card-subtitle>
            </v-card>
             <v-divider
                class="md-6"
                vertical
              ></v-divider>
            <v-card :elevation="0" color="amber lighten-5">
              <v-card-title class="headline">Follewers Time Line</v-card-title>
              <v-card-subtitle>Listen to your favorite artists and albums whenever and wherever, online and offline.</v-card-subtitle>
            </v-card>
            <v-divider
                class="md-6"
                vertical
              ></v-divider>
            <v-card :elevation="0" color="amber lighten-5">
              <v-card-title class="headline">JpTech Sign Up</v-card-title>
              <v-card-subtitle>Listen to your favorite artists and albums whenever and wherever, online and offline.</v-card-subtitle>
            </v-card>
             <v-divider
                class="md-6"
                vertical
              ></v-divider>
            <v-form>
              <v-btn
                color="warning"
                @click="backToRoot"
                >
                Back to URL
              </v-btn>
              <v-btn
                color="warning"
                @click="backToRoot"
                >
                Back to URL
              </v-btn>
           </v-form>
          </v-card>
        </v-col>
      </v-row>
 
    </v-container>
  </div>
</template>
<script>
import { mapGetters } from 'vuex';

export default {
  data: function () {
    return {
      message: "Log in",
      tab: null,
      items: [
        'web', 'shopping', 'videos', 'images', 'news',
      ],
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    }
  },
  computed: {
    ...mapGetters([
      'getUserId',
      'getUserName',
      'getEmail'
    ]),
  
  },
  
  methods: {
      backToRoot () {
          this.$router.push('/');
      }
  }
}
</script>
<style scoped>
  .profile {
    background: url("../../../../assets/images/dam.jpg");
    background-size: cover;
    background-position: center center;
  
  }


</style>