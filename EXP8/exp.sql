DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    class INT
);


DO $$
BEGIN
    INSERT INTO students(name, age, class) VALUES ('Himanshu', 20, 10);
    INSERT INTO students(name, age, class) VALUES ('Shubhash', 20, 10);
    INSERT INTO students(name, age, class) VALUES ('Amrit', 21, 11);
    RAISE NOTICE 'Transaction Successfully Done';
END;
$$;

SELECT * FROM students;

BEGIN; -- start transaction
SAVEPOINT sp1;
INSERT INTO students(name, age, class) VALUES ('Mandeep',16,8);
SAVEPOINT sp2;
-- Try an invalid insert (will fail)
INSERT INTO students(name, age, class) VALUES ('Rahul','wrong',9);
-- Rollback only the failed one
ROLLBACK TO SAVEPOINT sp2;
-- Continue with valid data
INSERT INTO students(name, age, class) VALUES ('Naam ki kami ho gyi hai',17,10);
ROLLBACK;

SELECT * FROM students;
