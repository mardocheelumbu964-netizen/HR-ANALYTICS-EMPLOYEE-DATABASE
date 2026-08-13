USE hr_analytics;

CREATE TABLE IF NOT EXISTS salary_audit(
 audit_id INT AUTO_INCREMENT PRIMARY KEY,
 employee_id INT,
 old_salary DECIMAL(12,2),
 new_salary DECIMAL(12,2),
 changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS trg_salary_audit;

DELIMITER //
CREATE TRIGGER trg_salary_audit
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
 IF OLD.salary<>NEW.salary THEN
  INSERT INTO salary_audit(employee_id,old_salary,new_salary)
  VALUES(OLD.employee_id,OLD.salary,NEW.salary);
 END IF;
END //
DELIMITER ;
