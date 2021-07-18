DROP DATABASE medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    insurance TEXT,
    birthday DATE NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INT NOT NULL REFERENCES doctors (id),
    patient_id INT NOT NULL REFERENCES patients (id),
    visit_date DATE NOT NULL
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INT NOT NULL REFERENCES visits (id),
    disease_id INT NOT NULL REFERENCES diseases (id)
);

-- INSERT INTO doctors (name, specialty)
-- VALUES
-- ('Dr. Sing', 'podiatry'),
-- ('Dr. Billy', 'neurology');

-- INSERT INTO patients (name, insurance, birthday)
-- VALUES
-- ('The Wizard of Oz', 'Aetna', '1576-10-10'),
-- ('Spongebob Squarepants', 'EmblemHealth', '2001-11-11');

-- INSERT INTO visits (doctor_id, patient_id, visit_date)
-- VALUES
-- (1, 2, '2020-10-10');