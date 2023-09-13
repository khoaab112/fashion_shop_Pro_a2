const ENV = {
    SYSTEM_NAME: import.meta.env.VITE_SYSTEM_NAME,
    KEY_ACCESS_TOKEN: import.meta.env.VITE_KEY_ACCESS_TOKEN,
    KEY_REFRESH_TOKEN: import.meta.env.VITE_KEY_REFRESH_TOKEN,
    TIME_REFRESH_TOKEN: import.meta.env.VITE_TIME_REFRESH_TOKEN_CLIENT,
    VERSION: import.meta.env.VITE_VERSION,
    PUSHER_APP_KEY: import.meta.env.VITE_PUSHER_APP_KEY,
    APP_URL: import.meta.env.VITE_APP_URL,
    PUSHER_APP_CLUSTER: import.meta.env.VITE_PUSHER_APP_CLUSTER,
    PUSHER_PORT: import.meta.env.VITE_PUSHER_PORT,
};

export default ENV;