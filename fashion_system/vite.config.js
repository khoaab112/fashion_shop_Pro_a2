import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';
import path from 'path';
import dotenv from 'dotenv';
dotenv.config();

const laravelPublicPath = path.resolve(__dirname, './public');


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
    ],
    resolve: {
        alias: {
            '@': path.resolve(__dirname, 'resources'),
            '@public': laravelPublicPath,
        },
    },
});
