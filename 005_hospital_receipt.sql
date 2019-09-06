CREATE TABLE insurance_categories (
  insurance_category_id       INTEGER NOT NULL,
  insurance_category_name     VARCHAR(100),
  self_pay_ratio              INTEGER,
  PRIMARY KEY (insurance_category_id)
);

CREATE TABLE patients (
  patient_id                  INTEGER NOT NULL,
  insurance_category_id       INTEGER NOT NULL,
  patient_number              INTEGER,
  patient_name                VARCHAR(100),
  PRIMARY KEY (patient_id),
  FOREIGN KEY (insurance_category_id) REFERENCES insurance_categories (insurance_category_id)
);

CREATE TABLE departments (
  department_id               INTEGER NOT NULL,
  department_name             VARCHAR(100),
  PRIMARY KEY (department_id)
);

CREATE TABLE billing_item_categories (
  billing_item_category_id    INTEGER NOT NULL,
  billing_item_category_name  VARCHAR(100),
  PRIMARY KEY (billing_item_category_id)
);

CREATE TABLE billing_items (
  billing_item_id             INTEGER NOT NULL,
  billing_item_category_id    INTEGER NOT NULL,
  billing_item_name           VARCHAR(100),
  PRIMARY KEY (billing_item_id),
  FOREIGN KEY (billing_item_category_id) REFERENCES billing_item_categories (billing_item_category_id)
);

CREATE TABLE terminals (
  terminal_id                 INTEGER NOT NULL,
  terminal_number             INTEGER,
  PRIMARY KEY (terminal_id)
);

CREATE TABLE billing (
  billing_id                  INTEGER NOT NULL,
  patient_id                  INTEGER NOT NULL,
  department_id               INTEGER NOT NULL,
  terminal_id                 INTEGER NOT NULL,
  out_or_in_patient           VARCHAR(100),
  accounting_number           INTEGER,
  issued_date                 DATE,
  billing_start_date          DATE,
  billing_end_date            DATE,
  tax                         MONEY,
  note                        TEXT,
  PRIMARY KEY (billing_id),
  FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
  FOREIGN KEY (department_id) REFERENCES departments (department_id),
  FOREIGN KEY (terminal_id) REFERENCES terminals (terminal_id)
);

CREATE TABLE billing_details (
  billing_detail_id           INTEGER NOT NULL,
  billing_id                  INTEGER NOT NULL,
  billing_item_id             INTEGER NOT NULL,
  points                      INTEGER,
  insurance                   MONEY,
  self_pay                    MONEY,
  PRIMARY KEY (billing_detail_id),
  FOREIGN KEY (billing_id) REFERENCES billing (billing_id),
  FOREIGN KEY (billing_item_id) REFERENCES billing_items (billing_item_id)
);
