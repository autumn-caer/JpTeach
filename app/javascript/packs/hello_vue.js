
import '@mdi/font/css/materialdesignicons.css'
import Vue from 'vue'
import VueRouter from 'vue-router';
import App from '../app.vue'
import store from '../store/store'
import router from '../routes'; 
import Vuetify from "vuetify";
import "vuetify/dist/vuetify.min.css"; // 追加

const vuetifyOptions = { icons: {iconfont: 'mdi', }}
Vue.use(Vuetify); // 追加
Vue.use(VueRouter);
Vue.config.devtools = true;

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('hello'))
  const app = new Vue({
    el,
    store,
    vuetify: new Vuetify(vuetifyOptions),
    router,
    render: h => h(App)
  })

  console.log(app)
})
