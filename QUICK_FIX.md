# 🚀 Быстрое решение проблемы с индексами

## Проблема
Ошибка: `[cloud_firestore/failed-precondition] The query requires an index.`

## ✅ Решение за 2 минуты

### Шаг 1: Перейдите по ссылке
Нажмите на ссылку из ошибки в браузере:
```
https://console.firebase.google.com/v1/r/project/astana-distribution/firestore/indexes?create_composite=...
```

### Шаг 2: Создайте индекс
1. В Firebase Console нажмите **"Create Index"**
2. Дождитесь завершения (2-5 минут)

### Шаг 3: Готово!
Перезагрузите страницу - ошибка исчезнет.

## 🔧 Альтернативное решение
Если ссылка не работает:
1. Откройте [Firebase Console](https://console.firebase.google.com)
2. Выберите проект `astana-distribution`
3. Firestore Database → Indexes
4. Создайте индекс: `invoices` + `status` (Asc) + `date` (Desc)

## 📱 Код уже исправлен
Приложение будет работать даже без индексов (медленнее), но для оптимальной производительности создайте индексы.
