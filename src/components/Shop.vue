<template>
  <div class="shop-container">
    <h2 class="shop-title">{{ $t('shop.title') }}</h2>
    <router-link to="/" class="text-cyan-400 hover:underline">
      {{ $t('shop.backToHome') }}
    </router-link>

    <div class="auth-status">
      <button v-if="!userId" @click="triggerAuth" class="auth-button">
        {{ $t('shop.authenticate') }}
      </button>
      <div v-else class="credits-display">
        {{ $t('shop.userCredits', { userId, credits }) }}
      </div>
    </div>

    <div class="filter-buttons">
      <h3>{{ $t('shop.filterByCategory') }}</h3>
      <div class="filter-group">
        <button
          v-for="(category, index) in uniqueCategories"
          :key="`category-${index}`"
          @click="applyFilter('category', category)"
          :class="{ active: activeFilters.category === category || activeFilters.category === null }"
        >
          {{ category }}
        </button>
      </div>

      <h3>{{ $t('shop.filterByMod') }}</h3>
      <div class="filter-group">
        <button
          v-for="(mod, index) in uniqueMods"
          :key="`mod-${index}`"
          @click="applyFilter('mod', mod)"
          :class="{ active: activeFilters.mod === mod || activeFilters.mod === null }"
        >
          {{ mod }}
        </button>
      </div>

      <button @click="resetFilters" class="reset-button">
        {{ $t('shop.clear') }}
      </button>
    </div>

    <div class="shop-grid">
      <div v-for="item in filteredItems" :key="item.id" class="shop-item">
        <!-- アイテム画像 -->
        <img :src="`https://www.usagi-server.com/shop_resources/${item.image}`" :alt="getItemName(item)" class="item-image" />
        <!-- アイテム情報 -->
        <div class="item-info">
          <h3 class="item-name">{{ getItemName(item) }}</h3>
          <p class="item-price">{{ item.price || 'N/A' }} credits</p>
          <div class="item-actions">
            <input type="number" v-model.number="item.quantity" min="1" class="item-quantity" />
            <button @click="attemptPurchase(item)" class="buy-button">Buy</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import LanguageDropdown from './LanguageDropdown.vue';

export default {
  props: {
    userId: {
      type: String,
      required: false, // 認証されていない場合は空
      default: null,
    },
    credits: {
      type: Number,
      required: false,
      default: 0,
    },
    locale: {
      type: String,
      required: true,
    },
  },
  watch: {
    credits(newCredits) {
      console.log('Credits updated:', newCredits);
    },
    locale(newLocale) {
      this.currentLocale = newLocale;
    },
  },
  components: {
    LanguageDropdown,
  },
  data() {
    return {
      items: [], // 静的なアイテムリストを格納
      activeFilters: {
        category: null,
        mod: null,
      },
      currentLocale: this.locale,
    };
  },
  computed: {
    uniqueCategories() {
      return [...new Set(this.items.map(item => item.category))];
    },
    uniqueMods() {
      return [...new Set(this.items.map(item => item.mod))];
    },
    filteredItems() {
      return this.items.filter(item => {
        const categoryMatch = this.activeFilters.category
          ? item.category === this.activeFilters.category
          : true;
        const modMatch = this.activeFilters.mod
          ? item.mod === this.activeFilters.mod
          : true;
        return categoryMatch && modMatch;
      });
    },
  },
  mounted() {
    this.fetchItems();
  },
  methods: {
    triggerAuth() {
      // 認証ボタンが押されたときに親コンポーネントにイベントを発火
      this.$emit('triggerAuth');
    },
    applyFilter(type, value) {
      this.activeFilters[type] = this.activeFilters[type] === value ? null : value;
    },
    resetFilters() {
      this.activeFilters = { category: null, mod: null };
    },
    async fetchItems() {
      try {
        const response = await fetch('/items.json');
        this.items = await response.json();
        // 各アイテムに初期値として quantity を追加
        this.items.forEach((item) => {
          item.quantity = 1; // デフォルトの購入個数を1に設定
        });
      } catch (error) {
        console.error('Error fetching items:', error);
      }
    },
    attemptPurchase(item) {
      if (!this.userId) {
        // 認証されていない場合はイベントを発火
        this.$emit('purchaseAttempt');
        return;
      }

      // 認証済みの場合は購入処理を実行
      this.purchaseItem(item);
    },
    async purchaseItem(item) {
      try {
        const response = await fetch(`${import.meta.env.VITE_API_ENDPOINT}/usagiServerPurchase`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            userId: this.userId,
            itemId: item.id,
            itemPrice: item.price,
            quantity: item.quantity,
          }),
        });
        if (response.ok) {
          const data = await response.json();
          console.log('Purchase successful:', data);
          // 親コンポーネントに updatedCredit を渡す
          this.$emit('updateCredits', data.updatedCredit);
        } else {
          alert('Purchase failed. Please check your credits.');
        }
      } catch (error) {
        console.error('Error purchasing item:', error);
      }
    },
    getItemName(item) {
      return this.currentLocale === 'ja' ? item.jp : item.en;
    },
  },
};
</script>

<style scoped>
.auth-status {
  margin-bottom: 20px;
  text-align: center;
}

.auth-button {
  padding: 10px 20px;
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.auth-button:hover {
  background-color: #0056b3;
}

.credits-display {
  font-size: 1.2rem;
  font-weight: bold;
  color: #333;
}

.filter-buttons {
  margin-bottom: 20px;
}

.filter-group {
  overflow: hidden;
  transition: max-height 0.3s ease, opacity 0.3s ease;
  max-height: 200px;
  /* Default height for expanded state */
  opacity: 1;
}

.filter-group button {
  margin-right: 10px;
  padding: 10px 15px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: #f9f9f9;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.filter-group button.active {
  background-color: #00bcd4;
  color: white;
  border-color: #00bcd4;
}

.filter-group button:hover {
  background-color: #e0f7fa;
}

.filter-group :not(button.active) {
  opacity: 0.5;
}

.reset-button {
  margin-top: 10px;
  background-color: #00bcd4;
  color: white;
  border: none;
  padding: 10px 15px;
  border-radius: 5px;
  cursor: pointer;
}

.reset-button:hover {
  background-color: #e0f7fa;
}

.shop-container {
  padding: 10px;
  max-width: 800px;
  margin: 0 auto;
}

.shop-title {
  text-align: center;
  font-size: 1.5rem;
  margin-bottom: 10px;
  color: #333;
}

.shop-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 10px;
}

.shop-item {
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 4px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: transform 0.2s, box-shadow 0.2s;
  padding: 10px;
  text-align: center;
}

.shop-item:hover {
  transform: translateY(-3px);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.15);
}

.item-image {
  width: 32px;
  height: 32px;
  margin: 0 auto 10px;
  object-fit: contain;
}

.item-info {
  font-size: 0.9rem;
}

.item-name {
  font-size: 1rem;
  font-weight: bold;
  margin-bottom: 5px;
  color: #333;
}

.item-price {
  font-size: 0.8rem;
  color: #666;
  margin-bottom: 10px;
}

.item-actions {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 5px;
}

.item-quantity {
  width: 50px;
  padding: 3px;
  border: 1px solid #ddd;
  border-radius: 4px;
  text-align: center;
  font-size: 0.8rem;
}

.buy-button {
  background: #007bff;
  color: #fff;
  border: none;
  padding: 5px 8px;
  border-radius: 4px;
  cursor: pointer;
  font-size: 0.8rem;
  transition: background 0.2s;
}

.buy-button:hover {
  background: #0056b3;
}
</style>