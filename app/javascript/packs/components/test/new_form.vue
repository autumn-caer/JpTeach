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

                  <v-radio-group v-model="item.answer" row>
                    <v-radio v-for="(option,idx) in item.options" :value="idx" :key="idx" :label="option"></v-radio>
                   </v-radio-group>
                   <v-btn
                        color="success"
                        class="mr-4"
                        @click="radioAdd(index)"
                  >選択肢追加</v-btn>
                  <v-btn
                      color="error"
                      class="mr-4"
                      @click="radioRemove(index)"
                  >選択肢削除</v-btn>
                   
                   <div v-for="(option,i) in item.options" :key="i">
                     <v-text-field v-model="item.options[i]"></v-text-field>
                   </div> 
                   <v-divider :inset="inset" :dark="dark" class ="md-6"></v-divider>
                </div>
                <v-btn
                  color="success"
                  class="mr-4"
                  @click="doAdd"
                >問題追加</v-btn>
                <v-btn
                  color="success"
                  class="mr-4"
                  @click="registTesfForm"
                >登録</v-btn>
              </v-form>
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
  import headerTestTypes from '../../../mixIns/headerTestTypeList'
  import Config from '../../../const/config'
  
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
          question_num: this.items.length
        }
        
        var params = [];
        let data = {};
        this.items.forEach(element =>{
             data = { 
               content: element.content, 
               answer: element.answer, 
               options: element.options
             }
            //  for (let step = 0; step < element.options.length; step++) {
            //    if (step == 0) {
            //      data.option_one = element.options[step]
            //    }
            //    if (step == 1) {
            //      data.option_two = element.options[step]
            //    }if (step == 2) {
            //      data.option_three = element.options[step]
            //    }if (step == 3) {
            //      data.option_four = element.options[step]
            //    }
            //  }
             
             params.push(data)
        });
  
         axios
              .post('http://localhost:3000/api/v1/test_form', {
                test_form_header: testFormHeader,
                test_forms: params
              })
              .then(response => {this.info = response.data.data.name;
     
              })
              .catch(error => this.info = error)

      }

    },
    computed: {
      currntItems() {
        return this.items;
      }
      
    },
    components: {
      navBar: NavBar
    }
  }
</script>