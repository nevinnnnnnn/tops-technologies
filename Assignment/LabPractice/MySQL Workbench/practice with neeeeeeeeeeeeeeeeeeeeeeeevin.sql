create database practice;
create database swiggy;
show databases;

create database swiggy;

use practice;

show tables;

create table customer(
customer_id int auto_increment primary key,
cust_name varchar(100) not null,
email varchar(100) unique not null,
phone varchar(13) unique not null,
address text not null,
registered_date timestamp default current_timestamp
);

insert into customer (cust_name, email, phone, address) values
('Alice Johnson', 'alice@email.com', '+1234567890', '123 Maple St, New York'),
('Bob Smith', 'bob@email.com', '+1234567891', '456 Oak Ave, Los Angeles'),
('Carol Davis', 'carol@email.com', '+1234567892', '789 Pine Rd, Chicago'),
('David Wilson', 'david@email.com', '+1234567893', '321 Elm Blvd, Houston'),
('Eva Brown', 'eva@email.com', '+1234567894', '654 Cedar Ln, Phoenix'),
('Frank Miller', 'frank@email.com', '+1234567895', '987 Spruce Dr, Philadelphia'),
('Grace Lee', 'grace@email.com', '+1234567896', '147 Birch Ct, San Antonio'),
('Henry Taylor', 'henry@email.com', '+1234567897', '258 Redwood Way, San Diego'),
('Ivy Clark', 'ivy@email.com', '+1234567898', '369 Willow Pass, Dallas'),
('Jack Hall', 'jack@email.com', '+1234567899', '741 Sycamore St, San Jose'); 

create table orders(
	order_id int auto_increment primary key,
    customer_id int,
    order_status varchar(100) not null,
    payment_status varchar(100) not null,
    total_amount int not null,
    order_date datetime default current_timestamp,
    foreign key (customer_id) references customer(customer_id) on delete set null
    );
    
insert into orders (customer_id, order_status, payment_status, total_amount) values
(1, 'Pending', 'Unpaid', 250),
(2, 'Shipped', 'Paid', 120),
(3, 'Delivered', 'Paid', 89),
(4, 'Processing', 'Paid', 300),
(5, 'Pending', 'Unpaid', 75),
(6, 'Shipped', 'Paid', 200),
(7, 'Delivered', 'Paid', 150),
(8, 'Processing', 'Unpaid', 400),
(9, 'Pending', 'Unpaid', 95),
(10, 'Shipped', 'Paid', 175);

-- stores (store_id, store_name, address, city , phone)
create table stores(
	store_id int auto_increment primary key,
    store_name varchar(100) not null,
    address text not null,
    city varchar(100) not null,
    phone varchar(13) not null unique
);

insert into stores (store_name, address, city, phone) values
('Downtown Store', '123 Main St', 'New York', '+1234567890'),
('Uptown Outlet', '456 Park Ave', 'New York', '+1234567891'),
('Westside Mart', '789 Oak Blvd', 'Los Angeles', '+1234567892'),
('Eastside Shop', '321 Pine Rd', 'Los Angeles', '+1234567893'),
('Northridge Store', '654 Cedar Ln', 'Chicago', '+1234567894'),
('Southgate Market', '987 Spruce Dr', 'Chicago', '+1234567895'),
('Riverside Outlet', '147 Willow Pass', 'Houston', '+1234567896'),
('Hilltop Store', '258 Birch Ct', 'Phoenix', '+1234567897'),
('Lakeside Shop', '369 Redwood Way', 'Philadelphia', '+1234567898'),
('Meadow Mall', '741 Sycamore St', 'San Antonio', '+1234567899');

-- products (product_id, product_name, brand,category,  price)
create table products(
	product_id int auto_increment primary key,
    product_name varchar(100) not null,
    brand varchar(100) not null,
    category varchar(20) not null,
    price decimal(10,2) not null
);

insert into products (product_name, brand, category, price) values
('Laptop Pro', 'TechBrand', 'Electronics', 999.99),
('Wireless Mouse', 'NetGear', 'Electronics', 25.50),
('Office Chair', 'HomeFit', 'Furniture', 149.99),
('Coffee Mug', 'CeramicCo', 'Kitchen', 12.00),
('Running Shoes', 'SportX', 'Apparel', 89.95),
('Smartphone X', 'MobilePlus', 'Electronics', 699.00),
('Desk Lamp', 'BrightLite', 'Furniture', 39.90),
('Backpack', 'TravelGear', 'Accessories', 45.00),
('Bluetooth Speaker', 'SoundMax', 'Electronics', 79.99),
('Notebook', 'PaperCo', 'Stationery', 5.50);

-- stocks (stock_id, product_id,product_name, order_id, quantity)
create table stocks(
	stock_id int auto_increment primary key,
    product_id int not null,
    product_name varchar(100) not null,
    order_id int,
    quantity int not null,
    foreign key (product_id) references products(product_id),
    foreign key (order_id) references orders(order_id)
);

insert into stocks (product_id, product_name, order_id, quantity) values
(1, 'Laptop Pro', 1, 50),
(2, 'Wireless Mouse', 2, 200),
(3, 'Office Chair', 3, 30),
(4, 'Coffee Mug', 4, 150),
(5, 'Running Shoes', 5, 80),
(6, 'Smartphone X', 6, 40),
(7, 'Desk Lamp', 7, 120),
(8, 'Backpack', 8, 90),
(9, 'Bluetooth Speaker', 9, 60),
(10, 'Notebook', 10, 300);

-- riders (rider_id, name, phone, vehicle_type, status {default:"available"}, )
create table riders(
	rider_id int auto_increment primary key,
    name varchar(100) not null,
    phone int(13) not null unique,
    vehicle_type varchar(20) not null,
    status varchar(20) default 'available'
);

insert into riders (name, phone, vehicle_type) values
('Alice Johnson', '+1234567890', 'Bike'),
('Bob Smith', '+1234567891', 'Scooter'),
('Carol Davis', '+1234567892', 'Bike'),
('David Wilson', '+1234567893', 'Motorcycle'),
('Eva Brown', '+1234567894', 'Bike'),
('Frank Miller', '+1234567895', 'Scooter'),
('Grace Lee', '+1234567896', 'Motorcycle'),
('Henry Taylor', '+1234567897', 'Bike'),
('Ivy Clark', '+1234567898', 'Scooter'),
('Jack Hall', '+1234567899', 'Bike');

-- deliveries (delivery_id, order_id, rider_id, assigned_at {timestamp},  status, distance)
create table deliveries(
	delivery_id int auto_increment primary key,
    order_id int,
    rider_id int not null,
    assigned_at timestamp default current_timestamp,
    status varchar(50) default 'pending',
    distance decimal(6, 2),
    foreign key (order_id) references orders(order_id),
    foreign key (rider_id) references riders(rider_id)
);

insert into deliveries (order_id, rider_id, distance) values
(1, 1, 3.50),
(2, 2, 5.20),
(3, 3, 2.80),
(4, 4, 6.10),
(5, 5, 4.30),
(6, 6, 7.00),
(7, 7, 3.90),
(8, 8, 5.60),
(9, 9, 4.75),
(10, 10, 6.25);
    
-- review (review_id, product_id, customer_id, rating {1 to 5}, comment, time )
create table review(
	review_id int auto_increment primary key,
    product_id int not null,
    customer_id int not null,
    rating int check (rating between 1 and 5),
    comment text,
    foreign key (product_id) references products(product_id),
    foreign key (customer_id) references customer(customer_id)
);

insert into review (product_id, customer_id, rating, comment) value
(1, 1, 5, 'maza aa gya.'),
(2, 2, 4, 'acha tha.'),
(3, 3, 5, 'aaram dayak'),
(4, 4, 3, 'Nice mugga'),
(5, 5, 5, 'jaldi bhagungaa'),
(6, 6, 4, 'screenshot acha aata hai'),
(7, 7, 4, 'muskaan ki chamkan se jyada chamakta hai'),
(8, 8, 5, 'dead body aa jayegi itni jagah hai'),
(9, 9, 5, 'chota pack bada dhamaka'),
(10, 10, 4, 'mere jese data analyst ke liye sab se best notebok hai');

show tables;

show databases;
rename table swiggy.customer to practice.customer;
rename table swiggy.deliveries to practice.deliveries;
rename table swiggy.orders to practice.orders;
rename table swiggy.products to practice.products;
rename table swiggy.review to practice.review;
rename table swiggy.riders to practice.riders;
rename table swiggy.stocks to practice.stocks;
rename table swiggy.stores to practice.stores;

use practice;
show tables;

-- Use functions like COUNT(), SUM(), AVG(), MIN(), and MAX() on your tables.
select count(*) as total_customers from customer;

show tables;
select * from orders;
select sum(total_amount) as amount_collected from orders;

select avg(total_amount) as avg_amt_collected from orders;

select * from orders;
select order_status, sum(total_amount) as total_sales from orders group by order_status;

select * from orders;
select payment_status, avg(total_amount) as average_amount from orders group by payment_status;

show tables;
select * from orders;
select min(total_amount) from orders;
select max(total_amount) from orders;

-- Find the total number of registered customers.
show tables;
select * from customer;
select count(customer_id) from customer;

-- Calculate the total revenue earned from all orders.
select * from orders;
select sum(total_amount) as revenue_generated from orders;

-- Find the average total amount of all delivered orders.
show tables;
select * from orders;
select avg(total_amount) as avg_total_amount from orders where order_status="Delivered";


show tables;


-- Display the minimum and maximum total amount from the orders table.
select * from orders;
select max(total_amount) from orders;
select min(total_amount) from orders;

-- Find the total number of reviews submitted for each product.
show tables;
select * from review;
select count(review_id) from review;

-- Retrieve all orders where the order_status = 'Delivered'.
show tables;
select * from orders;
select * from orders where order_status = "Delivered";

-- Find all products that cost more than 200 INR.
show tables;
select * from orders;
select * from orders where total_amount > 200;

-- Show details of customers whose email contains 'gmail'.
show tables;
select * from customer;
select * from customer where email like "%email%";	

-- Find the total number of orders placed by each customer.
show tables;
select distinct cust_name from customer;

-- Calculate the average total amount of orders for each order_status.
select * from orders;
select order_status, avg(total_amount) as avg_total_amt from orders group by order_status;

-- Find how many products belong to each brand.
show tables;
select * from products;
select category, count(product_name) as no_of_products from products group by category;

-- Show the total revenue generated by each store.
show tables;
select * from stores;
alter table orders add column store_id int;
alter table orders add foreign key (store_id) references stores(store_id);

update orders set store_id = 1 where order_id in (1,2);
update orders set store_id = 2 where order_id in (3,4);
update orders set store_id = 3 where order_id in (5,6);
update orders set store_id = 4 where order_id in (7,8);
update orders set store_id = 5 where order_id in (9,10);

select * from stores;
select * from orders;

select s.store_name, sum(total_amount) as total_revenue from stores s join orders o on s.store_id =o.store_id
group by s.store_name order by total_revenue desc;

-- Show customers who placed more than 2 orders.
select * from customer;
select * from orders;

select c.customer_id, c.cust_name, count(o.order_id) as total_orders
from customer c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.cust_name
having count(o.order_id) > 2;

-- Find all brands having more than 3 products listed.
select * from products;
select * from stocks;

select brand, count(product_id) as total_products from products group by brand having count(product_id) > 3;

-- Display stores that have total revenue > 500 INR.
select * from stores;
select * from orders;

select brand, count(product_id) as total_products, round(AVG(price), 2) as avg_price, max(price) as highest_price
from products
group by brand
having count(product_id) > 3
order by total_products desc;

-- Show order_status categories where average order value > 200 INR.

select order_status, round(avg(total_amount), 2) as avg_order_value from orders
group by order_status having avg(total_amount) > 200 order by avg_order_value desc;

-- Show customers who placed more than 2 orders.
select * from orders;
select * from customer;

select c.customer_id, c.cust_name, count(o.order_id) as total_orders from customer c join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.cust_name having count(o.order_id) > 2 order by total_orders desc;

-- Find all brands having more than 3 products listed.
select brand, COUNT(product_id) AS total_products
from products group by brand having COUNT(product_id) > 3;

-- Display stores that have total revenue > 500 INR.
select store_id, sum(total_amount) AS total_revenue
from orders group by store_id having sum(total_amount) > 500;

-- Show order_status categories where average order value > 200 INR.
select order_status, avg(total_amount) as avg_order_value from orders
group by order_status having avg(total_amount) > 200;

-- List all orders sorted by total_amount in descending order.
select order_id, customer_id, store_id, total_amount, order_date, order_status
from orders order by total_amount desc;

-- Show all customers sorted alphabetically by their name.
select customer_id, cust_name, email, phone
from customer order by cust_name asc;

-- Display all products ordered by price (low to high).
select product_id, product_name, brand, price
from products order by price asc;

-- List all riders ordered by rider_id descending.
select rider_id, name, phone
from riders order by rider_id desc;

-- Show all customers sorted alphabetically by their name.
select customer_id, cust_name, phone
from customer order by cust_name asc;

-- Display all products ordered by price (low to high).
select product_id, product_name, brand, price
from products order by price asc;

-- List all riders ordered by rider_id descending.
select rider_id, name, phone
from riders order by rider_id desc;

-- Retrieve the top 5 highest total_amount orders.
select order_id, customer_id, store_id, total_amount, order_date, order_status
from orders order by total_amount desc limit 5;

-- Display top 3 most expensive products.
select product_id, product_name, brand, price
from products order by price desc limit 3;

-- Find all orders where store_id IN (1, 3, 5).
select * from orders where store_id in (1, 3, 5);

-- Retrieve customers whose customer_id IN (2, 4, 6, 8).
select * from customer where customer_id in (2,4,6,8);