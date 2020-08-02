import Vue from 'vue';
import Vuex from 'vuex';
import store from './index';

Vue.use(Vuex);

export default new Vuex.Store({
    modules: {
        store
    }
});