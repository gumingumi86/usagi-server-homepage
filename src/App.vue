<template>
  <div id="app">
    <LoadingScreen :isLoading="isLoading" />
    <LanguageDropdown v-if="!isLoading && showLanguageDropdown" :locale="locale" @update-locale="updateLocale" />
    <router-view v-if="!isLoading" :locale="locale" />
  </div>
</template>

<script>
import { ref, computed } from 'vue';
import { useRoute } from 'vue-router';
import LoadingScreen from '@/components/LoadingScreen.vue';
import LanguageDropdown from '@/components/LanguageDropdown.vue';
import { useI18n } from 'vue-i18n';

export default {
  name: 'App',
  components: {
    LoadingScreen,
    LanguageDropdown,
  },
  setup() {
    const isLoading = ref(true);
    const route = useRoute();
    const { locale } = useI18n();

    // 特定のページでは言語切り替えドロップダウンを非表示にする
    const showLanguageDropdown = computed(() => {
      // ホームページでは非表示
      return route.name !== 'Homepage';
    });

    const updateLocale = (newLocale) => {
      locale.value = newLocale; // Vue I18n の locale を更新
    };

    return {
      isLoading,
      showLanguageDropdown,
      locale,
      updateLocale,
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