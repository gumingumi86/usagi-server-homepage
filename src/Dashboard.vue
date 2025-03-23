<template>
  <div class="container mx-auto p-4">
    <header class="mb-4">
      <h1 class="text-3xl font-bold text-center">Dashboard</h1>
      <router-link to="/" class="text-blue-600">Back to Home</router-link>
    </header>
    <section class="mb-6">
      <ServerStatus />
    </section>
    <section>
      <PlayerList />
    </section>
  </div>
</template>

<script>
import { defineComponent } from 'vue';
import ServerStatus from './components/ServerStatus.vue';
import PlayerList from './components/PlayerList.vue';

export default defineComponent({
  name: 'Dashboard',
  components: {
    ServerStatus,
    PlayerList
  }
});
</script>

<style scoped>
/* Optional specific styling for Dashboard */
</style>
