CREATE TABLE registers (
  register_id         INTEGER NOT NULL,
  register_code       VARCHAR(100),
  PRIMARY KEY (register_id)
);

CREATE TABLE packages (
  package_id          INTEGER NOT NULL,
  package_name        VARCHAR(100),
  PRIMARY KEY (package_id)
);

CREATE TABLE menus (
  menu_id             INTEGER NOT NULL,
  menu_name           VARCHAR(100),
  price               INTEGER,
  set_menu            VARCHAR(100),
  PRIMARY KEY (menu_id)
);

CREATE TABLE set_contents (
  set_content_id      INTEGER NOT NULL,
  set_menu_id         INTEGER NOT NULL,
  included_menu_id    INTEGER NOT NULL,
  PRIMARY KEY (set_content_id),
  FOREIGN KEY (set_menu_id) REFERENCES menus (menu_id)
    ON UPDATE RESTRICT,
  FOREIGN KEY (included_menu_id) REFERENCES menus (menu_id)
    ON UPDATE RESTRICT
);

CREATE TABLE order_details (
  order_detail_id     INTEGER NOT NULL,
  order_id            INTEGER NOT NULL,
  menu_id             INTEGER NOT NULL,
  order_number        INTEGER,
  PRIMARY KEY (order_detail_id),
  FOREIGN KEY (order_id) REFERENCES orders (order_id)
    ON UPDATE RESTRICT,
  FOREIGN KEY (menu_id) REFERENCES menus (menu_id)
    ON UPDATE RESTRICT
);

CREATE TABLE orders (
  order_id            INTEGER NOT NULL,
  register_id         INTEGER NOT NULL,
  order_timestamp     TIMESTAMPTZ,
  total_price         INTEGER,
  tax                 INTEGER,
  package_id          INTEGER NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (register_id) REFERENCES registers (register_id)
    ON UPDATE RESTRICT,
  FOREIGN KEY (package_id) REFERENCES packages (package_id)
    ON UPDATE RESTRICT
);

CREATE TABLE paid (
  paid_id             INTEGER NOT NULL,
  order_id            INTEGER NOT NULL,
  paid_category       VARCHAR(100),
  paid_price          INTEGER,
  change              INTEGER,
  PRIMARY KEY (paid_id),
  FOREIGN KEY (order_id) REFERENCES orders (order_id)
    ON UPDATE RESTRICT
);
