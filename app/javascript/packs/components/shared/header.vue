<template>
   <div>
    <v-app-bar
      color="green accent-4"
      height="60px"
      class ="py-0"
      dense
      dark
    >
      <v-app-bar-icon></v-app-bar-icon>
      <v-toolbar-title>Page title</v-toolbar-title>
      <v-spacer></v-spacer>

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
    </v-app-bar>
    </div>
</template>
<script>
export default {
  data: function () {
    return {
      items: [
        'userpage', 'login','listview','create'
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

      if (pathUrl == 'create') {
        // if(this.$store.getters.getUserId){
        //   this.$router.push('/userpage');
        //   return;
        // }
        //ユーザーページに移動
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