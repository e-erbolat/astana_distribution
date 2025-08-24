#!/bin/bash

# Скрипт для развертывания индексов Firestore
# Решает проблему: [cloud_firestore/failed-precondition] The query requires an index.

echo "🚀 Развертывание индексов Firestore для Astana Distribution..."

# Проверяем, установлен ли Firebase CLI
if ! command -v firebase &> /dev/null; then
    echo "❌ Firebase CLI не установлен"
    echo "Установите его командой: npm install -g firebase-tools"
    exit 1
fi

# Проверяем, авторизован ли пользователь
if ! firebase projects:list &> /dev/null; then
    echo "🔐 Требуется авторизация в Firebase"
    firebase login
fi

# Развертываем только индексы
echo "📊 Создание индексов..."
firebase deploy --only firestore:indexes

echo "✅ Индексы развернуты!"
echo "⚠️  Обратите внимание: создание индексов может занять несколько минут"
echo "📱 После завершения перезагрузите страницу с доставленными накладными"
