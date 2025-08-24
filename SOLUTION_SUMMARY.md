# Решение проблемы с индексами Firestore

## 🚨 Проблема
Ошибка: `[cloud_firestore/failed-precondition] The query requires an index.`

## 🔍 Причина
Firestore требует составные индексы для запросов, которые:
- Фильтруют по полю `status` 
- Сортируют по полю `date`

## ✅ Решения

### 1. Быстрое решение (временное)
Код уже обновлен с fallback логикой - будет работать без индексов, но медленнее.

### 2. Постоянное решение - создать индексы

#### Вариант A: Через Firebase Console
1. Перейдите по ссылке из ошибки
2. Нажмите "Create Index"
3. Дождитесь завершения (несколько минут)

#### Вариант B: Через скрипт
```bash
./deploy_indexes.sh
```

#### Вариант C: Ручное создание
1. Firebase Console → Firestore → Indexes
2. Создать индекс: `invoices` + `status` (Asc) + `date` (Desc)
3. Создать индекс: `invoices` + `status` (Asc) + `salesRepId` (Asc) + `date` (Desc)

## 📁 Созданные файлы
- `firestore.indexes.json` - конфигурация индексов
- `firebase.json` - обновленная конфигурация Firebase
- `deploy_indexes.sh` - скрипт развертывания
- `FIREBASE_INDEXES_README.md` - подробные инструкции

## 🚀 После создания индексов
1. Перезагрузите страницу
2. Ошибка исчезнет
3. Запросы будут работать быстро
