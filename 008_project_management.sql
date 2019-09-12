CREATE TABLE merits (
  merit_id                  INTEGER NOT NULL,
  merit_text                TEXT,
  PRIMARY KEY (merit_id)
);

CREATE TABLE standardize_points (
  standardize_point_id     INTEGER NOT NULL,
  standardize_point_text   TEXT,
  PRIMARY KEY (standardize_point_id)
);

CREATE TABLE hierarchies (
  hierarchy_id              INTEGER NOT NULL,
  higher_point_id           INTEGER NOT NULL,
  lower_point_id            INTEGER NOT NULL,
  PRIMARY KEY (hierarchy_id),
  FOREIGN KEY (higher_point_id) REFERENCES standardize_points (standardize_point_id),
  FOREIGN KEY (lower_point_id) REFERENCES standardize_points (standardize_point_id)
);

CREATE TABLE merit_point_sets (
  merit_point_set_id        INTEGER NOT NULL,
  point_id                  INTEGER NOT NULL,
  merit_id                  INTEGER NOT NULL,
  PRIMARY KEY (merit_point_set_id),
  FOREIGN KEY (point_id) REFERENCES standardize_points (standardize_point_id),
  FOREIGN KEY (merit_id) REFERENCES merits (merit_id)
);
