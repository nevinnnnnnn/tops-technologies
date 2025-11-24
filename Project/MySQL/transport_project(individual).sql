show databases;
create database transport_project;

show databases;
use transport_project;

create table drivers(
	drivers_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    license_number varchar(20) not null unique,
    contact_number varchar(13) not null unique,
    hire_date date
);

create table stations(
	station_id int primary key auto_increment,
    station_name varchar(50) not null,
    location varchar(50) not null,
    city varchar(50) not null,
    opening_time time,
    closing_time time
);

create table bus_stops(
	stop_id int primary key auto_increment,
    stop_name varchar(50) not null,
    station_id int not null,
    foreign key (station_id) references stations(station_id)
);

create table buses(
	bus_id int primary key auto_increment,
    plate_number varchar(10) not null unique,
    capacity int(3) not null,
    model varchar(10) not null,
    drivers_id int not null,
    foreign key (drivers_id) references drivers(drivers_id)
);

create table routes (
    route_id int primary key auto_increment,
    route_name varchar(100) not null,
    start_station_id int not null,
    end_station_id int not null,
    total_distance_km decimal(5,2),
    estimated_duration_min int,
    foreign key (start_station_id) references stations(station_id),
    foreign key (end_station_id) references stations(station_id)
);

create table prices (
    price_id int primary key auto_increment,
    route_id int not null,
    bus_id int not null,
    base_fare decimal(8,2) not null,
    tax_amount decimal(8,2) default 0.00,
    total_fare decimal(8,2) generated always as (base_fare + tax_amount) stored,
    effective_date date not null,
    foreign key (route_id) references routes(route_id),
    foreign key (bus_id) references buses(bus_id)
);

show tables;

insert into stations (station_name, location, city, opening_time, closing_time)
values
('Majestic Bus Station', 'Kempegowda, Gandhi Nagar', 'Bangalore', '05:00:00', '23:30:00'),
('CMBT Bus Terminal', 'Koyambedu', 'Chennai', '04:30:00', '23:00:00'),
('Swargate Bus Station', 'Swargate', 'Pune', '05:00:00', '23:30:00'),
('ISBT Kashmiri Gate', 'Kashmiri Gate', 'Delhi', '04:00:00', '23:59:00'),
('Miyapur Bus Station', 'Miyapur', 'Hyderabad', '05:00:00', '23:00:00');

select * from stations;

INSERT INTO bus_stops (stop_name, station_id)
VALUES
('Shivajinagar', 1),
('KR Market', 1),
('Vadapalani', 2),
('Tambaram', 2),
('Kothrud Depot', 3),
('Nigdi Chowk', 3),
('Red Fort', 4),
('Connaught Place', 4),
('Kukatpally', 5),
('Ameerpet', 5);

select * from bus_stops;

insert into drivers (first_name, last_name, license_number, contact_number, hire_date)
values
('Ramesh', 'Kumar', 'DL12345KA', '9876543210', '2018-04-12'),
('Suresh', 'Patil', 'DL67890MH', '9823456789', '2019-06-20'),
('Arun', 'Reddy', 'DL54321TS', '9123456780', '2020-03-18'),
('Rajesh', 'Singh', 'DL99887DL', '9911223344', '2017-11-05'),
('Vikram', 'Menon', 'DL11223KL', '9001122334', '2021-02-10');

select * from drivers;

insert into buses (plate_number, capacity, model, drivers_id)
values
('KA05AB1234', 50, 'Volvo', 1),
('MH12CD5678', 45, 'Tata', 2),
('TS09EF9101', 40, 'AshokLeyl', 3),
('DL01GH2345', 55, 'Volvo', 4),
('KL07IJ6789', 35, 'Eicher', 5);

select * from buses;

insert into routes (route_name, start_station_id, end_station_id, total_distance_km, estimated_duration_min)
values
('Bangalore to Chennai Express', 1, 2, 350.00, 360),
('Pune to Mumbai Rapid', 3, 4, 150.00, 180),
('Delhi City Loop', 4, 4, 40.00, 90),
('Hyderabad Circular Route', 5, 5, 60.00, 120),
('Chennai to Bangalore Return', 2, 1, 350.00, 370);

select * from routes;

INSERT INTO prices (route_id, bus_id, base_fare, tax_amount, effective_date)
VALUES
(1, 1, 850.00, 42.50, '2025-01-01'),
(2, 2, 550.00, 27.50, '2025-01-01'),
(3, 4, 120.00, 6.00, '2025-01-01'),
(4, 5, 160.00, 8.00, '2025-01-01'),
(5, 3, 830.00, 41.50, '2025-01-01');

select * from prices;

-- concepts 
select count(*) as total_buses from buses;
select count(*) as total_drivers from drivers;
select count(*) as total_routes from routes;

select sum(total_fare) as total_revenue from prices;
select avg(total_fare) as avg_revenue from prices;
select max(total_fare) as max_amt, min(total_fare) as min_amt from prices;

-- 21 - 11 - 2025

-- windows function.
-- row no, rank, dense function

use practice;
show tables;
select * from action_log;




-- data import and export
-- server --> data import or data export ---> dump for export and import for 

