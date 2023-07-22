import index from '../setupApi.js';
console.log("aass");

export default {
    test() {
        return index.post(`/login`);
    },

}