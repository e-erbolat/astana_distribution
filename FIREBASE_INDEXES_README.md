# Индексы Firestore для Astana Distribution

## Проблема
Приложение выдает ошибку: `[cloud_firestore/failed-precondition] The query requires an index.`

Это происходит потому, что Firestore требует составные индексы для запросов, которые:
1. Фильтруют по полю `status` 
2. Сортируют по полю `date`

## Решение

### Вариант 1: Автоматическое создание через Firebase Console
1. Перейдите по ссылке из ошибки в консоли Firebase
2. Нажмите "Create Index"
3. Дождитесь завершения создания индекса (может занять несколько минут)

### Вариант 2: Развертывание через Firebase CLI
1. Установите Firebase CLI: `npm install -g firebase-tools`
2. Войдите в проект: `firebase login`
3. Разверните индексы: `firebase deploy --only firestore:indexes`

### Вариант 3: Ручное создание в Firebase Console
1. Откройте [Firebase Console](https://console.firebase.google.com)
2. Выберите проект `astana-distribution`
3. Перейдите в Firestore Database → Indexes
4. Создайте составной индекс:
   - Collection ID: `invoices`
   - Fields: 
     - `status` (Ascending)
     - `date` (Descending)
5. Создайте второй индекс:
   - Collection ID: `invoices`
   - Fields:
     - `status` (Ascending)
     - `salesRepId` (Ascending)
     - `date` (Descending)

## Текущие индексы
Файл `firestore.indexes.json` содержит все необходимые индексы для корректной работы приложения.

## Проверка
После создания индексов:
1. Дождитесь статуса "Enabled" для всех индексов
2. Перезагрузите страницу с доставленными накладными
3. Ошибка должна исчезнуть
