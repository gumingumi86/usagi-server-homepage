import { createApp } from 'vue';
import { createRouter, createWebHistory } from 'vue-router';
import App from './App.vue';
import HomePage from './Homepage.vue';
import About from './About.vue';
import ShopContainer from './ShopContainer.vue';

const routes = [
  { path: '/', component: HomePage },
  { path: '/about', component: About },
  { path: '/shop', component: ShopContainer }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

const app = createApp(App);
app.use(router);
app.mount('#app');
