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
                  required></v-textarea>
                  <v-radio-group v-model="item.answer" row>
                    <v-radio :label="item.option_one" :value="item.option_one" color="brown darken-3"></v-radio>
                    <v-radio :label="item.option_two" :value="item.option_two" color="brown darken-3"></v-radio>
                    <v-radio :label="item.option_three" :value="item.option_three" color="brown darken-3"></v-radio>
                    <v-radio :label="item.option_four" :value="item.option4_four" color="brown darken-3"></v-radio>
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
  export default {
    data() {
      return {
        inset: false,
        dark: false,
        info: '',
        items: [
          {id: '1', 
           content: '問題1', 
           answer: 'one', 
           option_one: 'one', 
           option_two: 'two', 
           option_three: 'three', 
           option_four: 'four',
           },
           {id: '2', 
           content: '問題2', 
           answer: 'one', 
           option_one: 'one', 
           option_two: 'two', 
           option_three: 'three', 
           option_four: 'four',
           },
        ]
      }
    },
     mounted: function(){
            console.log('mounted');
            axios
            .get('http://localhost:3000/api/v1/test_form', {
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