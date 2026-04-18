CREATE DATABASE retail;
USE retail;

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    city VARCHAR(50),
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price INT
);

INSERT INTO orders
SELECT 
    t1.n + t2.n*10 + 1 AS order_id,
    FLOOR(100 + RAND()*100),
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND()*90) DAY),
    ELT(FLOOR(1 + RAND()*5), 'Hyderabad','Bangalore','Mumbai','Delhi','Chennai'),
    FLOOR(200 + RAND()*20),
    ELT(FLOOR(1 + RAND()*10), 'Phone','Shoes','Laptop','Watch','Tablet','Headphones','T-shirt','Backpack','Keyboard','Mouse'),
    ELT(FLOOR(1 + RAND()*3), 'Electronics','Fashion','Accessories'),
    FLOOR(1 + RAND()*5),
    FLOOR(500 + RAND()*50000)
FROM 
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t1,
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t2
LIMIT 1000;

TRUNCATE TABLE orders;

INSERT INTO orders
SELECT 
    t1.n + t2.n*10 + t3.n*100 + 1 AS order_id,
    FLOOR(100 + RAND()*100),
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND()*90) DAY),
    ELT(FLOOR(1 + RAND()*5), 'Hyderabad','Bangalore','Mumbai','Delhi','Chennai'),
    FLOOR(200 + RAND()*20),
    ELT(FLOOR(1 + RAND()*10), 'Phone','Shoes','Laptop','Watch','Tablet','Headphones','T-shirt','Backpack','Keyboard','Mouse'),
    ELT(FLOOR(1 + RAND()*3), 'Electronics','Fashion','Accessories'),
    FLOOR(1 + RAND()*5),
    FLOOR(500 + RAND()*50000)
FROM 
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t1,
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t2,
    (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
     UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) t3
LIMIT 1000;

select count(*) from orders;

select
extract(month from order_date) as month,
sum(quantity*price) as total_revenue
from orders
group by month 
order by month ;

select customer_id,
count(order_id) as total_orders
from orders
group by customer_id;


select customer_id,
count(order_id) as total_orders
from orders
group by customer_id
having count(order_id) >1;

select customer_id,
sum(quantity*price) as total_revenue
from orders
group by customer_id
order by total_revenue desc
limit 10;

select customer_id,
count(order_id) as total_orders
from orders
group by customer_id
having count(order_id) =1 ;

select city,
sum(quantity*price) as total_revenue
from orders
group by city;

SELECT * FROM orders;



