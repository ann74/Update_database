-- Выбрать все заказы, отсортировать по required_date (по убыванию) и отсортировать по дате отгрузке (по возрастанию)

SELECT * FROM orders
ORDER BY required_date DESC, shipped_date;

-- Найти среднее значение дней уходящих на доставку с даты формирования заказа в USA

SELECT c.country, avg(ord.required_date - ord.order_date) as avg_shipping_days
    FROM orders ord JOIN customers c on c.customer_id = ord.customer_id
WHERE c.country = 'USA'
GROUP BY c.country;

-- Найти сумму, на которую имеется товаров (количество * цену) причём таких, которые не сняты с продажи
-- (см. на поле discontinued)

SELECT sum(unit_price * units_in_stock)
    FROM products
WHERE discontinued != 1;
