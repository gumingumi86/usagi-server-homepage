<template>
  <div
    class="flex items-center justify-center min-h-screen bg-gradient-to-r from-blue-500 via-indigo-600 to-purple-700 text-white">
    <div class="text-center p-10 space-y-6">
      <h1 class="text-4xl font-bold mb-4">Welcome to the Usagi Server</h1>
      <p class="text-lg">You can access various in-game content from your browser.</p>

      <!-- ボタン群 -->
      <div class="space-y-4 mt-8">
        <router-link to="/dashboard">
          <button
            class="px-6 py-3 bg-blue-500 text-white rounded-full shadow-lg hover:bg-blue-600 transition duration-300 w-full">
            Dashboard
          </button>
        </router-link>

        <router-link to="/settings">
          <button
            class="px-6 py-3 bg-green-500 text-white rounded-full shadow-lg hover:bg-green-600 transition duration-300 w-full">
            Settings
          </button>
        </router-link>

        <router-link to="/support">
          <button
            class="px-6 py-3 bg-yellow-500 text-white rounded-full shadow-lg hover:bg-yellow-600 transition duration-300 w-full">
            Support
          </button>
        </router-link>
      </div>
      <!-- サーバー紹介セクション -->
      <div class="flex flex-col gap-12">
        <div v-for="(section, index) in sections" :key="index" class="flex flex-col md:flex-row items-center gap-6"
          :class="index % 2 === 0 ? 'md:flex-row-reverse' : 'md:flex-row'">
          <img :src="section.image" :alt="section.title" class="w-full md:w-1/2 rounded-lg shadow-lg">
          <div class="w-full md:w-1/2 text-center md:text-left">
            <h2 class="text-2xl font-bold mb-2">{{ section.title }}</h2>
            <p class="text-gray-700">{{ section.description }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      sections: [
        {
          image: "/testImage.png",
          title: "広大なワールドを探検",
          description: "自由に冒険できるワールド。建築、冒険、何でも可能！"
        },
        {
          image: "/testImage.png",
          title: "多彩なミニゲーム",
          description: "PvP・パルクール・脱出ゲームなど、さまざまな遊び方が楽しめる！"
        },
        {
          image: "/testImage.png",
          title: "仲間と一緒にプレイ",
          description: "友達と協力して、最高のMinecraftライフを楽しもう！"
        },
        {
          image: "/testImage.png",
          title: "定期的なイベント開催",
          description: "ユニークなイベントが盛りだくさん！レアアイテムをゲットしよう！"
        }
      ]
    };
  }
};
</script>

<style scoped>
/* 追加のスタイルが必要ならここに記述 */
</style>
