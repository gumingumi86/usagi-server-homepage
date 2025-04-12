<template>
  <div class="auth-dialog">
    <button class="close-button" @click="closeDialog">X</button>
    <div class="auth-content">
      <!-- ID入力画面 -->
      <div v-if="!isAuthenticated">
        <h2 class="auth-title">{{ $t('auth.enterIdTitle') }}</h2>
        <p class="auth-description">{{ $t('auth.enterIdDescription') }}</p>
        <input
          v-model="userId"
          :placeholder="$t('auth.enterIdPlaceholder')"
          class="auth-input"
        />
        <button @click="requestOneTimePassword" class="auth-button">
          {{ $t('auth.submitButton') }}
        </button>
      </div>

      <!-- OTP入力画面 -->
      <div v-else>
        <h2 class="auth-title">{{ $t('auth.enterOtpTitle') }}</h2>
        <p class="auth-description">{{ $t('auth.enterOtpDescription') }}</p>
        <input
          v-model="otp"
          :placeholder="$t('auth.enterOtpPlaceholder')"
          class="auth-input"
        />
        <button @click="verifyOtp" class="auth-button">
          {{ $t('auth.verifyButton') }}
        </button>
      </div>
    </div>
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
        const response = await fetch(`${import.meta.env.VITE_API_ENDPOINT}/sendAndAuthOTP`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ userId: this.userId, action: 'send' }),
        });
        if (response.ok) {
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
        const response = await fetch(`${import.meta.env.VITE_API_ENDPOINT}/sendAndAuthOTP`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ userId: this.userId, otp: this.otp, action: 'auth' }),
        });
        if (response.ok) {
          const responseBody = await response.json();
          this.$emit('authenticated', { userId: this.userId, credits: responseBody.credits }); // 認証成功時に親コンポーネントに通知
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
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 90%;
  max-width: 400px;
  background: white;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  padding: 20px;
  z-index: 1000;
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

.auth-content {
  text-align: center;
}

.auth-title {
  font-size: 1.5rem;
  font-weight: bold;
  margin-bottom: 10px;
}

.auth-description {
  font-size: 0.9rem;
  color: #666;
  margin-bottom: 20px;
}

.auth-input {
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
}

.auth-button {
  width: 100%;
  padding: 10px;
  background: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  font-size: 1rem;
  cursor: pointer;
  transition: background 0.3s ease;
}

.auth-button:hover {
  background: #0056b3;
}
</style>