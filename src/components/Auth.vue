<template>
  <div class="auth-dialog">
    <button class="close-button" @click="closeDialog">×</button>
    <h2 v-if="!isAuthenticated">Enter your ID</h2>
    <input v-if="!isAuthenticated" v-model="userId" placeholder="Enter your ID" />
    <button v-if="!isAuthenticated" @click="requestOneTimePassword">Submit</button>

    <h2 v-else>Enter the one-time password sent to your in-game chat</h2>
    <input v-model="otp" placeholder="Enter OTP" />
    <button @click="verifyOtp">Verify</button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      userId: '',
      otp: '',
      isAuthenticated: false,
    };
  },
  methods: {
    async requestOneTimePassword() {
      try {
        const response = await fetch('/api/request-otp', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ userId: this.userId }),
        });
        if (response.ok) {
          alert('One-time password sent to your in-game chat!');
          this.isAuthenticated = true;
        } else {
          alert('Failed to send OTP. Please check your ID.');
        }
      } catch (error) {
        console.error('Error requesting OTP:', error);
      }
    },
    async verifyOtp() {
      try {
        const response = await fetch('/api/verify-otp', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ userId: this.userId, otp: this.otp }),
        });
        if (response.ok) {
          this.$emit('authenticated', this.userId); // 認証成功時に親コンポーネントに通知
        } else {
          alert('Invalid OTP. Please try again.');
        }
      } catch (error) {
        console.error('Error verifying OTP:', error);
      }
    },
    closeDialog() {
      this.$emit('close'); // ダイアログを閉じるイベントを発火
    },
  },
};
</script>

<style>
.auth-dialog {
  position: relative;
  padding: 20px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  width: 300px;
  margin: 0 auto;
}

.close-button {
  position: absolute;
  top: 10px;
  right: 10px;
  background: transparent;
  border: none;
  font-size: 20px;
  cursor: pointer;
}
</style>