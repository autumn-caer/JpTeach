<template>
   <div min-height="750px">
    <v-navigation-drawer app v-model="drawer" clipped>
       <v-list class="pa-1">
        <v-list-tile avatar>
          <v-list-tile-content>
            <v-list-tile-title>John Leider</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
      <v-list>
        <v-text-field
          clearable
          flat
          label="Search"
          prepend-inner-icon="mdi-view-dashboard"
          solo
          single-line
          hide-details
        ></v-text-field>
      </v-list>
      <v-list class="pt-0" dense shaped>
        <v-divider></v-divider>
        <v-list-item v-for="item in items" 
                    :key="item" link @click="proceedUrl(item)">
          <v-list-item-icon>
            <v-icon>{{"mdi-view-dashboard"}}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-tile-title>{{ item }}</v-list-tile-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar color="green accent-4" height="60px" class ="py-0" dark app clipped-left>
      <v-toolbar-title>Page title</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items>
      <v-btn icon>  
        <v-icon>mdi-heart</v-icon>
      </v-btn>
      <v-btn icon>  
        <v-icon>mdi-magnify</v-icon>
      </v-btn>
      </v-toolbar-items>
     <v-app-bar-nav-icon
        @click.stop="drawer = !drawer"
        class="hidden-lg-and-up"
      ></v-app-bar-nav-icon>
   
     <!-- <v-toolbar-items class="hidden-sm-and-down">
      <v-btn icon>  
        <v-icon>mdi-heart</v-icon>
      </v-btn>

      <v-btn icon>  
        <v-icon>mdi-magnify</v-icon>
      </v-btn>

      <v-menu
        left
        bottom
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            icon
            v-bind="attrs"
            v-on="on"
          >
            <v-icon>mdi-dots-vertical</v-icon>
          </v-btn>
        </template>      
        <v-list>
          <v-list-item
            v-for="item in items"
            :key="item"
            @click="proceedUrl(item)"
          >
            <v-list-item-title>Option {{ item }}</v-list-item-title>
          </v-list-item>
        </v-list>
  
      </v-menu>
      </v-toolbar-items> -->
    </v-app-bar>

    </div>
</template>
<script>
export default {
  data: function () {
    return {
      drawer: null,
      items: [
        'userpage', 'login','listview','home','testlist','newform','resultlist','user_search', 'user_edit', 'testDate'
      ],
      drawer: null,
      showSearchInput: false,
    }
  },
  methods: {
      proceedUrl (pathUrl) {
        
      if (pathUrl == 'login') {
        if(this.$store.getters.getUserId){
          this.$router.push('/userpage');
          return;
        }
        //ユーザーページに移動
        this.$router.push('/' + pathUrl); 
        return;
      }

      //userpageの場合
      if (pathUrl == 'userpage') {
        if(!this.$store.getters.getUserId){
          this.$router.push('/');
          return;
        }
        //ユーザーページに移動
        this.$router.push('/' + pathUrl);  
        return;
      }

      if (pathUrl == 'listview') {
        // if(this.$store.getters.getUserId){
        //   this.$router.push('/userpage');
        //   return;
        // }
        //ユーザーページに移動
        this.$router.push('/' + pathUrl); 
        return;
      }

      if (pathUrl == 'home') {
        //ユーザーページに移動
        this.$router.push('/' + pathUrl); 
        return;
      }

      if (pathUrl == 'testlist') {
        //ユーザーページに移動
        this.$router.push('/' + pathUrl); 
        return;
      }

      if (pathUrl == 'newform') {
        //新規作成に移動
        this.$router.push('/' + pathUrl); 
        return;
      }

      if (pathUrl == 'resultlist') {
        //新規作成に移動
        this.$router.push('/' + pathUrl); 
        return;
      }
      if (pathUrl == 'user_search') {
        //新規作成に移動
        this.$router.push('/' + pathUrl); 
        return;
      }
      if (pathUrl == 'user_edit') {
        //新規作成に移動
        this.$router.push('/' + pathUrl); 
        return;
      }
      if (pathUrl == 'testDate') {
        //新規作成に移動
        this.$router.push('/' + pathUrl); 
        return;
      }
      
        //ROOTに移動
        this.$router.push('/');
      }
  }
}
</script>
<style scoped>

</style>