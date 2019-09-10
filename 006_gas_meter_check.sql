CREATE TABLE users (
  user_id               INTEGER NOT NULL,
  user_name             VARCHAR(100),
  user_number           INTEGER,
  PRIMARY KEY (user_id)
);

CREATE TABLE agent_companies (
  agent_company_id      INTEGER NOT NULL,
  agent_company_name    VARCHAR(100),
  PRIMARY KEY (agent_company_id)
);

CREATE TABLE agents (
  agent_id               INTEGER NOT NULL,
  agent_company_id       INTEGER NOT NULL,
  agent_name             VARCHAR(100),
  PRIMARY KEY (agent_id),
  FOREIGN KEY (agent_company_id) REFERENCES agent_companies (agent_company_id)
);

CREATE TABLE meter_checks (
  meter_check_id         INTEGER NOT NULL,
  user_id                INTEGER NOT NULL,
  agent_id               INTEGER NOT NULL,
  meter_check_date       DATE,
  indicated_value        INTEGER,
  PRIMARY KEY (meter_check_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (agent_id) REFERENCES agents (agent_id)
);

CREATE TABLE rate_lists (
  rate_list_id            INTEGER NOT NULL,
  rate_list_name          VARCHAR(100),
  min_usage               INTEGER,
  max_usage               INTEGER,
  PRIMARY KEY (rate_list_id)
);

CREATE TABLE rates (
  rate_id                 INTEGER NOT NULL,
  rate_list_id            INTEGER NOT NULL,
  applied_month           INTEGER,
  basis_rate              INTEGER,
  rate                    INTEGER,
  PRIMARY KEY (rate_id),
  FOREIGN KEY (rate_list_id) REFERENCES rate_lists (rate_list_id)
);
