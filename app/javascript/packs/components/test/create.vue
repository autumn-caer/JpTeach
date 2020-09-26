<template>
      <div>
        <v-row min-height="700">
          <navBar></navBar>
          <v-col md="10" class ="pa-md-0">
            <v-card class ="pa-md-10" 
            　min-height="300">
              <v-card-title class="headline">Test Sample Form</v-card-title>
              <v-form
                ref="form"
                v-model="valid"
                lazy-validation
              >
                <v-divider :inset="inset" :dark="dark" class ="md-6"></v-divider>
                <div v-for="(item, index) in items" :key="index" class="form">
                  <v-textarea
                  auto-grow
                  v-model="item.content"
                  :label="'question' + item.id" 
                  :rows = rows
                  required></v-textarea>
                  <v-radio-group v-model="item.answer" row>
                    <v-radio v-if="item.option_one !== null" :label="item.option_one" :value="1" color="brown darken-3"></v-radio>
                    <v-radio v-if="item.option_two !== null" :label="item.option_two" :value="2" color="brown darken-3"></v-radio>
                    <v-radio v-if="item.option_three !== null" :label="item.option_three" :value="3" color="brown darken-3"></v-radio>
                    <v-radio v-if="item.option_four !== null" :label="item.option_four" :value="4" color="brown darken-3"></v-radio>
                   </v-radio-group>
                   <v-divider :inset="inset" :dark="dark" class ="md-6"></v-divider>
                </div>
              </v-form>
            </v-card>
          </v-col>
          </v-row>
          <p>{{this.info}}</p>
      </div>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';
  import NavBar from '../shared/navbar.vue';
  import Config from '../../../const/config'
  
  export default {
    data() {
      return {
        inset: false,
        dark: false,
        rows: Config.TEST_TEXT_ROWS,
        info: '',
        top: '',
        items: []
      }
    },
     mounted: function(){
            console.log('mounted');
            axios
            .get('http://localhost:3000/api/v1/test_form/' + this.$route.params.id, {
               email: this.email,
              
            })
            .then(response => {
              this.info = response.data;
                for (var key in response.data) {
                   this.items.push(response.data[key]);
                }
            })
            .catch      
        },
    components: {
      navBar: NavBar
    }
  }
</script>