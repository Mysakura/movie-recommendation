import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        example: 1
    },
    mutations: {
        setExample(state,cur){
            state.example = cur;
        }
    },
    actions: {}
})
// me.$store.commit('setExample', 2);  me.$store.state.example;