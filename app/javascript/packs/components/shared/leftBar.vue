<template>
  <div>
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
                    :key="item.title" link @click="proceedUrl(item.title)">
          <v-list-item-icon>
            <v-icon>{{item.icon}}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-tile-title>{{ item.title }}</v-list-tile-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
  </div>
</template>
<script>
  export default {
    data() {
      return {
        items: [
            { title: 'userpage', icon: 'mdi-view-dashboard' },
            { title: 'login', icon: 'mdi-account-box' },
            { title: 'listview', icon: 'mdi-gavel' },
            { title: 'home', icon: 'mdi-gavel' },
            { title: 'testlist', icon: 'mdi-gavel' },
            { title: 'newform', icon: 'mdi-gavel' },
            { title: 'resultlist', icon: 'mdi-gavel' },
            { title: 'user_search', icon: 'mdi-gavel' },
            { title: 'user_edit', icon: 'mdi-gavel' },
        ]
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
        //ROOTに移動
        this.$router.push('/');
      }
    }
  }
</script>