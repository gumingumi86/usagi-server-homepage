<template>
  <div class="shop-container">
    <h2 class="shop-title">Shop(In preparation)</h2>
    <router-link to="/" class="text-cyan-400 hover:underline">
        Back to Home
    </router-link>
    <div class="shop-grid">
      <div v-for="item in items" :key="item.id" class="shop-item">
        <!-- アイテム画像 -->
        <img :src="`/shop_resources${item.image}`" :alt="item.en" class="item-image" />
        <!-- アイテム情報 -->
        <div class="item-info">
          <h3 class="item-name">{{ item.en }}</h3>
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
export default {
  props: {
    userId: {
      type: String,
      required: false, // 認証されていない場合は空
    },
  },
  data() {
    return {
      items: [], // 静的なアイテムリストを格納
    };
  },
  mounted() {
    this.fetchItems();
  },
  methods: {
    async fetchItems() {
      try {
        const response = await fetch('/shop_resources/items.json');
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
        const response = await fetch('{defaultApiEndPoint}/usagiServerPurchase', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            userId: this.userId,
            itemId: item.id,
            itemPrice: 0,
            quantity: item.quantity,
          }),
        });
        if (response.ok) {
          alert('Purchase successful! Item will be delivered in-game.');
        } else {
          alert('Purchase failed. Please check your credits.');
        }
      } catch (error) {
        console.error('Error purchasing item:', error);
      }
    },
  },
};
</script>

<style scoped>
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