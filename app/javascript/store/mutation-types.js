const mutations = {
    setUserId(state, userId){
        state.userId  = userId
    },
    setUserName(state, name){
        state.userName  = name
    },
    setUserEmail(state, email){
        state.email  = email
    },
    setTestFormHeaderId(state, testFormHeaderId){
        state.testFormHeaderId  = testFormHeaderId
    },
};

export default mutations;