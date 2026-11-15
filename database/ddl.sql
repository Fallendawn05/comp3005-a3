-- Creates the students table (drops it first for easy re-runs)
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id       SERIAL PRIMARY KEY,
    first_name       TEXT NOT NULL,
    last_name        TEXT NOT NULL,
    email            TEXT NOT NULL UNIQUE,
    enrollment_date  DATE
);
