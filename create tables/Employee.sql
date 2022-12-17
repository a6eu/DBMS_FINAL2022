CREATE TABLE employees (
    employee_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone_number TEXT,
    job_title TEXT,
    department_id INTEGER,
    foreign key (department_id) references departments (department_id)
);

drop table if exists employees;