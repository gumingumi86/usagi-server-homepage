<template>
  <div>
    <nav
      :class="['fixed w-full text-white p-4 flex justify-between transition-transform duration-300', { '-translate-y-full': !showNav }]"
      style="background: rgba(0, 0, 0, 0.5);">
      <div class="text-xl font-bold px-2 bg-gray-900 flex items-center">Usagi Server</div>
      <div class="flex space-x-4 items-center">
        <router-link to="/dashboard" class="px-2 hover:bg-yellow-500 transition duration-300">Dashboard</router-link>
        <router-link to="/about" class="px-2 hover:bg-yellow-500 transition duration-300">About</router-link>
        <router-link to="/contact" class="px-2 hover:bg-yellow-500 transition duration-300">Contact</router-link>
        <button class="ml-4 px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 transition duration-300">
          Download
        </button>
      </div>
    </nav>

    <div class="video-container">
      <video autoplay loop muted playsinline>
        <source src="/distantHorizon.mp4" type="video/mp4" />
        Your browser does not support the video tag.
      </video>
    </div>

    <div class="text-white text-center mt-4">
      <h1 class="text-4xl font-bold">test</h1>
      <p class="text-lg">test</p>
      <p class="text-lg">test</p>
      <p class="text-lg">test</p>
      <p class="text-lg">test</p>
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
  top: 0;
  left: 0;
  width: 100vw; /* ビューポートの幅に合わせる */
  height: 100vh; /* ビューポートの高さに合わせる */
  overflow: hidden; /* 動画がはみ出さないようにする */
  z-index: -1; /* 動画を背景に配置 */
}

video {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%); /* 動画を中央に配置 */
  min-width: 100%; /* 横幅をウィンドウにフィット */
  min-height: 100%; /* 高さをウィンドウにフィット */
  object-fit: cover; /* アスペクト比を維持しながらウィンドウ全体を埋める */
}
</style>

<script>
export default {
  data() {
    return {
      showNav: false,
    };
  },
  mounted() {
    // スクロールイベントを監視
    window.addEventListener('scroll', this.handleScroll);
  },
  beforeUnmount() {
    // イベントリスナーを削除
    window.removeEventListener('scroll', this.handleScroll);
  },
  methods: {
    handleScroll() {
      // 少しでもスクロースしたらナビゲーションを表示
      this.showNav = window.scrollY > 1;
    }
  }
};
</script>