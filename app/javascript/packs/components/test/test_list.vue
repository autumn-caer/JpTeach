<template>
      <div>
        <v-container fluid>
        <search-condition-area 
          :testTypeList="this.testTypeList"
          :userIdList ="this.userIdList"
          :testFormIdList ="this.testFormIdList"
          :pageSize ="this.pageSize"
          @input="filterChange"
        ></search-condition-area>
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
        <p>検索；  {{this.search}}</p>
        <p>displayItems；{{this.displayItems}}</p>
      </div>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';
  import SearchConditionArea from '../shared/search_condition_area.vue';
  import HeaderTestFilter from '../../../filters/headerTestFilter'
  import searchCondition from '../../../mixIns/searchCondition';
  import Config from '../../../const/config';
  
  export default {
    mixins: [ searchCondition ],
    data() {
      return {
        inset: false,
        dark: false,
        info: '',
        pageSize: Config.LIST_PAGE_SIZE,
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
      toEditPage (id) {
           this.$router.push('/test_edit/' + id); 
        return;
      },
      toAnswerPage (id) {
           this.$router.push('/test_answer/' + id); 
        return;
      },
    },
  
    components: {
      searchConditionArea: SearchConditionArea
    }
  }
</script>