import Vue from 'vue'
import App from '../app.vue'

Vue.use(Vuetify); // 追加
const vuetify = new Vuetify(); // 追加

document.addEventListener('DOMContentLoaded', () => {
  const el = document.body.appendChild(document.createElement('test_form_list'))
  const app = new Vue({
    el,
    render: h => h(App)
  })


  // console.log(app)
})
