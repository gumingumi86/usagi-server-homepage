<template>
  <nav class="bg-gradient-to-r from-emerald-600 via-cyan-600 to-blue-600 text-white p-4 flex justify-between">
    <div class="text-xl font-bold px-2 bg-gray-900">Usagi Server</div>
    <div class="flex space-x-4">
      <router-link to="/dashboard" class="px-2 hover:bg-yellow-500 transition duration-300">Dashboard</router-link>
      <router-link to="/about" class="px-2 hover:bg-yellow-500 transition duration-300">About</router-link>
      <router-link to="/contact" class="px-2 hover:bg-yellow-500 transition duration-300">Contact</router-link>
    </div>
  </nav>

  <div class="video-container">
    <video autoplay loop muted playsinline>
      <source src="/distantHorizon.mp4" type="video/mp4" />
      Your browser does not support the video tag.
    </video>
  </div>

  <div class="flex flex-col gap-12 mt-8">
    <div v-for="(section, index) in sections" :key="index" class="flex flex-col md:flex-row items-center gap-6 p-6"
      :class="index % 2 === 0 ? 'bg-gradient-to-r from-orange-500 to-red-500 md:flex-row-reverse' : 'bg-gradient-to-r from-lime-500 to-emerald-500 md:flex-row'">
      <img :src="section.image" :alt="section.title"
        class="w-full md:w-1/2 border-4 border-gray-900 transform hover:translate-y-[-4px] transition duration-300">
      <div class="w-full md:w-1/2 text-center md:text-left p-4 bg-gray-900 text-white">
        <h2 class="text-2xl font-bold mb-2">{{ section.title }}</h2>
        <p>{{ section.description }}</p>
      </div>
    </div>
  </div>
</template>

<style>
body {
  background: #1a1a1a;
  font-family: 'Minecraft', monospace;
}

.video-container {
  position: relative;
  width: 100%;
  height: 0;
  padding-bottom: 56.25%; /* 16:9 アスペクト比 */
}

video {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover; /* 動画をコンテナにフィット */
}
</style>

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