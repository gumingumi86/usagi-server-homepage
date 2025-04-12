<template>
  <div class="container mx-auto p-6 max-w-4xl text-gray-100">
    <!-- タイトルセクション -->
    <header class="mb-12 text-center">
      <h1 class="text-5xl font-extrabold bg-gradient-to-r from-green-500 to-blue-500 text-transparent bg-clip-text">
        {{ $t('about.title') }}
      </h1>
      <p class="text-lg font-bold text-gray-300 mt-4">
        {{ $t('about.subtitle') }}
      </p>
    </header>

    <!-- 地形MODセクション -->
    <section class="mb-12 bg-green-900 p-6 rounded-lg shadow-lg hover:shadow-xl transition-transform transform hover:scale-105">
      <h2 class="text-3xl font-bold text-green-400 mb-4">
        {{ $t('about.terrainMod.title') }}
      </h2>
      <p class="text-gray-300 leading-relaxed">
        {{ $t('about.terrainMod.description') }}
      </p>
    </section>

    <!-- アイテムの購入セクション -->
    <section class="mb-12 bg-blue-900 p-6 rounded-lg shadow-lg hover:shadow-xl transition-transform transform hover:scale-105">
      <h2 class="text-3xl font-bold text-blue-400 mb-4">
        {{ $t('about.itemPurchase.title') }}
      </h2>
      <p class="text-gray-300 leading-relaxed">
        {{ $t('about.itemPurchase.description') }}
      </p>
    </section>

    <!-- クライアントMODセクション -->
    <section class="mb-12 bg-purple-900 p-6 rounded-lg shadow-lg hover:shadow-xl transition-transform transform hover:scale-105">
      <h2 class="text-3xl font-bold text-purple-400 mb-4">
        {{ $t('about.clientMod.title') }}
      </h2>
      <p class="text-gray-300 leading-relaxed">
        {{ $t('about.clientMod.description') }}
      </p>
    </section>

    <!-- Yuushyaセクション -->
    <section class="mb-12 bg-yellow-900 p-6 rounded-lg shadow-lg hover:shadow-xl transition-transform transform hover:scale-105">
      <h2 class="text-3xl font-bold text-yellow-400 mb-4">
        {{ $t('about.yuushya.title') }}
      </h2>
      <p class="text-gray-300 leading-relaxed">
        {{ $t('about.yuushya.description') }}
        <a
          href="https://yuushya.com/townscape/index-en.html"
          target="_blank"
          class="text-yellow-400 underline hover:text-yellow-300"
        >
          {{ $t('about.yuushya.linkText') }}
        </a>
      </p>
    </section>

    <!-- 写真セクション -->
    <section class="mb-12 bg-cyan-900 p-6 rounded-lg shadow-lg hover:shadow-xl transition-transform transform hover:scale-105">
      <h2 class="text-3xl font-bold text-cyan-400 mb-4">
        {{ $t('about.photos.title') }}
      </h2>
      <p class="text-gray-300 leading-relaxed">
        {{ $t('about.photos.description') }}
      </p>
    </section>
    <footer class="mt-12 text-center">
      <router-link
        to="/"
        class="bg-blue-500 text-white px-6 py-3 rounded-lg shadow-lg hover:bg-blue-600 transition-colors"
      >
        {{ $t('about.backToHome') }}
      </router-link>
    </footer>
  </div>
</template>

<script>
export default {
  name: 'About',
};
</script>

<style>
</style>