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
-- customers hwose highest orders above 200
-- store where avg orders amount is between 100 and 400 (asc and desc for ascending and descending respectively) (limit is for getting only the particular values) (offset is the gap)
-- 