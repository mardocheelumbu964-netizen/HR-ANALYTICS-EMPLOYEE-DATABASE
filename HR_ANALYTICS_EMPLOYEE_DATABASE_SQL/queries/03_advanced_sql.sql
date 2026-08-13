USE hr_analytics;

WITH dept_salary AS (
 SELECT department_id,AVG(salary) AS avg_salary
 FROM employees GROUP BY department_id
)
SELECT d.department_name,ROUND(ds.avg_salary,2) AS avg_salary
FROM dept_salary ds JOIN departments d ON ds.department_id=d.department_id
ORDER BY avg_salary DESC;

WITH ranked AS (
 SELECT e.*,ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) AS rn
 FROM employees e
)
SELECT r.employee_id,CONCAT(r.first_name,' ',r.last_name) AS employee_name,
d.department_name,r.salary
FROM ranked r JOIN departments d ON r.department_id=d.department_id
WHERE r.rn<=2;

SELECT e.employee_id,CONCAT(e.first_name,' ',e.last_name) AS employee_name,
COALESCE(SUM(l.days_count),0) AS leave_days,
CASE WHEN COALESCE(SUM(l.days_count),0)>=5 THEN 'High Leave'
WHEN COALESCE(SUM(l.days_count),0)>=2 THEN 'Medium Leave'
ELSE 'Low Leave' END AS leave_category
FROM employees e LEFT JOIN leave_requests l
ON e.employee_id=l.employee_id AND l.leave_status='Approved'
GROUP BY e.employee_id,employee_name ORDER BY leave_days DESC;

SELECT s.skill_name,COUNT(es.employee_id) AS employee_count
FROM skills s LEFT JOIN employee_skills es ON s.skill_id=es.skill_id
GROUP BY s.skill_id,s.skill_name ORDER BY employee_count DESC;

SELECT p.project_name,SUM(pa.allocation_percent) AS total_allocation,
COUNT(pa.employee_id) AS team_size,p.budget,p.project_status
FROM projects p LEFT JOIN project_assignments pa ON p.project_id=pa.project_id
GROUP BY p.project_id,p.project_name,p.budget,p.project_status;

SELECT e.employee_id,CONCAT(e.first_name,' ',e.last_name) AS employee_name,
pr.rating,RANK() OVER(ORDER BY pr.rating DESC) AS performance_rank
FROM employees e JOIN performance_reviews pr ON e.employee_id=pr.employee_id
ORDER BY performance_rank;

SELECT d.department_name,ROUND(AVG(pr.rating),2) AS average_performance
FROM departments d JOIN employees e ON d.department_id=e.department_id
JOIN performance_reviews pr ON e.employee_id=pr.employee_id
GROUP BY d.department_id,d.department_name ORDER BY average_performance DESC;
