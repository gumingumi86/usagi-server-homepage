<template>
  <div class="container mx-auto p-6 max-w-4xl text-gray-100">
    <!-- タイトルセクション -->
    <header class="mb-12 text-center">
      <h1 class="text-5xl font-extrabold bg-gradient-to-r from-blue-800 to-cyan-500 text-transparent bg-clip-text">
        Welcome to Our Minecraft Server
      </h1>
      <p class="text-lg font-bold text-gray-900 mt-4">
        Step into a breathtaking world where nature’s beauty meets the limitless creativity of Minecraft.
      </p>
    </header>

    <!-- セクション: Explore Breathtaking Landscapes -->
    <section class="mb-12 bg-blue-900 p-6 rounded-lg shadow-lg hover:shadow-xl transition-transform transform hover:scale-105">
      <h2 class="text-3xl font-bold text-cyan-400 mb-4">
        Explore Breathtaking Landscapes
      </h2>
      <p class="text-gray-300 leading-relaxed">
        Our world is crafted to offer an awe-inspiring journey through diverse biomes, from towering mountains and lush forests to serene lakes and expansive valleys. Whether you’re an adventurer at heart or a builder looking for the perfect location to bring your ideas to life, you’ll find no shortage of inspiration in our meticulously designed terrain.
      </p>
    </section>

    <!-- セクション: Enhanced Gameplay with Mods -->
    <section class="mb-12 bg-blue-900 p-6 rounded-lg shadow-lg hover:shadow-xl transition-transform transform hover:scale-105">
      <h2 class="text-3xl font-bold text-cyan-400 mb-4">
        Enhanced Gameplay with Mods
      </h2>
      <ul class="space-y-4">
        <li class="flex items-start space-x-4">
          <span class="text-cyan-400 text-2xl">✔</span>
          <p class="text-gray-300">
            <strong>Immersive Graphics Mods:</strong> Enjoy stunning shaders and enhanced textures that bring the world to life with realistic lighting, reflections, and atmospheric effects.
          </p>
        </li>
        <li class="flex items-start space-x-4">
          <span class="text-cyan-400 text-2xl">✔</span>
          <p class="text-gray-300">
            <strong>Advanced Building Tools:</strong> Take advantage of mods that expand your building possibilities with intricate details, customizable blocks, and powerful construction utilities.
          </p>
        </li>
        <li class="flex items-start space-x-4">
          <span class="text-cyan-400 text-2xl">✔</span>
          <p class="text-gray-300">
            <strong>Unique Gameplay Mechanics:</strong> Experience custom mobs, expanded crafting options, and new challenges that add depth to your adventure.
          </p>
        </li>
      </ul>
    </section>

    <!-- セクション: A Community for Creators and Explorers -->
    <section class="mb-12 bg-blue-900 p-6 rounded-lg shadow-lg hover:shadow-xl transition-transform transform hover:scale-105">
      <h2 class="text-3xl font-bold text-cyan-400 mb-4">
        A Community for Creators and Explorers
      </h2>
      <p class="text-gray-300 leading-relaxed">
        Our server isn’t just a place to play—it’s a thriving community where builders, adventurers, and storytellers come together. Whether you want to construct breathtaking structures, embark on grand expeditions, or simply enjoy the serene landscapes, you’ll find a welcoming space to do it all.
      </p>
    </section>

    <!-- フッター -->
    <footer class="text-center mt-12">
      <router-link to="/" class="text-cyan-400 hover:underline">
        Back to Home
      </router-link>
    </footer>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>

.container {
  font-family: 'Poppins', sans-serif;
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

h1, h2, footer {
  font-family: 'Poppins', sans-serif;
}

section {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

section:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
}

footer a {
  font-weight: bold;
  transition: color 0.3s ease;
}

footer a:hover {
  color: #00ffff; /* ホバー時に明るいシアン色 */
}
</style>