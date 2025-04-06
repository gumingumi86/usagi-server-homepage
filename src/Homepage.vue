<template>
  <div>
    <nav
      :class="['fixed w-full text-white p-4 flex justify-between transition-transform duration-300', { '-translate-y-full': !showNav }]"
      style="background: rgba(0, 0, 0, 0.5); z-index: 10;">
      <div class="text-xl font-bold px-2 bg-gray-900 flex items-center">Usagi Server</div>
      <div class="flex space-x-4 items-center">
        <router-link to="/about" class="px-2 hover:bg-gray-900 transition duration-300">About</router-link>
        <a href="https://www.usagi-server.com/dynmap/index.html" class="px-2 hover:bg-gray-900 transition duration-300">Map</a>
        <router-link to="/shop" class="px-2 hover:bg-gray-900 transition duration-300">Shop</router-link>
        <button
          class="ml-4 px-4 py-2 bg-blue-500 text-white rounded border-2 border-transparent hover:border-white transition duration-300 cursor-pointer"
          onclick="location.href='https://www.usagi-server.com/Usagi Launcher-setup-2.2.1.exe'">
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

    <!-- ギャラリーセクション -->
    <div class="gallery-container">
      <div v-for="(image, index) in images" :key="index" class="gallery-item">
        <img :src="image" alt="Minecraft Screenshot" class="gallery-image" />
      </div>
    </div>
  </div>
</template>

<style>
body {
  background: white;
  font-family: 'Minecraft Regular', monospace;
}

.video-container {
  position: relative;
  top: 0;
  left: 0;
  width: 100vw;
  /* ビューポートの幅に合わせる */
  height: 100vh;
  /* ビューポートの高さに合わせる */
  overflow: hidden;
  /* 動画がはみ出さないようにする */
}

video {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  /* 動画を中央に配置 */
  min-width: 100%;
  /* 横幅をウィンドウにフィット */
  min-height: 100%;
  /* 高さをウィンドウにフィット */
  object-fit: cover;
  /* アスペクト比を維持しながらウィンドウ全体を埋める */
}

/* ギャラリーセクション */
.gallery-container {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  /* 2列固定 */
  gap: 10px;
  /* 画像間のスペース */
  padding: 20px;
  background: #1a1a1a;
  /* 背景色を動画と統一 */
}

.gallery-item {
  overflow: hidden;
  position: relative;
}

.gallery-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  /* アスペクト比を維持しつつ画像をフィット */
  transition: transform 0.3s ease;
  /* ホバー時のアニメーション */
}

.gallery-item:hover .gallery-image {
  transform: scale(1.1);
  /* ホバー時に画像を拡大 */
}
</style>

<script>
export default {
  data() {
    return {
      showNav: false,
      images: [],
    };
  },
  mounted() {
    // スクロールイベントを監視
    window.addEventListener('scroll', this.handleScroll);
    fetch('/makeImageList')
    .then((response) => response.json())
    .then((data) => {
      this.images = data;
    })
    .catch((error) => {
      console.error('Error fetching images:', error);
    });
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