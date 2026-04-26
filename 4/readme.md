# 🔗 Задание 4 — SQL JOIN-запросы

## 📌 Описание

В рамках задания были реализованы SQL-запросы с использованием соединений таблиц (JOIN).

Использовались:

* INNER JOIN
* LEFT JOIN
* соединение без JOIN (через WHERE)

---

## 🗄 Используемые таблицы

* `pet` — питомцы
* `owner` — владельцы
* `order1` — заказы
* `employee` — исполнители
* `vaccine` — прививки
* `vaccine_type` — виды прививок

---

## 🚀 Подключение

```sql
USE pet_db;
```

---

## 📋 Запросы

### 1. Данные на Партизана (с видом животного)

```sql
SELECT p.*, p.type
FROM pet p
WHERE p.name = 'Партизан';
```

📌 Получение информации о питомце с указанием типа.

---

### 2. Список всех собак

```sql
SELECT name, breed, age
FROM pet
WHERE type = 'Собака';
```

📌 Вывод всех собак.

---

### 3. Средний возраст кошек

```sql
SELECT AVG(age) AS avg_age
FROM pet
WHERE type = 'Кошка';
```

📌 Средний возраст кошек.

---

### 4. Невыполненные заказы

```sql
SELECT o.date, e.fio
FROM order1 o
JOIN employee e ON o.employee_id = e.employee_id
WHERE o.done = 0;
```

📌 Время и исполнители невыполненных заказов.

---

### 5. Список хозяев собак

```sql
SELECT DISTINCT o.fio, o.phone
FROM owner o
JOIN pet p ON o.owner_id = p.owner_id
WHERE p.type = 'Собака';
```

📌 Владельцы собак.

---

### 6. Внешнее соединение (все виды питомцев)

```sql
SELECT p.type, p.name
FROM pet p
LEFT JOIN owner o ON p.owner_id = o.owner_id;
```

📌 Все питомцы, даже если нет владельца.

---

### 7. Количество питомцев по возрасту

```sql
SELECT age, COUNT(*) AS count_pets
FROM pet
GROUP BY age;
```

📌 Сколько питомцев каждого возраста.

---

### 8. Сотрудники с более чем 3 заказами

```sql
SELECT e.fio, COUNT(*) AS order_count
FROM employee e
JOIN order1 o ON e.employee_id = o.employee_id
GROUP BY e.fio
HAVING COUNT(*) > 3;
```

📌 Активные сотрудники.

---

## ✍️ Дополнительный запрос (про прививки)

### 9. Владельцы и их питомцы с прививками

```sql
SELECT o.fio AS owner,
       p.name AS pet,
       vt.name AS vaccine,
       v.vaccine_date
FROM owner o
JOIN pet p ON o.owner_id = p.owner_id
JOIN vaccine v ON p.pet_id = v.pet_id
JOIN vaccine_type vt ON v.vaccine_type_id = vt.vaccine_type_id;
```

📌 Вывод информации о владельцах, питомцах и их прививках.

---

## ✅ Итог

В ходе выполнения задания были освоены:

* JOIN (INNER, LEFT)
* объединение таблиц
* агрегатные функции с JOIN
* сложные запросы (4+ таблицы)

---

## 👤 Автор

Студент: *[ТВОЁ ИМЯ]*
Группа: *[ТВОЯ ГРУППА]*
Год: 2025

---
