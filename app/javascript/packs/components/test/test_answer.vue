<template>
      <div>
        <v-row min-height="700">
          <navBar></navBar>
          <v-col md="10" class ="pa-md-0">
            <v-card class ="pa-md-10" 
            　min-height="300">
            <v-row no-gutters>
              <v-col
                cols="6"
                sm="6"
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
                cols="6"
                sm="6"
              >
                <v-card
                  class="pa-2"
                  outlined
                  tile
                >
                  <v-card-title class="headline" v-if="isCheckMode"> 
                    Score : 
                    {{checkResult}}</v-card-title>
                </v-card>
              </v-col>
            </v-row>
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
                  readonly
                  :rows = rows
                  required></v-textarea>
                  <div v-if="isCheckMode">
                  <v-chip
                    class="ma-2"
                    color="primary"
                    v-if = "checkAnswer(item.result)"
                  ><v-icon>mdi-checkbox-marked-circle</v-icon>
                    Correct                  </v-chip>
                  <v-chip
                    class="ma-2"
                    color="red"
                    text-color="white"
                    v-if = "!checkAnswer(item.result)"
                  ><v-icon>mdi-cancel</v-icon>
                    Wrong
                  </v-chip>
                  <span v-if = "!checkAnswer(item.result)">your Answer:  {{getLabel(item)}}</span>
                  </div>
                  <v-radio-group v-model="item.answer" row>
                    <v-radio v-for="(option, index) in item.options" :key="index" :label="option.label" :value="option.display_order" :on-icon="setAnswerRadio" :readonly="checkReadOnly" color="brown darken-3"></v-radio>
                  </v-radio-group>
                  <v-divider :inset="inset" :dark="dark" class ="md-6"></v-divider>
                </div>
                <v-btn
                  color="success"
                  class="mr-4"
                  @click="answerfForm"
                >解答</v-btn>
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
        info: '',
        top: '',
        mode: Config.MODE_ANSWER,
        rows: Config.TEST_TEXT_ROWS,
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
            .get('http://localhost:3000/api/v1/test_answer/' + this.$route.params.id, {
               email: this.email,
              
            })
            .then(response => {
              this.info = response.data;
              for (var key in response.data.testForms) {
                  this.items.push(response.data.testForms[key]);
              }
            })
            .catch      
        },
    components: {
      navBar: NavBar
    },
    methods: {
      checkAnswer(kbn) {
        return kbn === Config.CORRECT
      },
      getLabel(item) {
        let answer =  String(item.yourAnswer)
        let label = ''
        switch(answer) {
          case '1':
            label = item.option_one
            break;
          case '2':
            label = item.option_two
            break;
          case '3':
            label = item.option_three
            break;
          case '4':
            label = item.option_four
            break;
          default:
            break;
        }
        return label;
      },
      answerfForm () {
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
        
        var params = [];
        let data = {};
        this.items.forEach(element =>{
             data = { 
               id: element.id,
               content: element.content, 
               answer: element.answer, 
             }
             params.push(data)
        });

        axios
          .put('http://localhost:3000/api/v1/test_answer/' + this.$route.params.id, {
            test_forms: params
          })
          .then(response => {
              this.items = []
              this.info = response.data
              this.mode = Config.MODE_CHECK
              for (var key in response.data.testForms) {
                  this.items.push(response.data.testForms[key]);
              }
              
          })
          .catch(error => this.info = error)
      },
      changeOptionsorder(radioGroup) {

      }
    },
    computed: {
      isAnswerMode() {
        return this.mode === Config.MODE_ANSWER
      },
      isCheckMode() {
        return this.mode === Config.MODE_CHECK
      },
      checkResult() {
        let total = this.items.length
        let correctNum 
              = this.items.filter(element => element.result === String(Config.CORRECT))
        return  correctNum.length + "/"  + total
      },
      setAnswerRadio() {
        if (this.mode === Config.MODE_CHECK) {
          return  "mdi-checkbox-marked-circle"
        }
        return "$radioOn"
      },
      checkReadOnly() {
        if (this.mode === Config.MODE_CHECK) {
          return  true
        }
        return false
      },
      shuffledOptions() {
        var x = [item.option_one,item.option_two,item.option_three,item.option_four]
        x = x.map(function(a){return {weight:Math.random(), value:a}})
                .sort(function(a, b){return a.weight - b.weight})
                .map(function(a){return a.value});
        return x
      }
     }
  }
</script>