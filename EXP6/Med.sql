-- 1. Create the table
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    gender VARCHAR(10)
);

-- 2. Insert sample data
INSERT INTO employees (emp_name, gender) VALUES
('Himanshu Gupta', 'M'),
('Jaskirat Singh', 'M'),
('Devjot Singh', 'M'),
('Kashish Mittal', 'F'),
('Dhruv Jadoo', 'M'),
('Hemant Narain', 'M');

-- 3. Create the procedure
CREATE OR REPLACE PROCEDURE count_employees_by_gender(
    IN input_gender VARCHAR,
    OUT total_count INT
)
LANGUAGE plpgsql AS $$
BEGIN
    SELECT COUNT(*) INTO total_count
    FROM employees
    WHERE gender = input_gender;
END;
$$;

-- 4. Call the procedure
DO $$
DECLARE
    result INT;
BEGIN
    CALL count_employees_by_gender('M', result);
    RAISE NOTICE 'TOTAL EMPLOYEES OF GENDER M ARE %', result;
END;
$$;

select * from employees
