# 🧠 Задание 5 — Продвинутые SQL-запросы

## 📌 Описание

В рамках задания были реализованы сложные SQL-запросы с использованием:

* подзапросов (`IN`, `NOT IN`)
* `EXISTS`
* `UNION`
* сложных соединений таблиц

---

## 🗄 Используемые таблицы

* `order1` — заказы
* `employee` — исполнители
* `pet` — питомцы
* `owner` — владельцы
* `service` — услуги

---

## 🚀 Подключение

```sql id="zjxq4n"
USE pet_db;
```

---

## 📋 Запросы

### 1. Оценки по заказам студентов

```sql id="f5q7r9"
SELECT rating
FROM order1
WHERE employee_id IN (
    SELECT employee_id
    FROM employee
    WHERE specialization = 'Студент'
);
```

📌 Оценки заказов, выполненных студентами.

---

### 2. Исполнители без заказов

#### 2.1 ID исполнителей

```sql id="tx6w0s"
SELECT employee_id
FROM employee
WHERE employee_id NOT IN (
    SELECT employee_id
    FROM order1
);
```

#### 2.2 Фамилии исполнителей

```sql id="7wpw5w"
SELECT fio
FROM employee
WHERE employee_id NOT IN (
    SELECT employee_id
    FROM order1
);
```

📌 Сотрудники без заказов.

---

### 3. Список заказов (с JOIN и псевдонимами)

```sql id="5z7g4k"
SELECT s.name AS service,
       o.date,
       e.fio AS employee,
       p.name AS pet,
       ow.fio AS owner
FROM order1 o
JOIN service s ON o.service_id = s.service_id
JOIN employee e ON o.employee_id = e.employee_id
JOIN pet p ON o.pet_id = p.pet_id
JOIN owner ow ON p.owner_id = ow.owner_id;
```

📌 Полная информация по заказам.

---

### 4. Общий список комментариев

```sql id="o1yxu7"
SELECT comment FROM order1
UNION
SELECT comment FROM pet
UNION
SELECT comment FROM owner;
```

📌 Все комментарии из разных таблиц.

---

### 5. Сотрудники с оценкой 4 (EXISTS)

```sql id="9xkv7m"
SELECT fio
FROM employee e
WHERE EXISTS (
    SELECT 1
    FROM order1 o
    WHERE o.employee_id = e.employee_id
      AND o.rating = 4
);
```

📌 Исполнители, получавшие оценку 4.

---

### 6. То же без EXISTS

```sql id="g7r7oz"
SELECT DISTINCT e.fio
FROM employee e
JOIN order1 o ON e.employee_id = o.employee_id
WHERE o.rating = 4;
```

📌 Альтернативная реализация.

---

## ✅ Итог

В ходе выполнения задания были освоены:

* подзапросы (`IN`, `NOT IN`)
* оператор `EXISTS`
* объединение выборок (`UNION`)
* сложные JOIN-запросы
* псевдонимы таблиц

---

## 👤 Автор

Студент: *[ТВОЁ ИМЯ]*
Группа: *[ТВОЯ ГРУППА]*
Год: 2025

---
