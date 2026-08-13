USE hr_analytics;

CREATE TABLE departments(
 department_id INT AUTO_INCREMENT PRIMARY KEY,
 department_name VARCHAR(100) NOT NULL UNIQUE,
 location VARCHAR(100)
);

CREATE TABLE positions(
 position_id INT AUTO_INCREMENT PRIMARY KEY,
 position_name VARCHAR(100) NOT NULL,
 level_name VARCHAR(50)
);

CREATE TABLE employees(
 employee_id INT AUTO_INCREMENT PRIMARY KEY,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 email VARCHAR(120) UNIQUE NOT NULL,
 gender VARCHAR(20),
 hire_date DATE NOT NULL,
 department_id INT NOT NULL,
 position_id INT NOT NULL,
 manager_id INT NULL,
 salary DECIMAL(12,2) NOT NULL,
 employment_status VARCHAR(30) DEFAULT 'Active',
 FOREIGN KEY(department_id) REFERENCES departments(department_id),
 FOREIGN KEY(position_id) REFERENCES positions(position_id),
 FOREIGN KEY(manager_id) REFERENCES employees(employee_id)
);

CREATE TABLE attendance(
 attendance_id INT AUTO_INCREMENT PRIMARY KEY,
 employee_id INT NOT NULL,
 attendance_date DATE NOT NULL,
 status VARCHAR(20) NOT NULL,
 hours_worked DECIMAL(5,2) DEFAULT 0,
 FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE leave_requests(
 leave_id INT AUTO_INCREMENT PRIMARY KEY,
 employee_id INT NOT NULL,
 leave_type VARCHAR(40),
 start_date DATE,
 end_date DATE,
 days_count INT,
 leave_status VARCHAR(20) DEFAULT 'Approved',
 FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE performance_reviews(
 review_id INT AUTO_INCREMENT PRIMARY KEY,
 employee_id INT NOT NULL,
 review_date DATE,
 rating DECIMAL(4,2),
 performance_level VARCHAR(30),
 comments VARCHAR(500),
 FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE skills(
 skill_id INT AUTO_INCREMENT PRIMARY KEY,
 skill_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE employee_skills(
 employee_id INT NOT NULL,
 skill_id INT NOT NULL,
 proficiency VARCHAR(30),
 PRIMARY KEY(employee_id,skill_id),
 FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
 FOREIGN KEY(skill_id) REFERENCES skills(skill_id)
);

CREATE TABLE projects(
 project_id INT AUTO_INCREMENT PRIMARY KEY,
 project_name VARCHAR(150) NOT NULL,
 client_name VARCHAR(150),
 start_date DATE,
 end_date DATE,
 budget DECIMAL(14,2),
 project_status VARCHAR(30)
);

CREATE TABLE project_assignments(
 assignment_id INT AUTO_INCREMENT PRIMARY KEY,
 project_id INT NOT NULL,
 employee_id INT NOT NULL,
 assigned_date DATE,
 role_name VARCHAR(100),
 allocation_percent INT,
 FOREIGN KEY(project_id) REFERENCES projects(project_id),
 FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);
