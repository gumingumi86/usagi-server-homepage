<template>
  <div class="flex justify-center items-center h-screen bg-gray-200">
    <div class="text-center bg-white p-8 shadow-xl rounded-lg">
      <h1 class="text-4xl font-bold text-blue-600 mb-4">Welcome to the Usagi Server</h1>
      <p class="text-gray-600 mb-6">Access your server and player stats easily</p>
      <router-link to="/dashboard" class="bg-blue-600 text-white py-2 px-6 rounded-lg text-xl">
        Go to Dashboard
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: 'HomePage'
};
</script>

<style scoped>
/* Optional specific styling for the HomePage component */
</style>
