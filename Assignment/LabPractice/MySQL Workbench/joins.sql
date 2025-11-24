use practice;
-- inner joins
-- List all orders along with their corresponding customer names.
select o.order_id, c.cust_name from orders o inner join customer c on o.customer_id = c.customer_id;

-- Show order details with store names from the stores table.
select s.store_name, o.order_status, o.payment_status
from stores s inner join orders o on s.store_id = o.store_id;

-- Find all customers who have placed at least one order.
select distinct c.customer_id, c.cust_name, c.email, c.phone from customer c inner join orders o on c.customer_id = o.customer_id;

-- Retrieve order details with customer name and payment status
select c.cust_name, o.payment_status, o.order_status, o.total_amount
from customer c inner join orders o on c.customer_id = o.customer_id;

-- Display order ID, customer name, and total amount for paid orders.
select o.order_id, c.cust_name, o.total_amount from customer c inner join orders o on c.customer_id = o.customer_id where payment_status = "Paid";

-- Get all orders where store and customer information is available.
select * from orders;
select * from customer;
select * from stores;

-- List all customers and their orders where order status is ‘Delivered’.
select c.cust_name, o.order_id from customer c inner join orders o on c.customer_id = o.customer_id where order_status = "Delivered";

-- Left Join
-- List all customers and their orders, including those who haven’t placed any.
select c.cust_name, o.order_id from customer c left join orders o on c.customer_id = o.customer_id;

-- Display all customers with order details (if available).
select c.cust_name, o.order_id, o.order_status, o.payment_status, o.total_amount from customer c left join orders o on c.customer_id = o.customer_id;

-- Show all orders along with store name; if store info missing, still show order.
select o.order_id, s.store_name from orders o left join stores s on o.store_id = s.store_id;

-- Find customers who haven’t placed any orders yet.
select * from customer;
select * from orders;

select c.cust_name, o.order_status from customer c left join orders o on c.customer_id = o.customer_id where order_status = "Pending";

-- Show customer names and order amounts, including customers with no orders. (how are they even customers without any orders?)
select c.cust_name, o.total_amount from customer c left join orders o on c.customer_id = o.customer_id;

-- trigger
show databases;
use practice;
show tables;
create table action_log (
	log_id int auto_increment primary key,
    table_name varchar(100),
    paction_type varchar(50),
    old_data text,
    new_data text,
    action_time timestamp default current_timestamp
);

delimiter //
create trigger after_order_insert
after insert on orders
for each row
begin
	insert into action_log(table_name, action_type, new_data)
    values("orders", "after insert", concat("order_id:", new.order_id));
end //
delimiter ;

show tables;
-- create trigger for before update - phone in customer table should have only 10 digits
delimiter //
create trigger before_update_phone
before update on customer
for each row
begin
	if char_length(new.phone) != 10 then
    signal sqlstate "45000" set message_text = "phone number needs to be in 10 digits only";
    end if;
end //
delimiter //

select * from customer;
insert into customer(cust_name, email, phone, address)
values
("ven", "ven@gmail.com", "00000000098", "123 downtown, NYC");

update customer
set phone = "12345678910"
where customer_id = 16;

-- 2nd trigger
show tables;
select * from riders;
drop trigger riders_beforeInsert_phone;
delimiter //
create trigger riders_beforeInsert_phone
before update on riders
for each row
begin
	if length(new.phone) != 10 then
    signal sqlstate "45000" set message_text = "the number should have 10 digits";
    end if;
end //
delimiter ;

select * from riders;
insert into riders(name, phone, vehicle_type, status)
values ("nana", 778965542, "Bike", "Available");

update riders
set phone = 9544041559
where rider_id = 14;