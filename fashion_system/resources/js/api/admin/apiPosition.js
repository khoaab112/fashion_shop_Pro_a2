import index from '../setupApi.js';

// const authAdmin = '/api/auth/login';

export default {
    getPositions() {
        return index.get(`/positions`);
    }
}