CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100)    NOT NULL,
    email       VARCHAR(150)    NOT NULL UNIQUE,
    department  VARCHAR(80)     NOT NULL,
    position    VARCHAR(80)     NOT NULL,
    salary      DECIMAL(12, 2)  NOT NULL DEFAULT 0.00,
    hire_date   DATE            NOT NULL,
    status      ENUM('ACTIVE','INACTIVE','ON_LEAVE') NOT NULL DEFAULT 'ACTIVE',
    created_at  TIMESTAMP       DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO employees (name, email, department, position, salary, hire_date, status) VALUES
('Alice Johnson',    'alice.johnson@corp.com',   'Engineering',  'Senior Developer',     95000.00, '2021-03-15', 'ACTIVE'),
('Bob Martinez',     'bob.martinez@corp.com',    'Engineering',  'DevOps Engineer',      88000.00, '2020-07-01', 'ACTIVE'),
('Carol Smith',      'carol.smith@corp.com',     'Marketing',    'Marketing Manager',    82000.00, '2019-11-20', 'ACTIVE'),
('David Lee',        'david.lee@corp.com',       'HR',           'HR Specialist',        70000.00, '2022-01-10', 'ACTIVE'),
('Eva Chen',         'eva.chen@corp.com',        'Engineering',  'Junior Developer',     65000.00, '2023-06-01', 'ACTIVE'),
('Frank Wilson',     'frank.wilson@corp.com',    'Finance',      'Financial Analyst',    78000.00, '2020-04-12', 'INACTIVE'),
('Grace Kim',        'grace.kim@corp.com',       'Design',       'UI/UX Designer',       80000.00, '2021-09-05', 'ACTIVE'),
('Henry Brown',      'henry.brown@corp.com',     'Marketing',    'Content Strategist',   72000.00, '2022-08-17', 'ON_LEAVE');

CREATE OR REPLACE VIEW dept_summary AS
SELECT
    department,
    COUNT(*)                        AS total_employees,
    SUM(CASE WHEN status = 'ACTIVE' THEN 1 ELSE 0 END) AS active_count,
    ROUND(AVG(salary), 2)           AS avg_salary,
    MAX(salary)                     AS max_salary,
    MIN(salary)                     AS min_salary
FROM employees
GROUP BY department;

SELECT 'Employees loaded:' AS info, COUNT(*) AS count FROM employees;
SELECT * FROM dept_summary;