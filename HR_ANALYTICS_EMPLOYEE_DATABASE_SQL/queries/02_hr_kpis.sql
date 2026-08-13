USE hr_analytics;

SELECT COUNT(*) AS total_employees FROM employees;

SELECT COUNT(*) AS active_employees FROM employees WHERE employment_status='Active';

SELECT ROUND(AVG(salary),2) AS average_salary FROM employees;

SELECT MIN(salary) AS minimum_salary,MAX(salary) AS maximum_salary FROM employees;

SELECT gender,COUNT(*) AS employee_count FROM employees GROUP BY gender;

SELECT YEAR(hire_date) AS hire_year,COUNT(*) AS hires
FROM employees GROUP BY YEAR(hire_date) ORDER BY hire_year;

SELECT
 COUNT(*) AS total_records,
 SUM(status='Present') AS present_count,
 SUM(status='Absent') AS absent_count,
 SUM(status='Late') AS late_count
FROM attendance;

SELECT ROUND(100*SUM(status='Present')/COUNT(*),2) AS attendance_rate
FROM attendance;

SELECT SUM(days_count) AS approved_leave_days
FROM leave_requests WHERE leave_status='Approved';

SELECT performance_level,COUNT(*) AS employees,ROUND(AVG(rating),2) AS avg_rating
FROM performance_reviews GROUP BY performance_level ORDER BY avg_rating DESC;
