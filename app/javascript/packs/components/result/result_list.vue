<template>
  <div>
  <search-condition-area 
    :testTypeList="this.testTypeList"
    :userIdList ="this.userIdList"
    :testFormIdList ="this.testFormIdList"
    :pageSize ="this.pageSize"
    @input="filterChange"
  ></search-condition-area>
   <div class="text-center">
          <v-pagination
            v-model="page"
            :length="length"
            @input = "pageChange"
            color = "brown"
          ></v-pagination>
    </div>
   <v-container fluid>
  <v-row min-height="700">
    <v-col cols="12" sm="12" md="6" lg="6">
      <v-system-bar></v-system-bar>
      <v-list>
      <v-list-item
            v-for="(item, i) in filterItems"
            :key="i"
            ripple
            class="itemHover"
          >
            <v-list-item-content>
              <v-chip
                color="success"
                outlined
              >
                <v-icon left>
                  mdi-note-text-outline
                </v-icon>
                {{item.testFormHeaders.header_name}}
              </v-chip>
              <span>
              <div class="text-uppercase font-weight-regular caption ml-3">
                <span>
                  <v-icon left color="success">
                    mdi-music-accidental-sharp
                  </v-icon>
                </span>
                <span :text-content.prop="item.testFormHeaders.test_type | HeaderTestFilter"></span>
              </div>
              <div class="text-uppercase font-weight-regular caption ml-3">
                <span> 
                   <v-icon left color="success">
                    mdi-calendar-range
                  </v-icon>
                  作成日 : 
              </span>
                <span>{{item.testFormHeaders.created_at | moment("YYYY年MM月DD日") }}</span>
              </div>
              <div class="text-uppercase font-weight-regular caption ml-3">
                <span>
                  <v-icon left color="success">
                    mdi-account-outline
                  </v-icon>
                  作成者 : 
                </span>
                <span v-text="item.testFormHeaders.user_id"></span>
              </div>
               <div class="text-uppercase font-weight-regular caption ml-3">
                <span>
                  <v-icon left color="success">
                    mdi-check
                  </v-icon>
                  問題数 : 
                </span>
                <span v-text="item.testFormHeaders.question_num"></span>
              </div>
              <div class="text-uppercase font-weight-regular caption ml-3">
                <span>
                  <v-icon left color="success">
                    mdi-check
                  </v-icon>
                  公開区分 : 
                </span>
                <span>{{item.testFormHeaders.open_type | OpenTypeFilter}}</span>
              </div>
              <div class="text-uppercase font-weight-regular caption ml-3">
                <span>
                  <v-icon left color="success">
                    mdi-check
                  </v-icon>
                  テスト受験回数 : 
                </span>
                <span>{{item.testFormHeaders.count_all}}</span>
              </div>
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
                      <v-btn
                        color="orange"
                        text
                        >
                        Check
                      </v-btn>
                      </v-list-item-icon>
                  </v-list-item>
                </v-list-group>
            </v-list-item-content>
          </v-list-item>
        </v-list>
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
    <p>{{this.userIdList}}</p>
        <p>displayItems；{{this.displayItems}}</p>
  </v-container>
  </div>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';
  import NavBar from '../shared/navbar.vue';
  import HeaderTestFilter from '../../../filters/headerTestFilter'
  import OpenTypeFilter from '../../../filters/openTypeFilter'
  import searchResultCondition from '../../../mixIns/searchResultCondition';
  import Config from '../../../const/config';
  import notificationsJs from '../../../mixIns/notifications';
  import { mapGetters } from 'vuex';
  
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
      OpenTypeFilter
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
      ...mapGetters([
        'getUserId',
        'getUserName',
        'getEmail'
      ]),
      navBar: NavBar
    }
  }
</script>
<style scoped>
.itemHover:hover {
	background-color:#f8f7f6; 	/*リンクにマウスが乗ったら背景色を変更する*/
}
</style>