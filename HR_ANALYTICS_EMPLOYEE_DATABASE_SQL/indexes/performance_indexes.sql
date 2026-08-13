USE hr_analytics;

CREATE INDEX idx_employee_department ON employees(department_id);
CREATE INDEX idx_employee_salary ON employees(salary);
CREATE INDEX idx_attendance_employee_date ON attendance(employee_id,attendance_date);
CREATE INDEX idx_leave_employee_status ON leave_requests(employee_id,leave_status);
CREATE INDEX idx_performance_employee ON performance_reviews(employee_id);
CREATE INDEX idx_assignment_project_employee ON project_assignments(project_id,employee_id);
