<template>
  <div v-if="isLoading" class="fixed inset-0 bg-gray-900 z-50 flex items-center justify-center">
    <div class="text-center">
      <div class="loading-blocks mb-4">
        <div class="block"></div>
        <div class="block"></div>
        <div class="block"></div>
      </div>
      <p class="text-green-500 text-xl loading-text">Loading World...</p>
    </div>
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
  }
}
</script>

<style scoped>
.loading-blocks {
  display: flex;
  justify-content: center;
  gap: 8px;
}

.block {
  width: 32px;
  height: 32px;
  background: #43b581;
  animation: block-fall 1s infinite ease-in-out;
}

.block:nth-child(2) {
  animation-delay: 0.2s;
}

.block:nth-child(3) {
  animation-delay: 0.4s;
}

@keyframes block-fall {
  0% { transform: translateY(-20px); }
  50% { transform: translateY(0); }
  100% { transform: translateY(-20px); }
}

.loading-text {
  animation: text-fade 2s infinite;
}

@keyframes text-fade {
  0%, 100% { opacity: 0.5; }
  50% { opacity: 1; }
}
</style>