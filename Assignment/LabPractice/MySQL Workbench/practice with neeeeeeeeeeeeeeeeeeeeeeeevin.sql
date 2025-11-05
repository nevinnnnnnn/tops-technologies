create database practice;
create database swiggy;
show databases;

create database swiggy;

use swiggy;

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