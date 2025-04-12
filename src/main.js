import { createApp } from 'vue';
import { createRouter, createWebHistory } from 'vue-router';
import App from './App.vue';
import i18n from './i18n.js';
import Homepage from './Homepage.vue';
import About from './About.vue';
import ShopContainer from './ShopContainer.vue';

const routes = [
  { path: '/', component: Homepage },
  { path: '/about', component: About },
  { path: '/shop', component: ShopContainer }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

const app = createApp(App);
app.use(i18n);
app.use(router);
app.mount('#app');
