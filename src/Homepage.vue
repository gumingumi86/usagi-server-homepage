<template>
  <div class="flex items-center justify-center min-h-screen bg-gradient-to-r from-blue-500 via-indigo-600 to-purple-700 text-white">
    <div class="text-center p-10 space-y-6">
      <h1 class="text-4xl font-bold mb-4">Welcome to the Usagi Server</h1>
      <p class="text-lg">You can access various in-game content from your browser.</p>
      
      <!-- ボタン群 -->
      <div class="space-y-4 mt-8">
        <router-link to="/dashboard">
          <button class="px-6 py-3 bg-blue-500 text-white rounded-full shadow-lg hover:bg-blue-600 transition duration-300 w-full">
            Dashboard
          </button>
        </router-link>

        <router-link to="/settings">
          <button class="px-6 py-3 bg-green-500 text-white rounded-full shadow-lg hover:bg-green-600 transition duration-300 w-full">
            Settings
          </button>
        </router-link>

        <router-link to="/support">
          <button class="px-6 py-3 bg-yellow-500 text-white rounded-full shadow-lg hover:bg-yellow-600 transition duration-300 w-full">
            Support
          </button>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'HomePage',
};
</script>

<style scoped>
/* 必要に応じてカスタムCSSを追加 */
</style>
