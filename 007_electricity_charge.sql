CREATE TABLE fuel_expenses (
  fuel_expense_id         INTEGER NOT NULL,
  months                  VARCHAR(100),
  expense                 INTEGER,
  PRIMARY KEY (fuel_expense_id)
);

CREATE TABLE blocks (
  block_id                INTEGER NOT NULL,
  user_number             INTEGER,
  PRIMARY KEY (block_id)
);

CREATE TABLE users (
  user_id                 INTEGER NOT NULL,
  block_id                INTEGER NOT NULL,
  user_name               VARCHAR(100),
  user_number             INTEGER,
  PRIMARY KEY (user_id),
  FOREIGN KEY (block_id) REFERENCES blocks (block_id)
);

CREATE TABLE contract_categories (
  contract_category_id    INTEGER NOT NULL,
  contract_category_name  VARCHAR(100),
  PRIMARY KEY (contract_category_id)
);

CREATE TABLE contract_ampere (
  contract_ampere_id      INTEGER NOT NULL,
  ampere_value            INTEGER,
  basis_rate              INTEGER,
  PRIMARY KEY (contract_ampere_id)
);

CREATE TABLE contracts (
  contract_id             INTEGER NOT NULL,
  user_id                 INTEGER NOT NULL,
  contract_category_id    INTEGER NOT NULL,
  contract_ampere_id      INTEGER NOT NULL,
  address                 VARCHAR(100),
  PRIMARY KEY (contract_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (contract_category_id) REFERENCES contract_categories (contract_category_id),
  FOREIGN KEY (contract_ampere_id) REFERENCES contract_ampere (contract_ampere_id)
);

CREATE TABLE agents (
  agent_id               INTEGER NOT NULL,
  agent_name             VARCHAR(100),
  PRIMARY KEY (agent_id)
);

CREATE TABLE meter_checks (
  meter_check_id         INTEGER NOT NULL,
  contract_id            INTEGER NOT NULL,
  agent_id               INTEGER NOT NULL,
  meter_check_date       DATE,
  indicated_value        INTEGER,
  meter_number           INTEGER,
  PRIMARY KEY (meter_check_id),
  FOREIGN KEY (contract_id) REFERENCES contracts (contract_id),
  FOREIGN KEY (agent_id) REFERENCES agents (agent_id)
);

CREATE TABLE billings (
  billing_id             INTEGER NOT NULL,
  meter_check_id         INTEGER NOT NULL,
  due_date               DATE,
  PRIMARY KEY (billing_id),
  FOREIGN KEY (meter_check_id) REFERENCES meter_checks (meter_check_id)
);

CREATE TABLE billing_items (
  billing_item_id        INTEGER NOT NULL,
  billing_item_name      VARCHAR(100),
  PRIMARY KEY (billing_item_id)
);

CREATE TABLE billing_details (
  billing_detail_id      INTEGER NOT NULL,
  billing_id             INTEGER NOT NULL,
  billing_item_id        INTEGER NOT NULL,
  price                  INTEGER,
  PRIMARY KEY (billing_item_id),
  FOREIGN KEY (billing_id) REFERENCES billings (billing_id),
  FOREIGN KEY (billing_item_id) REFERENCES billing_items (billing_item_id)
);
