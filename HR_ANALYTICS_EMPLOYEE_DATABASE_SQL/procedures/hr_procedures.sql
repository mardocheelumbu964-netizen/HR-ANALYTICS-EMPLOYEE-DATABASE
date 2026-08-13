USE hr_analytics;

DROP PROCEDURE IF EXISTS GetEmployeeDetails;
DROP PROCEDURE IF EXISTS GetDepartmentEmployees;
DROP PROCEDURE IF EXISTS GetSalaryRange;

DELIMITER //

CREATE PROCEDURE GetEmployeeDetails(IN p_employee_id INT)
BEGIN
 SELECT e.employee_id,CONCAT(e.first_name,' ',e.last_name) AS employee_name,
 d.department_name,p.position_name,e.salary,e.hire_date
 FROM employees e JOIN departments d ON e.department_id=d.department_id
 JOIN positions p ON e.position_id=p.position_id
 WHERE e.employee_id=p_employee_id;
END //

CREATE PROCEDURE GetDepartmentEmployees(IN p_department_id INT)
BEGIN
 SELECT employee_id,CONCAT(first_name,' ',last_name) AS employee_name,salary
 FROM employees WHERE department_id=p_department_id ORDER BY salary DESC;
END //

CREATE PROCEDURE GetSalaryRange(IN p_min_salary DECIMAL(12,2),IN p_max_salary DECIMAL(12,2))
BEGIN
 SELECT employee_id,CONCAT(first_name,' ',last_name) AS employee_name,salary
 FROM employees WHERE salary BETWEEN p_min_salary AND p_max_salary ORDER BY salary DESC;
END //

DELIMITER ;
