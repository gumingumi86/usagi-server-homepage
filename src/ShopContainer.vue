<template>
  <div>
    <!-- Shopコンポーネントを常に表示 -->
    <Shop :userId="userId" @purchaseAttempt="handlePurchaseAttempt" />

    <!-- 認証ダイアログ -->
    <div v-if="showAuthDialog" class="auth-dialog">
      <Auth @authenticated="handleAuthentication" @close="closeAuthDialog" />
    </div>
  </div>
</template>

<script>
import Auth from '@/components/Auth.vue';
import Shop from '@/components/Shop.vue';

export default {
  components: {
    Auth,
    Shop,
  },
  data() {
    return {
      isAuthenticated: false, // 認証状態
      userId: '', // 認証されたユーザーID
      showAuthDialog: false, // 認証ダイアログの表示状態
    };
  },
  methods: {
    // 購入時に認証が必要な場合の処理
    handlePurchaseAttempt() {
      if (!this.isAuthenticated) {
        this.showAuthDialog = true; // 認証ダイアログを表示
      }
    },
    // 認証成功時の処理
    handleAuthentication(userId) {
      this.isAuthenticated = true;
      this.userId = userId;
      this.showAuthDialog = false; // 認証ダイアログを閉じる
    },
    // 認証ダイアログを閉じる
    closeAuthDialog() {
      this.showAuthDialog = false;
    },
  },
};
</script>

<style>
</style>