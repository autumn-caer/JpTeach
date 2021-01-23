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
        <v-row min-height="700" no-gutters>
          <v-col lg="7" md="7" sm="7" cols="12">
          <v-card
            min-height="700"
            class=""
          > 
          <v-system-bar></v-system-bar>
          <v-list three-line>
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
                {{item.header_name}}
              </v-chip>
              <span>
              <div class="text-uppercase font-weight-regular caption ml-3">
                <span>
                  <v-icon left color="success">
                    mdi-music-accidental-sharp
                  </v-icon>
                  ID : 
                </span>
                <span v-text="item.id"></span>
              </div>
              <div class="text-uppercase font-weight-regular caption ml-3">
                <span>
                  <v-icon left color="success">
                    mdi-cube-outline
                  </v-icon>
                </span>
                <span :text-content.prop="item.test_type | HeaderTestFilter"></span>
              </div>
              <div class="text-uppercase font-weight-regular caption ml-3">
                <span> 
                   <v-icon left color="success">
                    mdi-calendar-range
                  </v-icon>
                  作成日 : 
              </span>
                <span>{{item.created_at | moment("YYYY年MM月DD日") }}</span>
              </div>
              <div class="text-uppercase font-weight-regular caption ml-3">
                <span>
                  <v-icon left color="success">
                    mdi-account-outline
                  </v-icon>
                  作成者 : 
                </span>
                <span v-text="item.name"></span>
              </div>
               <div class="text-uppercase font-weight-regular caption ml-3">
                <span>
                  <v-icon left color="success">
                    mdi-check
                  </v-icon>
                  問題数 : 
                </span>
                <span v-text="item.question_num"></span>
              </div>
              <div class="text-uppercase font-weight-regular caption ml-3">
                <span>
                  <v-icon left color="success">
                    mdi-check
                  </v-icon>
                  公開区分 : 
                </span>
                <span>{{item.open_type | OpenTypeFilter}}</span>
              </div>
              <div class="text-uppercase font-weight-regular caption ml-3">
                <span>
                  <v-icon left color="success">
                    mdi-check
                  </v-icon>
                  テスト_version : 
                </span>
                <span v-text="item.version"></span>
              </div>
                    <v-card-actions>
                      <v-spacer></v-spacer>
                      <v-btn
                      color="orange"
                      text
                      class="buttonHover"
                      @click="toAnswerPage(item.id)"
                      >
                      Answer
                     </v-btn>
                     <v-btn
                       color="orange"
                       text
                       class="buttonHover"
                       @click="toEditPage(item.id)"
                      >
                      Edit
                     </v-btn>
                    </v-card-actions>
            </v-list-item-content>
          </v-list-item>
        </v-list>
        </v-card>
          </v-col>
          <v-col lg="4" md="4" sm="4" cols="12">
            <p>right</p>
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
        <p>{{this.userIdList}}</p>
        <p>検索；  {{this.search}}</p>
        <p>displayItems；{{this.displayItems}}</p>
      </div>
</template>
<script>
  // axiosを読み込む
  import axios from 'axios';
  import HeaderTestFilter from '../../../filters/headerTestFilter'
  import OpenTypeFilter from '../../../filters/openTypeFilter'
  import { mapGetters } from 'vuex';
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
      OpenTypeFilter
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
      }
    },
    computed: {
      ...mapGetters([
        'getUserId',
        'getUserName',
        'getEmail'
      ]),
    },
  }
</script>
<style scoped>
.itemHover:hover {
	background-color:#f8f7f6; 	/*リンクにマウスが乗ったら背景色を変更する*/
}
.buttonHover:hover {
  background-color:#795548; 	/*リンクにマウスが乗ったら背景色を変更する*/
  color:#FFFFFF !important;
}
</style>