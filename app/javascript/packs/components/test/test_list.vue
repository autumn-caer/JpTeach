<template>
      <div>
        <v-row min-height="700">
          <navBar></navBar>
          <v-col md="10">
            <v-card 
              v-for="(item, index) in items" :key="index" 
            　min-height="250"
              class="ma-md-3">
              <v-card-title class="headline" v-text="item.header_name"></v-card-title>
              <v-card-subtitle class="pb-0" :text-content.prop="item.test_type | HeaderTestFilter"></v-card-subtitle>
              <v-card-text class="text--primary">
                <div v-text="item.id"></div>
                <div v-text="item.name"></div>  
                <div v-text="item.question_num"></div>
                <v-card-actions>
                  <v-btn
                    color="orange"
                    text
                    @click="toAnswerPage(item.id)"
                  >
                    Answer
                  </v-btn>
                  <v-btn
                    color="orange"
                    text
                    @click="toEditPage(item.id)"
                  >
                    Edit
                  </v-btn>
                  <v-btn icon>
                    <v-icon>mdi-heart</v-icon>
                  </v-btn>
                  <v-btn icon>
                    <v-icon>mdi-bookmark</v-icon>
                  </v-btn>
                  <v-btn icon>
                    <v-icon>mdi-share-variant</v-icon>
                  </v-btn>
                </v-card-actions>
              </v-card-text>
            </v-card>
          </v-col>
          </v-row>
          <p>{{this.items}}</p>
      </div>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';
  import NavBar from '../shared/navbar.vue';
  import HeaderTestFilter from '../../../filters/headerTestFilter'
  export default {
    data() {
      return {
        inset: false,
        dark: false,
        info: '',
        items: []
      }
    },
    filters: {
      HeaderTestFilter,
    },
     mounted: function(){
            console.log('testlist mounted');
            axios
            .get('http://localhost:3000/api/v1/test_form_header', {
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
    methods: {
      toEditPage (id) {
           this.$router.push('/test_edit/' + id); 
        return;
      },
      toAnswerPage (id) {
           this.$router.push('/test_answer/' + id); 
        return;
      }
    },
    components: {
      navBar: NavBar
    }
  }
</script>