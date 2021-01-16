<template>
  <v-app>
    <app-header></app-header>
    <v-content class="green accent-4">
      <router-view></router-view>
    </v-content>
    <app-footer></app-footer>
  </v-app>
</template>

<script>
import AppHeader from './packs/components/shared/header.vue';
import AppFooter from './packs/components/shared/footer.vue';
import SignIn from './packs/components/devise/sign_in.vue';
import LeftBar from './packs/components/shared/leftBar.vue';

export default {
  data: function () {
    return {
      message: "Hello Vueoo2!"
    }
  },
  components: {
    appHeader: AppHeader,
    appFooter: AppFooter,
    leftBar: LeftBar
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.fixed01{
  position: fixed;
  top: 20;
}
</style>
