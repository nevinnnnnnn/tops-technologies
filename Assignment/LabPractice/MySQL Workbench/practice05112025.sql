-- 05 - 11 - 25

use practice;

select * from orders;

-- arithmetic operators
select order_id, total_amount + 10.05 as new_price from orders;

select order_id, total_amount - (total_amount * 0.10) as discounted_price from orders;

-- comparision operators
select * from orders where total_amount < 200;

-- logical operators
select * from orders where total_amount < 200 and payment_status = "paid";

-- aggregation function - count, sum, average, min, max


select order_status, sum(total_amount) as total_amount from orders group by order_status;


-- store with atleast 3 delivered orders
show tables;
select * from orders where order_status = "Delivered" limit 3;

-- customers hwose highest orders above 300
show tables;
select * from customer, orders where total_amount > 300;

-- select customer_id from orders and cust_name from customer where total_amount > 200;
select customer_id, cust_name from customer where customer_id in (select customer_id from orders where total_amount > 200);

-- store where avg orders amount is between 100 and 400 (asc and desc for ascending and descending respectively) (limit is for getting only the particular values) (offset is the gap)
select * from products;

select product_name, price from products where price between 21 and 100;

show tables;

select distinct category from products;

select * from orders where customer_id in (1,3,7,4,8);

show tables;

select * from products;

select brand from products limit 3;

select brand, product_name from products order by price asc limit 5 offset 2;