<template>
  <div>
    <!-- ナビゲーションバー -->
    <nav
      :class="['fixed w-full text-white p-4 flex justify-between transition-transform duration-300', { '-translate-y-full': !showNav }]"
      style="background: rgba(0, 0, 0, 0.5); z-index: 10;"
    >
      <div class="text-xl font-bold px-2 bg-gray-900 flex items-center">Usagi Server</div>

      <!-- デスクトップ用ナビゲーション -->
      <div class="hidden md:flex space-x-4 items-center">
        <router-link to="/about" class="px-2 hover:bg-gray-900 transition duration-300">About</router-link>
        <a
          href="https://www.usagi-server.com/dynmap/index.html"
          target="_blank"
          rel="noopener noreferrer"
          class="px-2 hover:bg-gray-900 transition duration-300"
        >
          Map
        </a>
        <router-link to="/shop" class="px-2 hover:bg-gray-900 transition duration-300">Shop</router-link>
        <button
          class="ml-4 px-4 py-2 bg-blue-500 text-white rounded border-2 border-transparent hover:border-white transition duration-300 cursor-pointer"
          onclick="location.href='https://www.usagi-server.com/Usagi Launcher-setup-2.2.1.exe'"
        >
          Download
        </button>
      </div>

      <!-- モバイル用ハンバーガーメニュー -->
      <div class="md:hidden flex items-center">
        <button @click="toggleMenu" class="hamburger-button">
          <span :class="{ 'open': isMenuOpen }"></span>
        </button>
      </div>
    </nav>

    <!-- モバイル用メニュー -->
    <div v-if="isMenuOpen && showNav" class="mobile-menu text-white">
      <router-link to="/about" class="block py-2 hover:bg-gray-900">About</router-link>
      <a
        href="https://www.usagi-server.com/dynmap/index.html"
        target="_blank"
        rel="noopener noreferrer"
        class="block py-2 hover:bg-gray-900"
      >
        Map
      </a>
      <router-link to="/shop" class="block py-2 hover:bg-gray-900">Shop</router-link>
    </div>

    <div class="video-container">
      <video autoplay loop muted playsinline>
        <source src="/distantHorizon.mp4" type="video/mp4" />
        Your browser does not support the video tag.
      </video>
    </div>

    <!-- ギャラリーセクション -->
    <div class="gallery-container">
      <div
        v-for="(image, index) in images"
        :key="index"
        class="gallery-item"
      >
        <img :src="image" alt="Gallery Image" class="gallery-image" />
      </div>
    </div>
  </div>
</template>

<style>
/* モバイルメニューのスタイル */
.mobile-menu {
  position: fixed; /* 固定位置にする */
  top: 60px; /* ナビゲーションバーの下に配置 */
  left: 0;
  width: 100%;
  background: rgba(0, 0, 0, 0.5); /* 背景を少し暗くする */
  z-index: 9; /* ナビゲーションバーの下に表示 */
  padding: 10px;
  transition: all 0.3s ease-in-out;
}

/* デスクトップ */
@media (min-width: 768px) {
  .mobile-menu {
    display: none;
  }
  .gallery-container {
    grid-template-columns: repeat(3, 1fr);
  }
}

/* モバイル */
@media (max-width: 767px) {
  .gallery-container {
    grid-template-columns: repeat(2, 1fr);
  }
}

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

/* ハンバーガーメニューのボタン */
.hamburger-button {
  position: relative;
  width: 30px;
  height: 24px;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
}

.hamburger-button span {
  position: absolute;
  width: 100%;
  height: 3px;
  background: white;
  border-radius: 2px;
  transition: all 0.3s ease-in-out;
}

.hamburger-button span::before,
.hamburger-button span::after {
  content: '';
  position: absolute;
  width: 100%;
  height: 3px;
  background: white;
  border-radius: 2px;
  transition: all 0.3s ease-in-out;
}

.hamburger-button span::before {
  top: -8px;
}

.hamburger-button span::after {
  bottom: -8px;
}

/* メニューが開いたときのアニメーション */
.hamburger-button span.open {
  background: transparent;
}

.hamburger-button span.open::before {
  transform: rotate(45deg);
  top: 0;
}

.hamburger-button span.open::after {
  transform: rotate(-45deg);
  bottom: 0;
}
</style>

<script>
export default {
  data() {
    return {
      showNav: false,
      isMenuOpen: false, // モバイルメニューの開閉状態
      images: [],
    };
  },
  mounted() {
    // スクロールイベントを監視
    window.addEventListener('scroll', this.handleScroll);
    fetch('{defaultApiEndPoint}/makeImageList')
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
    },
    toggleMenu() {
      this.isMenuOpen = !this.isMenuOpen;
    },
  },
};
</script>