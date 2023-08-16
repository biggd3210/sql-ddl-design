
DROP DATABASE IF EXISTS medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db

-- *******  departments TABLE --
CREATE TABLE departments
(
 "id" SERIAL PRIMARY KEY,
 name TEXT NOT NULL,
 code TEXT NOT NULL
);

-- add records to departments --

INSERT INTO departments
    (name, code)
  VALUES
    ('Hematology', 'hemo'),
    ('Cardiology', 'card'),
    ('RADIOLOGY', 'radi'),
    ('Pediatrics', 'pedi'),
    ('Nephrology', 'neph');

-- ********** doctors

CREATE TABLE doctors
(
 id SERIAL PRIMARY KEY,
 first_name TEXT NOT NULL,
 last_name  TEXT NOT NULL,
 cert_level TEXT NOT NULL,
 department INTEGER REFERENCES departments
);


-- add records for doctors --

INSERT INTO doctors 
    (first_name, last_name, cert_level, department)
    VALUES
    ('Laury', 'Smith', 'md', 1),
    ('Lilith', 'Madoc', 'np', 3),
    ('Gerome', 'Gustain', 'lp', 4);



-- ************************************** patients

CREATE TABLE patients
(
 id SERIAL PRIMARY KEY,
 first_name TEXT NOT NULL,
 last_name TEXT NOT NULL,
 birthdate DATE NOT NULL,
 date_seen DATE NOT NULL,
 has_diagnosis BOOLEAN DEFAULT False
);

-- CREATE INDEX FK_1 ON patients
-- (
--  id_1
-- );

-- insert into patients --

INSERT INTO patients (first_name, last_name, birthdate, date_seen, has_diagnosis)
VALUES
('Rosco', 'Smith', '2000-12-12', '2020-8-8', False),
('John', 'Zaro', '2001-10-12', '2023-7-2', True),
('Colt', 'Rhys', '1992-6-1', '2023-8-1', TRUE);

-- ************************************** diagnoses

CREATE TABLE diagnoses
(
 id SERIAL PRIMARY KEY,
 name        TEXT NOT NULL,
 description TEXT NOT NULL,
 department  INTEGER REFERENCES departments
);

-- CREATE INDEX FK_1 ON diagnoses
-- (
--  id_1
-- );

-- insert records into diagnoses --

INSERT INTO diagnoses (name, description)
VALUES
('Influenza A', 'very bad. don''t get it.'),
('Covid', 'Also bad. do not contract.');

-- ************************************** department_roster

CREATE TABLE department_roster
(
 department INTEGER REFERENCES departments ON DELETE SET NULL,
 doctor INTEGER REFERENCES doctors ON DELETE CASCADE
);

INSERT INTO department_roster (department, doctor)
VALUES (1,2), (2,1), (4,3), (5,3);

-- ************************************** patient_doctors

CREATE TABLE patient_doctors
(
 patient INTEGER REFERENCES patients ON DELETE CASCADE,
 doctor INTEGER REFERENCES doctors
);

--insert into patient_doctors--
INSERT INTO patient_doctors (patient, doctor)
VALUES (3,2), (2,1), (3,3), (1,2);

-- ************************************** patient_diagnosis

CREATE TABLE patient_diagnosis
(
 id SERIAL PRIMARY KEY,
 patient INTEGER REFERENCES patients,
 diagnosis INTEGER REFERENCES diagnoses
);

--insert records for patient_diagnosis--
INSERT INTO patient_diagnosis (patient, diagnosis)
VALUES (3,1), (2,2);