-- --------------------------------< Jadval O'chirish >-------------------------------

DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS projects;

-- --------------------------------< Jadval Yaratish >-------------------------------

CREATE TABLE IF NOT EXISTS departments(
	dep_id SERIAL PRIMARY KEY,
	dep_name VARCHAR(50)NOT NULL
);


CREATE TABLE IF NOT EXISTS employees(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25),
	emp_position VARCHAR(50),
	emp_salary NUMERIC(7, 2),
	hire_date DATE DEFAULT NULL,
	dep_id INTEGER REFERENCES departments(dep_id)
);

CREATE TABLE IF NOT EXISTS projects(
	pro_id SERIAL PRIMARY KEY,
	pro_name VARCHAR(50) NOT NULL,
	start_date DATE,
	end_date DATE,
	budget NUMERIC(10, 2)
);

-- --------------------------------< Malumot kiritish >-------------------------------

INSERT INTO departments(dep_name) VALUES
('Administration'),
('IT'),
('Design');

INSERT INTO employees(first_name, last_name, emp_position, emp_salary, hire_date, dep_id) VALUES
('Ali', 'Karimov', 'Manager', 3000, '2020-03-15', 1),
('Nodira', 'Toirova', 'Developer', 2500, '2021-05-10', 2),
('Shoxruh', 'Abdullayev', 'Designer', 2200, '2022-01-22', 3),
('Zarina', 'Abdullayeva', 'HR Specialist', 1800, '2019-11-11', 1),
('Jasur', 'Aliyev', 'Developer', 2400, '2023-02-01', 2);

INSERT INTO projects(pro_name, start_date, end_date, budget) VALUES
('New Website', '2023-01-10', '2023-06-30', 50000),
('CRM System', '2024-02-01', '2023-09-12', 60000),
('Mobile App', '2022-08-15', '2023-03-20', 30000);

-- --------------------------------< Jadvani Chiqarish >-------------------------------

SELECT first_name ||' '|| last_name as full_name, emp_position, emp_salary, hire_date, dep_name FROM employees 
JOIN departments on employees.dep_id = departments.dep_id;

SELECT first_name ||' '|| last_name, emp_salary FROM employees
ORDER BY emp_salary DESC;

SELECT first_name ||' '|| last_name, emp_salary FROM employees
WHERE emp_salary >= 2500;

SELECT first_name ||' '|| last_name, emp_salary FROM employees
ORDER BY emp_salary DESC LIMIT 3;

SELECT first_name ||' '|| last_name, emp_salary FROM employees
WHERE emp_salary IN (2400, 3000);

SELECT first_name ||' '|| last_name, emp_salary FROM employees
WHERE emp_salary BETWEEN 2000 AND 3000;

SELECT first_name ||' '|| last_name, emp_salary FROM employees
WHERE first_name LIKE 'A%';

SELECT * FROM projects
WHERE end_date IS NULL;

SELECT AVG(emp_salary) FROM employees;


