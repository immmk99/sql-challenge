-- Data Engineering --
-- Drop Tables if Existing 

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE "employees" (
    "emp_no" INTEGER  NOT NULL ,
    "emp_title" VARCHART  NOT NULL ,
    "birth_date" DATE  NOT NULL ,
    "first_name" VARCHAR  NOT NULL ,
    "last_name" VARCHAR  NOT NULL ,
    "sex" CHAR  NOT NULL ,
    "hire_date" DATE  NOT NULL ,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
    )
)

GO

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR  NOT NULL ,
    "emp_no" INTEGER  NOT NULL ,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no", "dept_no"
    )
)

GO

CREATE TABLE "departments" (
    "dept_no" VARCHAR  NOT NULL ,
    "dept_name" VARCHAR  NOT NULL ,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
    )
)

GO

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER  NOT NULL ,
    "dep_no" VARCHAR  NOT NULL , 
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no", "dept_no"
    )
)

GO

CREATE TABLE "titles" (
    "title_id" VARCHAR  NOT NULL ,
    "title" VARCHAR  NOT NULL ,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
    )
)

GO

CREATE TABLE "salaries" (
    "emp_no" INTEGER  NOT NULL ,
    "salary" INTEGER  NOT NULL ,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
    )
)

GO

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_manager" ("emp_no")
GO

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id")
GO

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no")
GO

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no")
GO

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dep_no" FOREIGN KEY("dep_no")
REFERENCES "departments" ("dept_no")
GO

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no")
GO

-- Query * FROM Each Table Confirming Data
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM titles;
SELECT * FROM salaries;