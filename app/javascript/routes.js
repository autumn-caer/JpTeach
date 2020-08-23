import VueRouter from 'vue-router';
import SignIn from './packs/components/devise/sign_in.vue';
import LogIn from './packs/components/devise/log_in.vue';
import userPage from './packs/components/devise/userpage.vue';
import listView from './packs/components/test/list_view.vue';
import create from './packs/components/test/create.vue';
import test from './packs/components/test/test.vue';
import home from './packs/components/home/home.vue';

const routes = [
     { path: '/', name: 'SignIn', component: SignIn } ,
     { path: '/login', name: 'LogIn', component: LogIn},
     { path: '/userpage', name: 'userPage', component: userPage},
     { path: '/listview', name: 'listView', component: listView},
     { path: '/create', name: 'create', component: create},
     { path: '/home', name: 'home', component: home},
     { path: '/test', name: 'test', component: test},
  ];

export default new VueRouter({ mode: 'history', routes });