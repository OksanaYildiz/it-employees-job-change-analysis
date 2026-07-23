SHOW TABLES;

DESCRIBE mental_health_it_clean;

SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT enrollee_id) AS unique_ids
FROM mental_health_it_clean;

CREATE TABLE employees (
    enrollee_id INT PRIMARY KEY,
    gender TEXT,
    city TEXT,
    city_development_index DOUBLE,
    target DOUBLE
);
CREATE TABLE education_experience (
    enrollee_id INT PRIMARY KEY,
    education_level TEXT,
    major_discipline TEXT,
    experience_years DOUBLE,
    experience_level TEXT,
    FOREIGN KEY (enrollee_id) REFERENCES employees(enrollee_id)
);
CREATE TABLE company (
    enrollee_id INT PRIMARY KEY,
    company_size_group TEXT,
    company_type TEXT,
    relevent_experience TEXT,
    FOREIGN KEY (enrollee_id) REFERENCES employees(enrollee_id)
);
CREATE TABLE training (
    enrollee_id INT PRIMARY KEY,
    training_hours INT,
    training_group TEXT,
    FOREIGN KEY (enrollee_id) REFERENCES employees(enrollee_id)
);

SHOW TABLES;

INSERT INTO employees (
    enrollee_id,
    gender,
    city,
    city_development_index,
    target
)
SELECT
    enrollee_id,
    gender,
    city,
    city_development_index,
    target
FROM mental_health_it_clean;
INSERT INTO education_experience (
    enrollee_id,
    education_level,
    major_discipline,
    experience_years,
    experience_level
)
SELECT
    enrollee_id,
    education_level,
    major_discipline,
    experience_years,
    experience_level
FROM mental_health_it_clean;
INSERT INTO company (
    enrollee_id,
    company_size_group,
    company_type,
    relevent_experience
)
SELECT
    enrollee_id,
    company_size_group,
    company_type,
    relevent_experience
FROM mental_health_it_clean;
INSERT INTO training (
    enrollee_id,
    training_hours,
    training_group
)
SELECT
    enrollee_id,
    training_hours,
    training_group
FROM mental_health_it_clean;

SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM education_experience;
SELECT COUNT(*) FROM company;
SELECT COUNT(*) FROM training;
