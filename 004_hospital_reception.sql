CREATE TABLE patients (
  patient_id INTEGER NOT NULL,
  patient_name VARCHAR(100),
  id INTEGER,
  birthday DATE,
  PRIMARY KEY (patient_id)
);

CREATE TABLE receptions (
  reception_id INTEGER NOT NULL,
  patient_id INTEGER NOT NULL,
  reception_timestamp TIMESTAMPTZ,
  terminal_number INTEGER,
  accounting_number INTEGER,
  PRIMARY KEY (reception_id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id)
    ON UPDATE RESTRICT
);

CREATE TABLE departments (
  department_id INTEGER NOT NULL,
  department_name VARCHAR(100),
  PRIMARY KEY (department_id)
);

CREATE TABLE doctors (
  doctor_id INTEGER NOT NULL,
  doctor_name VARCHAR(100),
  PRIMARY KEY (doctor_id)
);

CREATE TABLE consultations (
  consultation_id INTEGER NOT NULL,
  consultation_name VARCHAR(100),
  PRIMARY KEY (consultation_id)
);

CREATE TABLE reception_details (
  reception_detail_id INTEGER NOT NULL,
  department_id INTEGER NOT NULL,
  consultation_id INTEGER NOT NULL,
  doctor_id INTEGER NOT NULL,
  reception_id INTEGER NOT NULL,
  consultation_time TIME,
  PRIMARY KEY (reception_detail_id),
  FOREIGN KEY (department_id) REFERENCES departments (department_id)
    ON UPDATE RESTRICT,
  FOREIGN KEY (consultation_id) REFERENCES consultations (consultation_id)
    ON UPDATE RESTRICT,
  FOREIGN KEY (doctor_id) REFERENCES doctors (doctor_id)
    ON UPDATE RESTRICT,
  FOREIGN KEY (reception_id) REFERENCES receptions (reception_id)
    ON UPDATE RESTRICT
);
