<template>
  <div id="app">
    <LoadingScreen :isLoading="isLoading" />
    <router-view v-if="!isLoading" />
  </div>
</template>

<script>
import { ref } from 'vue';
import LoadingScreen from '@/components/LoadingScreen.vue';

export default {
  name: 'App',
  components: {
    LoadingScreen
  },
  setup() {
    const isLoading = ref(true);

    return {
      isLoading
    };
  },
  mounted() {
    // 初回ロード時にローディングアニメーションを表示
    setTimeout(() => {
      this.isLoading = false; // ローディング終了
    }, 1500); // 1.5秒後にローディング終了
  }
};
</script>