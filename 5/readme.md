# 🔗 Задание 4 — SQL-запросы с JOIN

## 📌 Описание

В рамках задания были написаны и отлажены SQL-запросы с использованием соединения таблиц.

Используемая база данных: `pet_db`.

В задании применяются:

* `JOIN`
* соединение таблиц через `WHERE`
* `LEFT JOIN`
* `GROUP BY`
* `HAVING`
* агрегатные функции

---

## 🗄 Используемые таблицы

* `Pet` — питомцы
* `Pet_Type` — виды питомцев
* `Owner` — владельцы
* `Person` — персональные данные людей
* `Employee` — сотрудники
* `Order1` — заказы
* `Service` — услуги
* `Vaccine` — прививки
* `VaccineType` / `Vaccine_Type` — виды прививок

---

## 🚀 Подключение к базе

```sql
USE pet_db;
```

---

## 📋 Запросы

---

## 1. Данные на Partizan, включая вид животного

```sql
SELECT Pet.*, Pet_Type.Name AS Pet_Type
FROM Pet
JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
WHERE Pet.Nick = 'Partizan';
```

📌 Запрос выводит всю информацию о питомце `Partizan` и дополнительно показывает вид животного.

---

## 2. Список всех собак с кличками, породой и возрастом

```sql
SELECT Pet.Nick, Pet.Breed, Pet.Age
FROM Pet
JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
WHERE Pet_Type.Name = 'DOG';
```

📌 Выводятся только питомцы, относящиеся к виду `DOG`.

---

## 3. Средний возраст кошек

```sql
SELECT AVG(CAST(Pet.Age AS DECIMAL(10,2))) AS Avg_Cat_Age
FROM Pet
JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
WHERE Pet_Type.Name = 'CAT';
```

📌 Считается средний возраст кошек.
`CAST` используется для преобразования возраста в вещественный тип.

---

## 4. Время и исполнители невыполненных заказов

```sql
SELECT Order1.Time_Order,
       Person.Last_Name,
       Person.First_Name
FROM Order1
JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID
JOIN Person ON Employee.Person_ID = Person.Person_ID
WHERE Order1.Is_Done = 0;
```

📌 Выводятся невыполненные заказы и сотрудники, которые назначены исполнителями.

---

## 5. Список хозяев собак: имя, фамилия, телефон

```sql
SELECT DISTINCT Person.First_Name,
                Person.Last_Name,
                Person.Phone
FROM Person
JOIN Owner ON Person.Person_ID = Owner.Person_ID
JOIN Pet ON Owner.Owner_ID = Pet.Owner_ID
JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
WHERE Pet_Type.Name = 'DOG';
```

📌 Запрос показывает владельцев собак.

---

## 6. Все виды питомцев и клички представителей этих видов

```sql
SELECT Pet_Type.Name AS Pet_Type,
       Pet.Nick
FROM Pet_Type
LEFT JOIN Pet ON Pet_Type.Pet_Type_ID = Pet.Pet_Type_ID;
```

📌 Используется внешнее соединение `LEFT JOIN`.
Будут показаны все виды питомцев, даже если представителей какого-то вида нет.

---

## 7. Сколько имеется котов, собак и других питомцев в каждом возрасте

```sql
SELECT Pet_Type.Name AS Pet_Type,
       Pet.Age,
       COUNT(*) AS Pet_Count
FROM Pet
JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
GROUP BY Pet_Type.Name, Pet.Age
ORDER BY Pet_Type.Name, Pet.Age;
```

📌 Запрос группирует питомцев по виду и возрасту.

---

## 8. Фамилии сотрудников, выполнивших более трёх заказов

```sql
SELECT Person.Last_Name,
       COUNT(*) AS Done_Orders
FROM Order1
JOIN Employee ON Order1.Employee_ID = Employee.Employee_ID
JOIN Person ON Employee.Person_ID = Person.Person_ID
WHERE Order1.Is_Done = 1
GROUP BY Person.Last_Name
HAVING COUNT(*) > 3;
```

📌 Выводятся сотрудники, у которых больше трёх выполненных заказов.

---

## 9. Запрос про прививки с использованием не менее четырёх таблиц

### Формулировка

Вывести владельцев, их питомцев, вид животного, вид прививки и дату прививки.

```sql
SELECT Person.Last_Name AS Owner_Last_Name,
       Person.First_Name AS Owner_First_Name,
       Pet.Nick AS Pet_Nick,
       Pet_Type.Name AS Pet_Type,
       vaccine_type.name AS Vaccine_Type,
       vaccine.Vaccination_Date
FROM Person
JOIN Owner ON Person.Person_ID = Owner.Person_ID
JOIN Pet ON Owner.Owner_ID = Pet.Owner_ID
JOIN Pet_Type ON Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
JOIN vaccine ON Pet.Pet_ID = vaccine.pet_id
JOIN vaccine_type ON vaccine.vaccine_type_id = vaccine_type.vaccine_type_id;
```

📌 В запросе используются таблицы:

* `Person`
* `Owner`
* `Pet`
* `Pet_Type`
* `Vaccine`
* `VaccineType`

---

## Альтернативный пример соединения без JOIN

```sql
SELECT Pet.Nick,
       Pet.Breed,
       Pet.Age,
       Pet_Type.Name AS Pet_Type
FROM Pet, Pet_Type
WHERE Pet.Pet_Type_ID = Pet_Type.Pet_Type_ID
  AND Pet_Type.Name = 'DOG';
```

📌 Этот запрос делает то же соединение таблиц, но без явного `JOIN`.

---

## ✅ Итог

В ходе выполнения задания были использованы:

* `JOIN`
* `LEFT JOIN`
* соединение таблиц через `WHERE`
* `GROUP BY`
* `HAVING`
* `COUNT`
* `AVG`
* псевдонимы столбцов

---

## 👤 Автор

Студент: *[ТВОЁ ИМЯ]*
Группа: *[ТВОЯ ГРУППА]*
Год: 2025
