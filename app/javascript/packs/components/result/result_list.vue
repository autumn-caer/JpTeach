<template>
  <v-container fluid>
  <search-condition-area 
    :testTypeList="this.testTypeList"
    :userIdList ="this.userIdList"
    :testFormIdList ="this.testFormIdList"
    :pageSize ="this.pageSize"
    @input="filterChange"
  ></search-condition-area>
  <v-row min-height="700">
    <v-col cols="12" sm="12" md="6" lg="6">
      <v-card 
        v-for="(item, index) in filterItems" :key="index" 
      　min-height="250"
        class="ma-lg-4 ma-md-3 ma-sm-3 ma-3 pa-lg-4 pa-md-4 pa-sm-8 pa-8">
        <v-card-title class="headline" v-text="item.testFormHeaders.header_name">tes</v-card-title>
        <v-card-subtitle class="pb-0" :text-content.prop="item.testFormHeaders.test_type | HeaderTestFilter"></v-card-subtitle>
        <v-card-text class="text--primary">
          <div v-text="'version: ' + item.testFormHeaders.version"></div>  
          <div v-text="'questionNum: ' +item.testFormHeaders.question_num"></div>
          <div v-text="'テスト受験回数: ' +item.testFormHeaders.count_all"></div>

        <v-list-group>
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
      <div class="text-center">
          <v-pagination
            v-model="page"
            :length="length"
            @input = "pageChange"
            color = "brown"
          ></v-pagination>
      </div>
    </v-col>
    <v-col cols="12" sm="12" md="6" lg="6">
        <v-card-title class="headline">test</v-card-title>
        <notifications-tag :notifications ="this.notifications"></notifications-tag>
    </v-col>
    </v-row>
  </v-container>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';
  import NavBar from '../shared/navbar.vue';
  import HeaderTestFilter from '../../../filters/headerTestFilter'
  import searchResultCondition from '../../../mixIns/searchResultCondition';
  import Config from '../../../const/config';
  import notificationsJs from '../../../mixIns/notifications';
  
  export default {
    mixins: [ searchResultCondition, notificationsJs ],
    data() {
      return {
        inset: false,
        dark: false,
        page: 1,
        pageSize: 3,
        length: 0,
        info: '',
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
                response.data.testTypeList.map(element => this.testTypeList.push(element))
                response.data.userIdList.map(element => this.userIdList.push(element))
                response.data.testFormIdList.map(element => this.testFormIdList.push(element))
                this.setNotifications(response)
                for (var key in response.data.testFormHeaders) {
                  let data = {
                      testFormHeaders: response.data.testFormHeaders[key],
                      resultHeaders: response.data.resultHeaderList[key]
                  }

                  this.items.push(data);
                  this.displayItems = this.items.slice(0,this.pageSize);
                  this.length = Math.ceil(this.items.length/this.pageSize);
                  this.keepFilteritems = this.items
                  this.filterType = 'header_name'
                  this.createdTime = this.$moment(this.getToday).format("YYYY-MM-DD")
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
      pageChange (pageNumber){
        this.displayItems = this.items.slice(this.pageSize*(pageNumber -1), this.pageSize*(pageNumber));
       },
    },
    components: {
      navBar: NavBar
      // searchConditionArea: SearchConditionArea
    }
  }
</script>