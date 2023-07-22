import index from '../setupApi.js';

export default {
    test() {
        return index.get(`/login`);
    },

}