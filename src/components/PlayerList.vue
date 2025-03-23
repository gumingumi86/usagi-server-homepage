<template>
  <div class="bg-white shadow rounded p-4">
    <h2 class="text-xl font-semibold mb-2">Player List</h2>
    <table class="min-w-full divide-y divide-gray-200">
      <thead>
        <tr>
          <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            Player Name
          </th>
          <th class="px-6 py-3 bg-gray-50 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
            Status
          </th>
        </tr>
      </thead>
      <tbody class="bg-white divide-y divide-gray-200">
        <tr v-for="player in players" :key="player.id">
          <td class="px-6 py-4 whitespace-nowrap">{{ player.name }}</td>
          <td class="px-6 py-4 whitespace-nowrap">{{ player.status }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import { defineComponent, ref } from 'vue';

export default defineComponent({
  name: 'PlayerList',
  setup() {
    const players = ref([
      { id: 1, name: 'PlayerOne', status: 'Active' },
      { id: 2, name: 'PlayerTwo', status: 'Inactive' },
      { id: 3, name: 'PlayerThree', status: 'Active' }
    ]);

    return { players };
  }
});
</script>

<style scoped>
/* Specific styling for PlayerList component */
</style>