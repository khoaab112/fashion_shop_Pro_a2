import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';
import path from 'path';
import dotenv from 'dotenv';
// import { envCompatible } from 'vite-plugin-env-compatible';
// import pkg from 'vite-plugin-env-compatible/dist/index.js';
// const { envCompatible } = pkg;
export default defineConfig({
    plugins: [
        laravel(['resources/js/app.js']),
        vue({
            template: {
                transformAssetUrls: {

                    base: null,

                    includeAbsolute: false,
                },
            },
        }),
        // envCompatible(),
    ],
    resolve: {
        alias: {
            '@': path.resolve(__dirname, 'resources'),
        },
    },
});