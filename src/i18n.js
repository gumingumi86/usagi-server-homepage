import { createI18n } from 'vue-i18n';
import en from './locales/en.json';
import ja from './locales/ja.json';

const messages = {
  en,
  ja,
};

const i18n = createI18n({
  locale: 'en', // デフォルトの言語
  fallbackLocale: 'en', // 言語が見つからない場合のフォールバック
  messages,
});

export default i18n;