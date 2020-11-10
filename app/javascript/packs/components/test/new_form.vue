<template>
      <div>
        <v-container>
        <v-row min-height="700">
          <v-col cols="12">
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
                <v-card
                  class="pa-2"
                  outlined
                  tile
                >
                   <v-card-title class="headline">Version: {{this.version}}</v-card-title>
                </v-card>
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
               <v-radio-group v-model="testType" row>
                <v-radio v-for="(testType,idx) in headerTestTypes" :value="testType.id" :key="idx" :label="testType.value"></v-radio>
               </v-radio-group>
                <v-divider :inset="inset" :dark="dark" class ="md-6"></v-divider>
                <div v-for="(item, index) in currntItems" :key="index" class="form">
                  <v-textarea
                  auto-grow
                  v-model="item.content"
                  :label="'question' + item.id" 
                  :rows = rows
                  required></v-textarea>

                  <v-row >
                    <v-col cols="12">
                      <v-radio-group v-model="item.answer" row>
                        <v-radio v-for="(option,idx) in item.options" :value="idx" :key="idx" :label="option"></v-radio>
                      </v-radio-group>
                    </v-col>
                  </v-row>

                   <v-row >
                    <v-col lg="4" md="4" sm="12" cols="12">
                      <v-btn
                        block
                        color="success"
                        class="mr-4"
                        @click="radioAdd(index)"
                      >選択肢追加</v-btn>
                    </v-col>
                    <v-col lg="4" md="4" sm="12" cols="12">
                      <v-btn
                        block
                        color="error"
                        class="mr-4"
                        @click="radioRemove(index)"
                      >選択肢削除</v-btn>
                    </v-col>
                  </v-row>
                   
                   <div v-for="(option,i) in item.options" :key="i">
                     <v-text-field v-model="item.options[i]"></v-text-field>
                   </div> 
                   <v-divider :inset="inset" :dark="dark" class ="md-6"></v-divider>
                </div>
                <v-row>
                  <v-col lg="4" md="4" sm="12" cols="12">
                    <v-btn
                      block
                      color="success"
                      class="mr-4"
                      @click="doAdd"
                    >問題追加</v-btn>
                  </v-col>
                  <v-col lg="4" md="4" sm="12" cols="12">
                    <v-btn
                      block
                      color="success"
                      class="mr-4"
                      @click="registTesfForm"
                    >登録</v-btn>
                  </v-col>
                </v-row>
              </v-form>
            </v-card>
          </v-col>
          </v-row>
          </v-container>
          <p>{{this.info}}</p>
          <div>{{getTestFormHeaderId}}</div>
      </div>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';
  import NavBar from '../shared/navbar.vue';
  import headerTestTypes from '../../../mixIns/headerTestTypeList'
  import Config from '../../../const/config'
  import { mapGetters } from 'vuex';
  
  export default {
    mixins: [ headerTestTypes ],
    data() {
      return {
        inset: false,
        dark: false,
        idCount: 1,
        info:'',
        rows: Config.TEST_TEXT_ROWS,
        header_name:'',
        question_num: 0,
        version: 0,
        test_form_version_operation_id:'',
        items: [
          {id: 1 ,
           content: '問題1', 
           answer: 1, 
           options:['one','two']
           },
        ],
        testType:'',
      }
    },
     mounted: function(){
        console.log('mounted');
        let testFormHeaderId = this.$store.getters.getTestFormHeaderId
        if (testFormHeaderId) {
            axios
            .get('http://localhost:3000/api/v1/test_form/' + testFormHeaderId, {
              headers: { "Content-Type": "application/json" }
            })
            .then(response => {
       
              this.items = []
              this.info = response.data;
              this.message = response.data.message
              this.header_name = response.data.testFormHeader.header_name
              this.testType = response.data.testFormHeader.test_type
              this.test_form_version_operation_id = response.data.testFormHeader.test_form_version_operation_id
              this.version = response.data.testFormHeader.version + 1

              this.idCount = 0
              response.data.testForms.forEach(testForm =>{
                this.idCount++
                let data = {
                  id: this.idCount ,
                  content: testForm.content, 
                  answer: testForm.display_order, 
                  options:[]
                }
                
                testForm.options.forEach(option =>{
                  data.options.push(option.label)
                })

                this.items.push(data);
              })


              this.$store.commit('setTestFormHeaderId','');
            })
            .catch      
        }


    },
    methods: {
      doAdd () {
          this.items.push({id: this.countUp(), 
           content: 'testpushed', 
           answer: '1', 
           options:[]
           });
      },
      radioAdd (index) {
        this.items[index].options.push('newRadio');
      },
      radioRemove (index) {
        this.items[index].options.splice(this.items[index].options.length -1,1);
      },
      countUp() {
          this.idCount++;
          return this.idCount;
      },
      registTesfForm () {

        var userId = this.$store.getters.getUserId
        if (!userId) {
          userId = 1
        }
        var testFormHeader = {
          user_id: '1',
          test_type: this.testType,
          header_name: this.header_name,
          question_num: this.items.length,
          version: this.version
        }
        
        var params = [];
        let data = {};
        this.items.forEach(element =>{
             data = { 
               content: element.content, 
               answer: element.answer, 
               options: element.options
             }
             params.push(data)
        });
  
         axios
              .post('http://localhost:3000/api/v1/test_form', {
                test_form_version_operation_id: this.test_form_version_operation_id,
                test_form_header: testFormHeader,
                test_forms: params
              })
              .then(response => {
                this.info = response.data.data.name;
                console.log('new form registed');
              })
              .then(this.$router.push('/testlist'))
              .catch(error => this.info = error)


      }

    },
    computed: {
      ...mapGetters([
      'getUserId',
      'getUserName',
      'getEmail',
      'getTestFormHeaderId'
      ]),
      currntItems() {
        return this.items;
      }
      
    },
    components: {
      navBar: NavBar
    }
  }
</script>