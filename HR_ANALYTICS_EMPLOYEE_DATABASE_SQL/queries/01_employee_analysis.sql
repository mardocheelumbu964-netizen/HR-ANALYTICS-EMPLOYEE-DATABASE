USE hr_analytics;

SELECT e.employee_id,CONCAT(e.first_name,' ',e.last_name) AS employee_name,
d.department_name,p.position_name,e.salary,e.hire_date
FROM employees e JOIN departments d ON e.department_id=d.department_id
JOIN positions p ON e.position_id=p.position_id;

SELECT * FROM employees ORDER BY salary DESC;

SELECT d.department_name,COUNT(e.employee_id) AS employee_count,ROUND(AVG(e.salary),2) AS avg_salary
FROM departments d LEFT JOIN employees e ON d.department_id=e.department_id
GROUP BY d.department_id,d.department_name ORDER BY avg_salary DESC;

SELECT d.department_name,SUM(e.salary) AS salary_cost
FROM departments d JOIN employees e ON d.department_id=e.department_id
GROUP BY d.department_id,d.department_name ORDER BY salary_cost DESC;

SELECT e.employee_id,CONCAT(e.first_name,' ',e.last_name) AS employee_name,e.salary
FROM employees e WHERE e.salary>(SELECT AVG(salary) FROM employees);

SELECT e.employee_id,CONCAT(e.first_name,' ',e.last_name) AS employee_name,
d.department_name,e.salary,
RANK() OVER(PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_rank
FROM employees e JOIN departments d ON e.department_id=d.department_id;
