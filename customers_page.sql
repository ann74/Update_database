-- Посчитать количество заказчиков
SELECT count(customer_id) as count_of_customers FROM customers;

-- Выбрать все уникальные сочетания городов и стран, в которых "зарегестрированы" заказчики

SELECT city, country FROM customers
GROUP BY city, country;

-- Найти заказчиков и обслуживающих их заказы сотрудников, таких, что и заказчики и сотрудники из города London,
-- а доставка идёт компанией Speedy Express. Вывести компанию заказчика и ФИО сотрудника.

SELECT cu.company_name, concat(em.first_name, ' ', em.last_name) as employeer_name
FROM customers cu
JOIN orders ord ON cu.customer_id = ord.customer_id
JOIN employees em ON em.employee_id = ord.employee_id
JOIN shippers sh ON sh.shipper_id = ord.ship_via
WHERE em.city = 'London' and cu.city = 'London' and sh.company_name = 'Speedy Express';

-- Найти заказчиков, не сделавших ни одного заказа. Вывести имя заказчика и order_id.

SELECT cu.company_name, ord.order_id
FROM customers cu
LEFT JOIN orders ord ON cu.customer_id = ord.customer_id
WHERE ord.customer_id is NULL;
