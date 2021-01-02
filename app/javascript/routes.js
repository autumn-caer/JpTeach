import VueRouter from 'vue-router';
import SignIn from './packs/components/devise/sign_in.vue';
import LogIn from './packs/components/devise/log_in.vue';
import userPage from './packs/components/devise/userpage.vue';
import listView from './packs/components/test/list_view.vue';
import testAnswer from './packs/components/test/test_answer.vue';
import testEdit from './packs/components/test/test_edit.vue';
import testList from './packs/components/test/test_list.vue';
import home from './packs/components/home/home.vue';
import newForm from './packs/components/test/new_form.vue';
import resultList from './packs/components/result/result_list.vue';
import result from './packs/components/result/result.vue';
import userSearch from './packs/components/userFollow/user_search.vue';
import userEdit from './packs/components/user_profile/user_edit.vue';
const routes = [
     { path: '/', name: 'SignIn', component: SignIn } ,
     { path: '/login', name: 'LogIn', component: LogIn},
     { path: '/userpage', name: 'userPage', component: userPage},
     { path: '/listview', name: 'listView', component: listView},
     { path: '/home', name: 'home', component: home},
     { path: '/testlist', name: 'testList', component: testList},
     { path: '/test_answer/:id', name: 'testAnswer', component: testAnswer},
     { path: '/test_edit/:id', name: 'testEdit', component: testEdit},
     { path: '/newform', name: 'newForm', component: newForm},
     { path: '/resultlist', name: 'resultList', component: resultList},
     { path: '/result/:id', name: 'result', component: result},
     { path: '/user_search/', name: 'userSearch', component: userSearch},
     { path: '/user_edit/', name: 'userEdit', component: userEdit},
     { path: '/userpage/:id', name: 'userSearch', component: userPage},
  ];

export default new VueRouter({ mode: 'history', routes });