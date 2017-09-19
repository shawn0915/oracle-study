/*
merge
 */

MERGE INTO emp e USING new_emp n
ON (e.emp_id = n.emp_id)
WHEN matched THEN
UPDATE set e.salary = n.salary
WHEN NOT matched THEN
INSERT (emp_id, last_time, salary)
VALUES (n.emp_id, n.last_time, n.salary);