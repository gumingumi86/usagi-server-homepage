import { createApp } from 'vue';
import { createRouter, createWebHistory } from 'vue-router';
import App from './App.vue';
import HomePage from './Homepage.vue';
import Dashboard from './Dashboard.vue';

const routes = [
  { path: '/', component: HomePage },
  { path: '/dashboard', component: Dashboard }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

const app = createApp(App);
app.use(router);
app.mount('#app');
