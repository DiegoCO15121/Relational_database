CREATE DATABASE students;

\ c students;

CREATE TABLE students(
    students SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    major_id INT, 
    gpa NUMERIC(2,1)
    
);

CREATE TABLE major(
    major_id SERIAL PRIMARY KEY,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course VARCHAR(100) NOT NULL
);

CREATE TABLE majors_courses(
    major_id INT,
    course_id INT
);

ALTER TABLE students ADD FOREIGN KEY (major_id) REFERENCES majors(major_id); 
ALTER TABLE majors_courses ADD FOREIGN KEY (major_id) REFERENCES majors(major_id);
ALTER TABLE majors_courses ADD FOREIGN KEY (course_id) REFERENCES courses(course_id);

ALTER TABLE majors_courses ADD PRIMARY KEY(major_id,course_id); /* Coposite primary key */