設問1
SELECT * FROM users;
設問2
SELECT * FROM users
WHERE created_at LIKE '2024%';
設問3
SELECT * FROM users
WHERE age < 30 AND gender = 'female';
設問4
SELECT product_name, price FROM products;
設問5
SELECT u.name, o.order_date
FROM orders o
JOIN users u ON o.user_id = u.id;
設問6
SELECT p.product_name, p.price, oi.quantity, (p.price * oi.quantity) AS total
FROM order_items oi
JOIN products p ON oi.product_id = p.id;
設問7
SELECT u.name, COUNT(o.id) AS order_count
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.name;
設問8
SELECT u.name, SUM(p.price * oi.quantity) AS total_spent
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY u.name;
設問9
SELECT u.name, SUM(p.price * oi.quantity) AS total_spent
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY u.name
ORDER BY total_spent DESC
LIMIT 1;
設問10
  SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.product_name;
設問11
SELECT name 
FROM users 
WHERE id NOT IN (
SELECT DISTINCT user_id 
FROM orders
);
設問12
SELECT order_id
FROM order_items
GROUP BY order_id
HAVING COUNT(DISTINCT product_id) >= 2;
設問13
SELECT DISTINCT u.name
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
WHERE p.product_name = 'テレビ';
設問14
SELECT 
  orders.order_date, 
  users.name, 
  products.product_name, 
  order_items.quantity, 
  (products.price * order_items.quantity) AS total_price
FROM order_items
JOIN orders ON order_items.order_id = orders.id
JOIN users ON orders.user_id = users.id
JOIN products ON order_items.product_id = products.id;
設問15
SELECT p.product_name, SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p ON oi.product_id = p.id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 1;
設問16
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, COUNT(*) AS order_count
FROM orders
GROUP BY month;
設問17
SELECT * FROM products
WHERE id NOT IN (SELECT DISTINCT product_id FROM order_items);
設問18
CREATE INDEX idx_product_id ON order_items(product_id);
設問19
SELECT u.name, AVG(p.price * oi.quantity) AS avg_amount
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id
GROUP BY u.name;
設問20
SELECT u.name, MAX(o.order_date) AS last_order
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.name;
設問21
INSERT INTO users (id, name, age, gender, created_at)
VALUES (6, '中村愛', 25, 'female', '2025-06-01');
設問22
INSERT INTO products (id, product_name, price)
VALUES (6, 'エアコン', 60000);
設問23
INSERT INTO orders (id, user_id, order_date)
VALUES (10, 1, '2025-06-10');
設問24
INSERT INTO order_items (id, order_id, product_id, quantity)
VALUES (10, 10, 6, 1);
設問25
UPDATE users
SET age = 24
WHERE name = '田中美咲';
設問26
UPDATE products
SET price = price * 1.1;
設問27
UPDATE orders
SET order_date = '2024-05-01'
WHERE order_date < '2024-05-01';
設問28
DELETE FROM users
WHERE name = '高橋健一';
設問29
DELETE FROM order_items
WHERE order_id = 5;
設問30
DELETE FROM products
WHERE id NOT IN (
  SELECT DISTINCT product_id FROM order_items
);
