<template>
  <div class="language-dropdown">
    <button class="dropdown-button" @click="toggleDropdown">
      {{ locale.toUpperCase() }}
      <span class="arrow" :class="{ open: isDropdownOpen }">▼</span>
    </button>
    <ul v-if="isDropdownOpen" class="dropdown-menu">
      <li
        v-for="lang in languages"
        :key="lang"
        @click="changeLanguage(lang)"
        :class="{ active: locale === lang }"
      >
        {{ lang.toUpperCase() }}
      </li>
    </ul>
  </div>
</template>

<script>
import { ref } from 'vue';

export default {
  props: {
    locale: {
      type: String,
      required: true,
    },
  },
  setup(props, { emit }) {
    const isDropdownOpen = ref(false);
    const languages = ['en', 'ja'];

    const changeLanguage = (lang) => {
      emit('update-locale', lang); // 親コンポーネントにイベントを発火
      isDropdownOpen.value = false; // ドロップダウンを閉じる
    };

    const toggleDropdown = () => {
      isDropdownOpen.value = !isDropdownOpen.value;
    };

    return {
      changeLanguage,
      toggleDropdown,
      isDropdownOpen,
      languages,
    };
  },
};
</script>

<style>
.language-dropdown {
  position: absolute;
  top: 10px;
  right: 10px;
  z-index: 1000;
}

.dropdown-button {
  background: transparent;
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 5px 10px;
  font-size: 0.9rem;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 5px;
  transition: background 0.3s ease, color 0.3s ease;
}

.dropdown-button:hover {
  background: #f0f0f0;
}

.arrow {
  font-size: 0.8rem;
  transition: transform 0.3s ease;
}

.arrow.open {
  transform: rotate(180deg);
}

.dropdown-menu {
  position: absolute;
  top: 100%;
  right: 0;
  background: white;
  border: 1px solid #ccc;
  border-radius: 4px;
  list-style: none;
  padding: 5px 0;
  margin: 0;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.dropdown-menu li {
  padding: 5px 10px;
  cursor: pointer;
  transition: background 0.3s ease;
}

.dropdown-menu li:hover {
  background: #f0f0f0;
}

.dropdown-menu li.active {
  font-weight: bold;
  color: #007bff;
}
</style>