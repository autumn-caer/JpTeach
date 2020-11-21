<template>
      <div>
        <v-container fluid>
        <v-row no-gutters>
          <v-col cols="12" sm="4" md="4" lg="4">
              <v-combobox
                v-model="filterType"
                :items="comboBoxes"
                label="Combobox"
                outlined
                dense
              ></v-combobox>
          </v-col>
          <v-col cols="12" sm="8" md="8" lg="8" v-show="filterType =='header_name'">
            <v-text-field
              v-model="search"
              append-icon="mdi-magnify"
              label="Search"
              single-line
              hide-details
              @input="statusChange"
            ></v-text-field>
          </v-col>
          <v-col cols="12" sm="8" md="8" lg="8" v-show="filterType =='test_type'">
              <v-combobox
                v-model="testType"
                :items="testTypeList"
                label="testType"
                outlined
                multiple
                dense
                @change="statusChange"
              ></v-combobox>
          </v-col>
          <v-col cols="12" sm="8" md="8" lg="8" v-show="filterType =='user_id'">
              <v-combobox
                v-model="userId"
                :items="userIdList"
                label="Combobox"
                outlined
                multiple
                dense
                @change="statusChange"
              ></v-combobox>
          </v-col>
           <v-col cols="12" sm="4" md="4" lg="4" v-show="filterType =='created_at'">
            <v-text-field v-model="createdTime" single-line>
              <template v-slot:append-outer>
                <date-picker v-model="createdTime"/>
              </template>
            </v-text-field>
          </v-col>
          <v-col cols="12" sm="4" md="4" lg="4" v-show="filterType =='created_at'">
              <v-combobox
                v-model="createdTimeType"
                :items="dateCondtionList"
                label="created_filter"
                outlined
                dense
                @change="statusChange"
              ></v-combobox>
          </v-col>
          <v-col cols="12" sm="8" md="8" lg="8" v-show="filterType =='id'">
              <v-combobox
                v-model="testFormId"
                :items="testFormIdList"
                label="id_filter"
                outlined
                dense
                @change="statusChange"
              ></v-combobox>
          </v-col>
        </v-row>
        <v-row min-height="700" no-gutters>
          <v-col cols="12" >
            <v-card 
              v-for="(item, index) in filterItems" :key="index" 
            　min-height="250"
              class ="ma-lg-4 ma-md-3 ma-sm-3 ma-3 pa-lg-4 pa-md-4 pa-sm-8 pa-8">
              <v-card-title class="headline" v-text="item.header_name"></v-card-title>
              <v-card-subtitle class="pb-0" :text-content.prop="item.test_type | HeaderTestFilter"></v-card-subtitle>
              <v-card-text class="text--primary">
                <div v-text="item.id"></div>
                <div v-text="item.name"></div>  
                <div v-text="item.question_num"></div>
                
                <v-card-actions>
                  <v-row>
                  <v-col lg="1" md="1" sm="12" cols="12">
                    <v-btn
                      color="orange"
                      text
                      @click="toAnswerPage(item.id)"
                    >
                      Answer
                    </v-btn>
                  </v-col>
                  <v-col lg="1" md="1" sm="12" cols="12">
                  <v-btn
                    color="orange"
                    text
                    @click="toEditPage(item.id)"
                  >
                    Edit
                  </v-btn>
                  </v-col>
                  <v-col lg="4" md="4" sm="12" cols="12">
                  <v-btn icon>
                    <v-icon>mdi-heart</v-icon>
                  </v-btn>
                  <v-btn icon>
                    <v-icon>mdi-bookmark</v-icon>
                  </v-btn>
                  <v-btn icon>
                    <v-icon>mdi-share-variant</v-icon>
                  </v-btn>
                  </v-col>
                  </v-row>
                </v-card-actions>
              </v-card-text>
            </v-card>
          </v-col>
          </v-row>
        </v-container>
        <div class="text-center">
          <v-pagination
            v-model="page"
            :length="length"
            @input = "pageChange"
            color = "brown"
          ></v-pagination>
        </div>
        <p>{{this.info}}</p>
        <p>{{this.createdTime}}</p>
      </div>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';
  import NavBar from '../shared/navbar.vue';
  import DatePicker from '../shared/date_picker.vue';
  import HeaderTestFilter from '../../../filters/headerTestFilter'
  export default {
    data() {
      return {
        inset: false,
        dark: false,
        changeFlag: false,
        info: '',
        page: 1,
        pageSize: 4,
        length: 0,
        search: '',
        currentSearch: '',
        filterType: '',
        currentFilterType: '',
        createdTime: '',
        createdTimeType: '',
        testType: [],
        userId: [],
        items: [],
        displayItems: [],
        keepFilteritems: [],
        testFormId: '',
        comboBoxes: [
          'header_name',
          'test_type',
          'user_id',
          'created_at',
          'id'],
        testTypeList:[],
        userIdList:[],
        testFormIdList: [],
        dateCondtionList:[
          '日付指定',
          '日付以前',
          '日付以後',
        ],
      }
    },
    filters: {
      HeaderTestFilter,
    },
     mounted: function(){
            axios
            .get('http://localhost:3000/api/v1/test_form_header', {
               email: this.email,
            })
            .then(response => {
              this.info = response.data.userIdList;
              response.data.testFormHeader.map(element => this.items.push(element))
              response.data.testTypeList.map(element => this.testTypeList.push(element))
              response.data.userIdList.map(element => this.userIdList.push(element))
              response.data.testFormIdList.map(element => this.testFormIdList.push(element))

              this.displayItems = this.items.slice(0,this.pageSize);
              this.length = Math.ceil(this.items.length/this.pageSize);
              this.keepFilteritems = this.items
              this.filterType = 'header_name'
              this.createdTime = this.$moment(this.getToday).format("YYYY-MM-DD")
            })
            .catch      
        },
    methods: {
      statusChange(){
        this.changeFlag = true;
      },

      toEditPage (id) {
           this.$router.push('/test_edit/' + id); 
        return;
      },
      toAnswerPage (id) {
           this.$router.push('/test_answer/' + id); 
        return;
      },
      pageChange (pageNumber){
        console.log('pageChange start',pageNumber)
        this.page = pageNumber
        this.displayItems = this.keepFilteritems.slice(this.pageSize*(pageNumber -1), this.pageSize*(pageNumber));
        console.log('pageChange end')
       },
       isAfter: function(start, end) {
        return this.$moment(start).isAfter(end);
      },
      isSame: function(start, end) {
        return this.$moment(start).isSame(end);
      },
      isBefore: function(start, end) {
        return this.$moment(start).isBefore(end);
      }
    },
    computed: {
      filterItems() {
        console.log('log01')
        if (this.search || this.testType) {
          if (this.filterType != this.currentFilterType) {
            this.page = 1;
          }
          if (this.changeFlag) { 
            this.page = 1;
          } 
       
          this.currentSearch = this.search
          this.currentFilterType = this.filterType
          console.log('log02')
          
          let tmpList = []
          switch (this.filterType) {
              case 'header_name':
                tmpList = this.items.filter(item => item.header_name.indexOf(this.search) != - 1);
                break;
              case 'test_type':
                if (this.testType.length){
                  tmpList = this.items.filter(item => this.testType.indexOf(item.test_type) >= 0);
                } else {
                  tmpList = this.items
                }
                break;
              case 'user_id':
                if (this.userId.length){
                  tmpList = this.items.filter(item => this.userId.indexOf(item.user_id) >= 0);
                } else {
                  tmpList = this.items
                }
                break;
              case 'created_at':
                if (this.createdTimeType == '日付指定')   {
                  tmpList = this.items.filter(item => this.isSame(this.$moment(item.created_at).format("YYYY/MM/DD"), this.getCreateAt));
                } else if(this.createdTimeType == '日付以前') {
                  tmpList = this.items.filter(item => this.isBefore(this.$moment(item.created_at).format("YYYY/MM/DD"), this.getCreateAt));
                } else {
                  tmpList = this.items.filter(item => this.isAfter(this.$moment(item.created_at).format("YYYY/MM/DD"), this.getCreateAt));
                }
               break;
              case 'id':
                if (this.testFormId){
                  tmpList = this.items.filter(item => this.testFormId ==  item.id);
                } else {
                  tmpList = this.items
                }
                break;
               default:
          }

          this.displayItems = tmpList.slice(this.pageSize*(this.page -1), this.pageSize*(this.page));
          this.length = Math.ceil(tmpList.length/this.pageSize);
          this.keepFilteritems = tmpList

        } else {
          console.log('log03')
          this.displayItems = this.items.slice(this.pageSize*(this.page -1), this.pageSize*(this.page));
          this.length = Math.ceil(this.items.length/this.pageSize);
          this.keepFilteritems = this.items
        }

        console.log('end')
         this.changeFlag = false;
        return this.displayItems
      },
      getToday() {
        return this.$moment().format("YYYY/MM/DD")
      },
      getCreateAt() {
        return this.$moment(this.createdTime).format("YYYY/MM/DD")
      }

    },
    components: {
      navBar: NavBar,
      datePicker: DatePicker
    }
  }
</script>