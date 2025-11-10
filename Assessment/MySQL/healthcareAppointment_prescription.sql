-- Case Study : Healthcare Appointments & Prescriptions
show databases;
create database healthcare;
use healthcare;

-- patients(patient_id, name, dob, gender)
create table patients(
	patient_id int auto_increment primary key,
    name varchar(30) not null,
    dob date not null,
    gender varchar(1) check (gender in ('m', 'M', 'f', 'F'))
    );
    
-- doctors(doctor_id, name, department)
create table doctors(
	doctor_id int auto_increment primary key,
    name varchar(30) not null,
    department varchar(20) not null
);

-- appointments(app_id, patient_id, doctor_id, app_date)
create table appointments(
app_id int auto_increment primary key, 
patient_id int not null, 
doctor_id int not null, 
app_date datetime default current_timestamp,
foreign key (patient_id) references patients(patient_id),
foreign key (doctor_id) references doctors(doctor_id)
);

-- prescriptions(pres_id, app_id, medicine, dosage_mg)
create table prescriptions(
	pres_id int auto_increment primary key, 
    app_id int not null, 
    medicine varchar(50) not null, 
    dosage_mg varchar(70) not null,
    foreign key (app_id) references appointments(app_id)
);

show tables;

insert into patients (name, dob, gender) values
('Rohan Mehta', '1995-03-12', 'M'),
('Aisha Khan', '1998-07-24', 'F'),
('Arjun Patel', '2001-11-15', 'M'),
('Neha Sharma', '1993-06-30', 'F'),
('Vikram Desai', '1988-02-18', 'M'),
('Pooja Iyer', '1999-09-09', 'F'),
('Rahul Nair', '1996-01-05', 'M'),
('Sneha Joshi', '2000-04-22', 'F'),
('Aditya Verma', '1997-10-19', 'M'),
('Kavya Menon', '1995-12-25', 'F'),
('Manish Kumar', '1992-08-13', 'M'),
('Diya Kapoor', '2002-05-28', 'F'),
('Ritesh Bhatia', '1990-03-07', 'M'),
('Priya Reddy', '1994-09-14', 'F'),
('Siddharth Ghosh', '1989-11-01', 'M'),
('Ananya Das', '1996-07-08', 'F'),
('Harshad Jain', '1993-10-03', 'M'),
('Meera Pillai', '2001-02-27', 'F'),
('Karan Singh', '1999-05-16', 'M'),
('Tina D’Souza', '1998-12-11', 'F');


insert into doctors (name, department) values
('Dr. Aarav Patel', 'Cardiology'),
('Dr. Neha Sharma', 'Dermatology'),
('Dr. Rohan Mehta', 'Neurology'),
('Dr. Priya Iyer', 'Orthopedics'),
('Dr. Karan Malhotra', 'Pediatrics'),
('Dr. Sneha Desai', 'Gynecology'),
('Dr. Arjun Singh', 'General Surgery'),
('Dr. Kavita Nair', 'Psychiatry'),
('Dr. Rahul Joshi', 'ENT'),
('Dr. Nisha Kapoor', 'Oncology'),
('Dr. Manav Bansal', 'Urology'),
('Dr. Isha Thomas', 'Ophthalmology'),
('Dr. Aditya Reddy', 'Gastroenterology'),
('Dr. Meera D’Souza', 'Endocrinology'),
('Dr. Varun Khanna', 'Pulmonology'),
('Dr. Ritu Sethi', 'Rheumatology'),
('Dr. Harsh Vora', 'Nephrology'),
('Dr. Simran Kaur', 'Hematology'),
('Dr. Rajesh Menon', 'Emergency'),
('Dr. Aditi Rao', 'Radiology');

insert into appointments (patient_id, doctor_id, app_date) values
(1, 3, '2025-11-01 10:30:00'),
(2, 7, '2025-11-01 11:00:00'),
(3, 1, '2025-11-01 11:15:00'),
(4, 5, '2025-11-02 09:45:00'),
(5, 9, '2025-11-02 10:00:00'),
(6, 2, '2025-11-02 14:00:00'),
(7, 12, '2025-11-02 15:00:00'),
(8, 4, '2025-11-03 09:30:00'),
(9, 6, '2025-11-03 10:00:00'),
(10, 11, '2025-11-03 10:45:00'),
(11, 13, '2025-11-03 13:00:00'),
(12, 8, '2025-11-03 15:15:00'),
(13, 10, '2025-11-04 09:00:00'),
(14, 15, '2025-11-04 09:30:00'),
(15, 16, '2025-11-04 11:45:00'),
(16, 14, '2025-11-04 12:30:00'),
(17, 17, '2025-11-05 10:00:00'),
(18, 18, '2025-11-05 11:00:00'),
(19, 19, '2025-11-05 14:15:00'),
(20, 20, '2025-11-05 15:00:00');

insert into prescriptions (app_id, medicine, dosage_mg) values
(1, 'Paracetamol', '500 mg twice daily for 5 days'),
(2, 'Amoxicillin', '250 mg thrice daily for 7 days'),
(3, 'Ibuprofen', '400 mg twice daily after meals'),
(4, 'Cetrizine', '10 mg once daily at night'),
(5, 'Azithromycin', '500 mg once daily for 3 days'),
(6, 'Pantoprazole', '40 mg once daily before breakfast'),
(7, 'Metformin', '500 mg twice daily with meals'),
(8, 'Losartan', '50 mg once daily in the morning'),
(9, 'Atorvastatin', '10 mg once daily at bedtime'),
(10, 'Levocetirizine', '5 mg once daily at night'),
(11, 'Dolo-650', '650 mg every 6 hours as needed for fever'),
(12, 'Omeprazole', '20 mg once daily before food'),
(13, 'Amoxicillin-Clavulanate', '625 mg twice daily for 5 days'),
(14, 'Diclofenac', '50 mg twice daily for pain relief'),
(15, 'Montelukast', '10 mg once daily at night'),
(16, 'Amlodipine', '5 mg once daily in the morning'),
(17, 'Metoprolol', '50 mg once daily with water'),
(18, 'Ranitidine', '150 mg twice daily before meals'),
(19, 'Dexamethasone', '4 mg once daily for 3 days'),
(20, 'Vitamin D3', '60000 IU once weekly for 8 weeks');
 
 
 show tables;
 select * from appointments;
 select * from doctors;
 select * from patients;
 select * from prescriptions;