-- Форта, Бен.
-- SQL за 10 минут, 4-е изд.: Пер. с англ.—М.: ООО “И.Д. Вильямс”,
-- 2014. — 288 с.

-- учебная база данных
-- https://forta.com/wp-content/uploads/books/0672336073/TeachYourselfSQL_SQLite.zip

-- SQLite
-- SELECT prod_name FROM Products;

-- SELECT prod_id, prod_name, prod_price FROM Products;  

-- Извлечение всех столбцов
-- SELECT * FROM Products;

-- Извлечение уникальных строк
-- SELECT vend_id FROM Products;

-- SELECT DISTINCT vend_id FROM Products;

-- Ограничение результатов запросов
-- SELECT prod_name
-- FROM Products
-- LIMIT 5;

-- Вывести следующие 5
-- SELECT prod_name
-- FROM Products
-- LIMIT 5
-- OFFSET 5;

-- Сокращенная запись
-- SELECT prod_name
-- FROM Products
-- LIMIT 5, 5;

-- стр. 39
-- Урок 3
-- Сортировка полученых данных

-- Сортировка записей (в алфавитном порядке)
-- SELECT prod_name
-- FROM Products
-- ORDER BY prod_name;

-- SELECT prod_id, prod_price, prod_name
-- FROM Products
-- ORDER BY prod_price, prod_name;

-- Сортировка по положению столбца
-- SELECT prod_id, prod_price, prod_name
-- FROM Products
-- ORDER BY 2, 3;

-- Указание направления сортировки
-- SELECT prod_id, prod_price, prod_name
-- FROM Products
-- ORDER BY prod_price DESC;

-- SELECT prod_id, prod_price, prod_name
-- FROM Products
-- ORDER BY prod_price DESC, prod_name;

-- стр. 47
-- Урок 4
-- Фильтрация данных

-- Использование предложения WHERE
-- SELECT prod_name, prod_price
-- FROM Products
-- WHERE prod_price = 3.49;

-- Операторы в предложении WHERE
-- Сравнение с одиночным значением
-- SELECT prod_name, prod_price
-- FROM Products
-- WHERE prod_price < 10;

-- SELECT prod_name, prod_price
-- FROM Products
-- WHERE prod_price <= 10;

-- Проверка на неравенство
-- SELECT vend_id, prod_price
-- FROM Products
-- WHERE vend_id != 'DLL01';

-- Сравнение с диапазоном значений
-- SELECT prod_name, prod_price
-- FROM Products
-- WHERE prod_price BETWEEN 5 AND 10;

-- Проверка на отсутствие значения
-- SELECT prod_name
-- FROM Products
-- WHERE prod_price IS NULL;

-- SELECT cust_name
-- FROM Customers
-- WHERE cust_email IS NULL;

-- стр. 55
-- Урок 5
-- Расширенная фильтрация

-- Комбинирование условий WHERE
-- Оператор AND
-- SELECT prod_id, prod_price, prod_name
-- FROM Products
-- WHERE vend_id = 'DLL01' AND prod_price <= 4;

-- Оператор OR
-- SELECT prod_name, prod_price
-- FROM Products
-- WHERE vend_id = 'DLL01' or vend_id = 'BRS01';

-- Порядок обработки операторов
-- SELECT prod_name, prod_price
-- FROM Products
-- WHERE vend_id = 'DLL01' OR vend_id = 'BRS01'
-- AND prod_price >= 10;

-- SELECT prod_name, prod_price
-- FROM Products
-- WHERE (vend_id = 'DLL01' OR vend_id = 'BRS01')
-- AND prod_price >= 10;

-- Оператор IN
-- SELECT prod_name, prod_price
-- FROM Products
-- WHERE vend_id IN ('DLL01', 'BRS01')
-- ORDER BY prod_name;

-- SELECT prod_name, prod_price
-- FROM Products
-- WHERE vend_id = 'DLL01' OR vend_id = 'BRS01'
-- ORDER BY prod_name;

-- Оператор NOT
-- SELECT prod_name
-- FROM Products
-- WHERE NOT vend_id = 'DLL01'
-- ORDER BY prod_name;

-- стр. 65
-- Урок 6
-- Фильтрация с использованием метасимволов

-- Использование оператора LIKE
-- Метасимвол «знак процента» (%)
-- SELECT prod_id, prod_name
-- FROM Products
-- WHERE prod_name LIKE 'Fish%';

-- SELECT prod_id, prod_name
-- FROM Products
-- WHERE prod_name LIKE '%bean bag%';

-- SELECT prod_name
-- FROM Products
-- WHERE prod_name LIKE 'F%y';

-- Метасимвол «знак подчеркивания» (_)
-- SELECT prod_id, prod_name
-- FROM Products
-- WHERE prod_name LIKE '__ inch teddy bear';

-- SELECT prod_id, prod_name
-- FROM Products
-- WHERE prod_name LIKE '% inch teddy bear';

-- Метасимвол «квадратные скобки» ([]) - не поддерживается в SQLite
-- SELECT cust_contact
-- FROM Customers
-- WHERE cust_contact LIKE '[JM]%'
-- ORDER BY cust_contact;

-- стр. 73
-- Урок 7
-- Создание вычисляемых полей

-- Конкатенация полей
-- SELECT vend_name || ' (' || vend_country || ') '
-- FROM Vendors
-- ORDER BY vend_name;

-- SELECT RTRIM(vend_name) || ' (' || RTRIM(vend_country) || ') '
-- FROM Vendors
-- ORDER BY vend_name;

-- Использование псевдонимов
-- SELECT RTRIM(vend_name) || ' (' || RTRIM(vend_country) || ') '
-- AS vend_title
-- FROM Vendors
-- ORDER BY vend_name;

-- Выполнение математических вычислений
-- SELECT prod_id, quantity, item_price
-- FROM OrderItems
-- WHERE order_num = 20008;

-- SELECT prod_id,
-- quantity,
-- item_price,
-- quantity*item_price AS expanded_price
-- FROM OrderItems
-- WHERE order_num = 20008;


-- стр. 83
-- Урок 8
-- Испльзование фнекции обработки данных

-- Функции для работы с текстом
-- SELECT vend_name, UPPER(vend_name) AS vend_name_upcase
-- FROM Vendors
-- ORDER BY vend_name;

-- SELECT cust_name, cust_contact
-- FROM Customers
-- WHERE cust_contact = 'Michael Green';

-- Поддерживается только в особом режиме
-- SELECT cust_name, cust_contact
-- FROM Customers
-- WHERE SOUNDEX(cust_contact) = SOUNDEX('Michael Green');

-- Функции для работы с датой и временем
SELECT order_num
FROM Orders
WHERE strftime('%Y', order_date) = 2012;

-- стр. 93
-- Урок 9
-- Итоговые вычисления

-- Функция AVG()
-- SELECT AVG(prod_price) AS avg_price
-- FROM Products;

-- SELECT AVG(prod_price) as avg_price
-- FROM Products
-- WHERE vend_id = 'DLL01';

-- Функция COUNT()
-- SELECT COUNT(*) AS num_cust
-- FROM Customers;

-- SELECT COUNT(cust_email) AS num_cust
-- FROM Customers;

-- Функция MAX()
-- SELECT MAX(prod_price) AS max_price
-- FROM Products;

-- Функция MIN()
-- SELECT MIN(prod_price) AS min_price
-- FROM Products;

-- SELECT SUM(quantity) AS item_ordered
-- FROM OrderItems
-- WHERE order_num = 20005;

-- SELECT SUM(item_price*quantity) AS total_price
-- FROM OrderItems
-- WHERE order_num = 20005;

-- Итоговые вычисления для уникальных значений
-- SELECT AVG(DISTINCT prod_price) AS avg_price
-- FROM Products
-- WHERE vend_id = 'DLL01';

-- Комбинирование итоговых функций
-- SELECT COUNT(*) AS num_items,
--     MIN(prod_price) as price_min,
--     MAX(prod_price) AS price_max,
--     AVG(prod_price) AS price_avg
-- FROM Products;


-- стр. 105
-- Урок 10
-- Группировка данных