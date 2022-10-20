--Найти активные (см. поле discontinued) продукты из категории Beverages и Seafood, которых в продаже менее 20 единиц.
-- Вывести наименование продуктов, кол-во единиц в продаже, имя контакта поставщика и его телефонный номер.

SELECT p.product_name, p.units_on_order, s.contact, s.phone
    FROM products p
JOIN suppliers s on s.id = p.supplier_id
    JOIN categories c on c.category_id = p.category_id
WHERE p.units_on_order < 20 AND
      c.category_name in ('Beverages', 'Seafood') AND
      p.discontinued = 0;
