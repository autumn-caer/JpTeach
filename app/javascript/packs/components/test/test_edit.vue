<template>
      <div>
        <v-container>
        <v-row min-height="700">
          <v-col cols="12">
            <v-card class ="pa-md-10" 
            　min-height="300">
            <v-row>
              <v-alert
                dense
                text
                type="success"
                v-if="this.message !== null"
              >
                {{this.message}}
              </v-alert>
            </v-row>
            <v-row no-gutters>
              <v-col
                lg="6" md="6" sm="12" cols="12"
              >
                <v-card
                  class="pa-2"
                  outlined
                  tile
                >
                  <v-card-title class="headline">Test Sample Form</v-card-title>
                </v-card>
              </v-col>
              <v-col
                lg="6" md="6" sm="12" cols="12"
              >
                <v-row>
                  <v-col lg="4" md="4" sm="12" cols="12">
                   <v-card
                      class="pa-2"
                      outlined
                      tile
                    >
                      <v-btn
                        block
                        color="success"
                        class="mr-4"
                        @click="createNewForm"
                      >新規version作成</v-btn> 
                    </v-card>
                  </v-col>
                </v-row>
              </v-col>
            </v-row>
            <v-card class ="pa-lg-10 pa-md-10 pa-sm-8 pa-10"
            　min-height="300">
              <v-form
                ref="form"
                v-model="valid"
                lazy-validation
              >
               <v-text-field v-model="header_name" label="テスト説明"></v-text-field>
               <v-radio-group v-model="test_type" row>
                <v-radio v-for="(testType,idx) in headerTestTypes" :value="testType.id" :key="idx" :label="testType.value"></v-radio>
               </v-radio-group>
                <v-divider :inset="inset" :dark="dark" class ="md-6"></v-divider>
                <div v-for="(item, index) in items" :key="index" class="form">
                  <v-textarea
                  auto-grow
                  v-model="item.content"
                  :label="'question' + item.id" 
                  :rows = rows
                  required></v-textarea>
                  <v-radio-group v-model="item.display_order" row readonly>
                     <div v-for="(option, index) in item.options" :key="index">
                      <testRadio :optionLabel="option.label" :optionValue="option.display_order" :on-icon="setAnswerRadio" color="brown darken-3"></testRadio>
                     </div>
                  </v-radio-group>
                   <div v-for="(option,i) in item.options" :key="i">
                     <v-text-field v-model="option.label"></v-text-field>
                   </div> 
                  <v-divider :inset="inset" :dark="dark" class ="md-6"></v-divider>
                  <v-row>
                    <v-col lg="4" md="4" sm="12" cols="12">
                      <v-btn
                            block
                            color="success"
                            class="mr-4"
                            @click="changeOptionsOrder(index)"
                      >選択肢シャッフル</v-btn>
                    </v-col>
                    <v-col lg="4" md="4" sm="12" cols="12">
                      <v-btn
                          block
                          color="success"
                          class="mr-4"
                          @click="editForm"
                        >変更</v-btn> 
                    </v-col>
                  </v-row>
                </div>
               
              </v-form>
            </v-card>
            </v-card>
          </v-col>
          </v-row>
        </v-container>
        
          <p>{{this.info}}</p>
      </div>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';
  import NavBar from '../shared/navbar.vue';
  import TestRadio from './parts/test_radio.vue';
  import Config from '../../../const/config';
  import headerTestTypes from '../../../mixIns/headerTestTypeList';
  export default {
    mixins: [ headerTestTypes ],
    data() {
      return {
        inset: false,
        dark: false,
        message: '',
        info: '',
        top: '',
        mode: Config.MODE_ANSWER,
        rows: Config.TEST_TEXT_ROWS,
        header_name: '',
        test_type: '',
        test_form_header_id: '',
        items: [],
        justify: [
          'start',
          'end',
          'center',
          'space-between',
          'space-around',
        ],
      }
    },
     mounted: function(){
            console.log('mounted');
            axios
            .get('http://localhost:3000/api/v1/test_form/' + this.$route.params.id, {
              headers: { "Content-Type": "application/json" },
               email: this.email,
              
            })
            .then(response => {
       
              this.info = response.data;
              this.message = response.data.message
              this.header_name = response.data.testFormHeader.header_name
              this.test_type = response.data.testFormHeader.test_type
              this.test_form_header_id = response.data.testFormHeader.id

              for (var key in response.data.testForms) {
                  this.items.push(response.data.testForms[key]);
              }

            })
            .catch      
        },
    components: {
      navBar: NavBar,
      testRadio: TestRadio
    },
    methods: {
      editForm () {
        var userId = this.$store.getters.getUserId
        if (!userId) {
          userId = 1
        }
        var testFormHeader = {
          user_id: userId,
          test_type: this.testType,
          header_name: this.header_name,
          question_num: this.items.length
        }
        
        let params = [];
        let test_form_header = {
          header_name: this.header_name,
          test_type: this.test_type,
          id: this.test_form_header_id
        };

        let data = {};
        this.items.forEach(element =>{
             data = { 
               id: element.id,
               content: element.content, 
               answer: element.answer, 
               content: element.content,
               options: element.options
             }
             params.push(data)
        });
        axios
          .put('http://localhost:3000/api/v1/test_form/' + this.$route.params.id, {
            test_form_header: test_form_header,
            test_forms: params
          })
          .then(response => {
              this.items = []
              this.info = response.data
              this.mode = Config.MODE_ANSWER
              this.message = response.data.message
              for (var key in response.data.testForms) {
                  this.items.push(response.data.testForms[key]);
              }
              
          })
          .catch(error => this.info = error)
      },
      createNewForm () {
        this.$store.commit('setTestFormHeaderId',this.test_form_header_id);
        this.$router.push('/newform'); 
        return;
      }
    },
    computed: {
      setAnswerRadio() {
        if (this.mode === Config.MODE_CHECK) {
          return  "mdi-checkbox-marked-circle"
        }
        return "$radioOn"
      },
      changeOptionsOrder() {
        return function(index) {
          let array = this.items[index].options
          let currentAnswer = this.items[index].display_order
         //選択肢をシャッフル
          for (let i = array.length - 1; i >= 0; i--) {
                  let r = Math.floor(Math.random() * (i + 1))
                  let tmp = array[i]
                  array[i] = array[r]
                  array[r] = tmp
          }

          this.$set(this.items[index], "options", array)
          // radioの選択値変更をDOMに通知するために、一旦nullに変更後、元に戻す。
          this.$set(this.items[index], "display_order", null)
          this.$nextTick(()=> {
            this.$set(this.items[index], "display_order", currentAnswer)
          })
        }
      }
     }
  }
</script>