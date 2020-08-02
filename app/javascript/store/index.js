import actions from './action-types';
import mutations from './mutation-types';

const state = {
  userId: '',   
  userName: '',
  email: ''
};

const getters = {
  getUserId(state){
    return　state.userId;
  },
  getUserName(state){
    return　state.userName;
  },
  getEmail(state){
    return　state.email;
  }
};

export default {
  state,
  getters,
  actions,
  mutations,
};