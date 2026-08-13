USE hr_analytics;

CREATE OR REPLACE VIEW vw_employee_directory AS
SELECT e.employee_id,CONCAT(e.first_name,' ',e.last_name) AS employee_name,
e.email,d.department_name,p.position_name,e.salary,e.hire_date,e.employment_status
FROM employees e JOIN departments d ON e.department_id=d.department_id
JOIN positions p ON e.position_id=p.position_id;

CREATE OR REPLACE VIEW vw_department_kpi AS
SELECT d.department_id,d.department_name,COUNT(e.employee_id) AS employee_count,
ROUND(AVG(e.salary),2) AS average_salary,COALESCE(SUM(e.salary),0) AS salary_cost
FROM departments d LEFT JOIN employees e ON d.department_id=e.department_id
GROUP BY d.department_id,d.department_name;

CREATE OR REPLACE VIEW vw_employee_performance AS
SELECT e.employee_id,CONCAT(e.first_name,' ',e.last_name) AS employee_name,
d.department_name,pr.rating,pr.performance_level
FROM employees e JOIN departments d ON e.department_id=d.department_id
JOIN performance_reviews pr ON e.employee_id=pr.employee_id;
