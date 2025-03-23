<template>
  <div class="bg-white shadow rounded p-4 mb-4">
    <h2 class="text-xl font-semibold mb-2">Server Status</h2>
    <div class="grid grid-cols-2 gap-4">
      <div>
        <p class="text-gray-600">Status:</p>
        <p class="text-green-600 font-bold">Online</p>
      </div>
      <div>
        <p class="text-gray-600">Active Players:</p>
        <p class="text-blue-600 font-bold">123</p>
      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'ServerStatus'
});
</script>

<style scoped>
/* Specific styling for ServerStatus component */
</style>