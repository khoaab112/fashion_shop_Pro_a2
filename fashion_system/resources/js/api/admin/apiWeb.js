import index from '../setupApi.js';

export default {
    menu() {
        return index.get(`/menu`);
    },
}