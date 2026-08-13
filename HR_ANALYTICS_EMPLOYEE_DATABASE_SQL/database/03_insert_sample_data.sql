USE hr_analytics;

INSERT INTO departments(department_name,location) VALUES
('IT','Bangalore'),('HR','Bangalore'),('Finance','Mumbai'),
('Sales','Delhi'),('Marketing','Bangalore'),('Operations','Hyderabad');

INSERT INTO positions(position_name,level_name) VALUES
('Software Engineer','Junior'),('Senior Software Engineer','Senior'),
('HR Executive','Junior'),('HR Manager','Manager'),('Accountant','Junior'),
('Finance Manager','Manager'),('Sales Executive','Junior'),('Sales Manager','Manager'),
('Marketing Executive','Junior'),('Operations Manager','Manager');

INSERT INTO employees(first_name,last_name,email,gender,hire_date,department_id,position_id,manager_id,salary) VALUES
('Arun','Kumar','arun.hr@gmail.com','Male','2022-01-10',1,2,NULL,85000),
('Priya','Sharma','priya.hr@gmail.com','Female','2023-02-15',2,4,NULL,72000),
('Rahul','Verma','rahul.hr@gmail.com','Male','2021-03-20',3,6,NULL,90000),
('Sneha','Patel','sneha.hr@gmail.com','Female','2022-04-12',4,8,NULL,78000),
('Vikram','Rao','vikram.hr@gmail.com','Male','2023-05-18',5,9,NULL,52000),
('Anjali','Mehta','anjali.hr@gmail.com','Female','2024-06-05',6,10,NULL,68000),
('David','Wilson','david.hr@gmail.com','Male','2024-01-21',1,1,1,55000),
('Sarah','Johnson','sarah.hr@gmail.com','Female','2024-02-09',1,1,1,58000),
('Daniel','Lee','daniel.hr@gmail.com','Male','2023-09-14',2,3,2,42000),
('Olivia','White','olivia.hr@gmail.com','Female','2024-10-01',3,5,3,47000),
('James','Hall','james.hr@gmail.com','Male','2022-10-18',4,7,4,45000),
('Sophia','Allen','sophia.hr@gmail.com','Female','2024-11-07',5,9,5,41000),
('Michael','Brown','michael.hr@gmail.com','Male','2023-11-22',6,10,6,46000),
('Emily','Davis','emily.hr@gmail.com','Female','2025-01-03',1,1,1,50000),
('John','Smith','john.hr@gmail.com','Male','2025-01-20',4,7,4,43000);

INSERT INTO attendance(employee_id,attendance_date,status,hours_worked) VALUES
(1,'2026-08-01','Present',8),(2,'2026-08-01','Present',8),(3,'2026-08-01','Present',9),
(4,'2026-08-01','Present',8),(5,'2026-08-01','Absent',0),(6,'2026-08-01','Present',8),
(7,'2026-08-01','Present',8),(8,'2026-08-01','Late',7),(9,'2026-08-01','Present',8),
(10,'2026-08-01','Present',8),(11,'2026-08-01','Present',8),(12,'2026-08-01','Present',8),
(13,'2026-08-01','Present',8),(14,'2026-08-01','Present',8),(15,'2026-08-01','Late',7),
(1,'2026-08-02','Present',8),(2,'2026-08-02','Present',8),(3,'2026-08-02','Present',8),
(4,'2026-08-02','Late',7),(5,'2026-08-02','Present',8),(6,'2026-08-02','Present',8),
(7,'2026-08-02','Present',8),(8,'2026-08-02','Present',8),(9,'2026-08-02','Present',8),
(10,'2026-08-02','Absent',0),(11,'2026-08-02','Present',8),(12,'2026-08-02','Present',8),
(13,'2026-08-02','Present',8),(14,'2026-08-02','Present',8),(15,'2026-08-02','Present',8);

INSERT INTO leave_requests(employee_id,leave_type,start_date,end_date,days_count,leave_status) VALUES
(5,'Sick','2026-07-10','2026-07-11',2,'Approved'),
(8,'Casual','2026-07-15','2026-07-16',2,'Approved'),
(10,'Annual','2026-07-20','2026-07-24',5,'Approved'),
(12,'Sick','2026-08-05','2026-08-06',2,'Approved'),
(15,'Casual','2026-08-08','2026-08-08',1,'Pending'),
(7,'Annual','2026-06-10','2026-06-12',3,'Approved');

INSERT INTO performance_reviews(employee_id,review_date,rating,performance_level,comments) VALUES
(1,'2026-06-30',4.8,'Excellent','Strong leadership'),
(2,'2026-06-30',4.5,'Excellent','Excellent HR management'),
(3,'2026-06-30',4.7,'Excellent','Strong financial control'),
(4,'2026-06-30',4.2,'Very Good','Good sales performance'),
(5,'2026-06-30',4.0,'Very Good','Good campaign execution'),
(6,'2026-06-30',4.1,'Very Good','Reliable operations'),
(7,'2026-06-30',4.6,'Excellent','Strong technical skills'),
(8,'2026-06-30',3.8,'Good','Needs improvement in punctuality'),
(9,'2026-06-30',4.0,'Very Good','Good HR support'),
(10,'2026-06-30',3.7,'Good','Improving finance skills'),
(11,'2026-06-30',4.3,'Very Good','Strong sales results'),
(12,'2026-06-30',3.9,'Good','Good creativity'),
(13,'2026-06-30',4.4,'Very Good','Reliable operations'),
(14,'2026-06-30',4.5,'Excellent','Fast learner'),
(15,'2026-06-30',4.1,'Very Good','Good client handling');

INSERT INTO skills(skill_name) VALUES
('SQL'),('Python'),('Java'),('Excel'),('Leadership'),('Communication'),
('Data Analysis'),('Project Management'),('Marketing'),('Finance');

INSERT INTO employee_skills(employee_id,skill_id,proficiency) VALUES
(1,1,'Expert'),(1,2,'Advanced'),(1,5,'Expert'),
(2,4,'Advanced'),(2,5,'Expert'),(2,6,'Expert'),
(3,4,'Expert'),(3,10,'Expert'),(4,6,'Expert'),
(4,8,'Advanced'),(5,9,'Advanced'),(6,8,'Expert'),
(7,1,'Expert'),(7,2,'Advanced'),(7,7,'Advanced'),
(8,1,'Advanced'),(8,2,'Intermediate'),(9,4,'Advanced'),
(10,10,'Advanced'),(11,6,'Advanced'),(12,9,'Expert'),
(13,8,'Advanced'),(14,1,'Advanced'),(14,7,'Expert'),
(15,6,'Advanced');

INSERT INTO projects(project_name,client_name,start_date,end_date,budget,project_status) VALUES
('ERP Modernization','ABC Corp','2026-01-10','2026-06-30',1500000,'Completed'),
('Data Analytics Platform','XYZ Ltd','2026-02-01','2026-09-30',2200000,'Active'),
('Digital Marketing Campaign','MarketPro','2026-03-15','2026-07-31',800000,'Completed'),
('Operations Automation','Global Industries','2026-04-01','2026-12-31',1800000,'Active');

INSERT INTO project_assignments(project_id,employee_id,assigned_date,role_name,allocation_percent) VALUES
(1,1,'2026-01-10','Project Manager',100),(1,7,'2026-01-10','Developer',80),
(1,8,'2026-01-10','Developer',80),(2,1,'2026-02-01','Project Manager',50),
(2,14,'2026-02-01','Data Analyst',80),(2,7,'2026-02-01','Developer',60),
(2,8,'2026-02-01','Developer',60),(3,5,'2026-03-15','Marketing Lead',100),
(3,12,'2026-03-15','Marketing Executive',80),(4,6,'2026-04-01','Project Manager',100),
(4,13,'2026-04-01','Operations Specialist',80),(4,15,'2026-04-01','Operations Executive',70);
