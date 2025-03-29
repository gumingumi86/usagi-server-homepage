<template>
<div>
  <div
    v-if="isVisible"
    class="fixed inset-0 z-50 flex items-center justify-center overflow-hidden"
  >
    <!-- 背景色の伸びるアニメーション -->
    <div
      class="absolute inset-0 bg-gradient-to-r from-gray-900 to-gray-700"
      :class="{ 'animate-slide-out': !isLoading }"
    ></div>

    <!-- ローディングブロックとテキスト -->
    <div v-if="isLoading" class="text-center relative z-10">
      <div class="loading-blocks mb-4">
        <div class="block"></div>
        <div class="block"></div>
        <div class="block"></div>
      </div>
      <p class="text-green-500 text-xl loading-text">Loading...</p>
    </div>
  </div>
  <!-- ページトップに戻るボタン -->
  <button
    v-if="showScrollTopButton"
    @click="scrollToTop"
    class="fixed bottom-4 right-4 bg-blue-500 text-white p-3 rounded-full shadow-lg hover:bg-blue-600 transition"
  >
    ↑ Top
  </button>
</div>
</template>

<script>
export default {
  name: 'LoadingScreen',
  props: {
    isLoading: {
      type: Boolean,
      default: true
    }
  },
  data() {
    return {
      isVisible: true, // ローディング画面の表示状態
      showScrollTopButton: false // ページトップボタンの表示状態
    };
  },
  watch: {
    isLoading(newVal) {
      if (!newVal) {
        // ローディング終了時に少し遅れて完全に非表示にする
        setTimeout(() => {
          this.isVisible = false;
        }, 1000); // 背景アニメーションの時間と一致
      }
    }
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
      // 一定量スクロールしたらボタンを表示
      this.showScrollTopButton = window.scrollY > 800;
    },
    scrollToTop() {
      // ページトップにスムーズにスクロール
      window.scrollTo({ top: 0, behavior: 'smooth' });
    }
  }
};
</script>

<style scoped>
/* 背景が左から右に伸びるアニメーション */
@keyframes slide-out {
  0% {
    transform: translateX(0);
  }
  100% {
    transform: translateX(100%);
  }
}

.animate-slide-out {
  animation: slide-out 1s ease-in-out forwards;
}

/* ローディングブロックのアニメーション */
.loading-blocks {
  display: flex;
  justify-content: center;
  gap: 8px;
}

.block {
  width: 32px;
  height: 32px;
  background-image: url('/grass.svg'); /* 土ブロックの画像を背景に設定 */
  background-size: cover; /* 画像を要素全体にフィット */
  animation: block-fall 1s infinite ease-in-out;
}

.block:nth-child(2) {
  animation-delay: 0.2s;
}

.block:nth-child(3) {
  animation-delay: 0.4s;
}

@keyframes block-fall {
  0% {
    transform: translateY(-20px);
  }
  50% {
    transform: translateY(0);
  }
  100% {
    transform: translateY(-20px);
  }
}

/* テキストのフェードアニメーション */
.loading-text {
  animation: text-fade 2s infinite;
}

@keyframes text-fade {
  0%,
  100% {
    opacity: 0.5;
  }
  50% {
    opacity: 1;
  }
}
</style>