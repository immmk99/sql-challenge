-- Data Engineering --

CREATE TABLE employees (
    emp_no INTEGER  NOT NULL ,
    emp_title_id VARCHAR(5)  NOT NULL ,
    birth_date DATE  NOT NULL ,
    first_name VARCHAR(30)  NOT NULL ,
    last_name VARCHAR(30)  NOT NULL ,
    sex VARCHAR(1)  NOT NULL ,
    hire_date DATE  NOT NULL ,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE departments (
    dept_no VARCHAR(5)  NOT NULL,
    dept_name VARCHAR(30)  NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
    )
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(4)  NOT NULL,
    emp_no INTEGER  NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        emp_no, dept_no
    )
);


CREATE TABLE dept_emp (
    emp_no INTEGER  NOT NULL,
    dep_no VARCHAR  NOT NULL, 
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        emp_no, dept_no
    )
);

CREATE TABLE titles (
    title_id VARCHAR  NOT NULL ,
    title VARCHAR  NOT NULL ,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
    )
);

CREATE TABLE salaries (
    emp_no INTEGER  NOT NULL ,
    salary INTEGER  NOT NULL ,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
    )
);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES dept_manager (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title FOREIGN KEY(emp_title)
REFERENCES titles (title_id);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dep_no FOREIGN KEY(dep_no)
REFERENCES departments (dept_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

-- Query * FROM Each Table Confirming Data
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM titles;
SELECT * FROM salaries;