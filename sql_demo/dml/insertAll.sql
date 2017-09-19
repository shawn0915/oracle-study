/*
insert all
一条insert语句插入多张表
 */
INSERT all
WHEN 1=1 THEN
INTO emp_no_name (dept_id, job_id)
VALUES (dept_id, job_id)
WHEN dept_id <> 80 THEN
INTO emp_non_sales (emp_id, dept_id)
VALUES (emp_id, dept_id)
WHEN dept_id = 80 THEN
INTO emp_sales (emp_id, dept_id)
VALUES (emp_id, dept_id)
SELECT
  emp_id,
  dept_id,
  job_id
FROM emp
WHERE hire_date > sysdate - 30;