<template>
      <div>
        <v-row min-height="700">
          <navBar></navBar>
          <v-col md="５">
            <v-card 
              v-for="(item, index) in items" :key="index" 
            　min-height="250"
              class="ma-md-3">
              <v-card-title class="headline" v-text="item.testFormHeaders.header_name">tes</v-card-title>
              <v-card-subtitle class="pb-0" :text-content.prop="item.testFormHeaders.test_type | HeaderTestFilter"></v-card-subtitle>
              <v-card-text class="text--primary">
                <div v-text="'version: ' + item.testFormHeaders.version"></div>  
                <div v-text="'questionNum: ' +item.testFormHeaders.question_num"></div>
                <div v-text="'テスト受験回数: ' +item.testFormHeaders.count_all"></div>

              <v-list-group 
              >
                <template v-slot:activator>
                  <v-list-item-title>Users</v-list-item-title>
                </template>
                <v-list-item v-for="(resultHeader, index) in item.resultHeaders"
                             :key="index" link 
                             @click="toResultPage(resultHeader.id)">
                    <v-list-item-title v-text="'try_time: ' +resultHeader.try_time">
                    </v-list-item-title>
                    <v-list-item-icon>
                      <v-icon >mdi-magnify</v-icon>
                    </v-list-item-icon>
                </v-list-item>
              </v-list-group>
                <v-card-actions>
                  <v-btn
                    color="orange"
                    text
                    @click="toAnswerPage(item.testFormHeaders.id)"
                  >
                    Answer
                  </v-btn>
                  <v-btn
                    color="orange"
                    text
                    @click="toEditPage(item.testFormHeaders.id)"
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
          <v-col md="５">
            <v-card 
            　min-height="500"
              class="ma-md-3">
                <v-card-title class="headline">test</v-card-title>
              </v-card>
          </v-col>
          </v-row>
          <p>{{this.info}}</p>
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
            .get('http://localhost:3000/api/v1/result_header', {
               email: this.email,
            })
            .then(response => {
              this.info = response.data;
                for (var key in response.data.testFormHeaders) {
                  let data = {
                      testFormHeaders: response.data.testFormHeaders[key],
                      resultHeaders: response.data.resultHeaderList[key]
                  }
                  this.items.push(data);
                }
            })
            .catch      
        },
    methods: {
      toEditPage (id) {
           this.$router.push('/test_edit/' + id); 
        return;
      },
      toResultPage (id) {
           this.$router.push('/result/' + id); 
        return;
      },
    },
    components: {
      navBar: NavBar
    }
  }
</script>