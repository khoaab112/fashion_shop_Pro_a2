import Echo from "laravel-echo"
import Pusher from 'pusher-js';
import ENV from './filterEnv'

const configureEcho = (accessToken) => {
    window.Pusher = Pusher;
    const echo = new Echo({
        broadcaster: 'pusher',
        key: ENV.PUSHER_APP_KEY,
        cluster: ENV.PUSHER_APP_CLUSTER,
        forceTLS: true,
        disableStats: true,
        authEndpoint: '/broadcasting/auth',
        auth: {
            headers: {
                Authorization: 'Bearer ' + accessToken,
            }
        },
    });
    return echo;
};

export { configureEcho };