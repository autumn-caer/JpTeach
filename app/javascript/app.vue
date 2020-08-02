<template>
  <v-app>
    <app-header></app-header>
    <router-view></router-view>
    <app-footer></app-footer>
  </v-app>
</template>

<script>
import AppHeader from './packs/components/shared/header.vue';
import AppFooter from './packs/components/shared/footer.vue';
import SignIn from './packs/components/devise/sign_in.vue';

export default {
  data: function () {
    return {
      message: "Hello Vueoo2!"
    }
  },
  components: {
    appHeader: AppHeader,
    appFooter: AppFooter
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
