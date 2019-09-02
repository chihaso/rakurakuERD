CREATE TABLE goods_categories (
  goods_category_id     INTEGER NOT NULL,
  goods_category_name   VARCHAR(100),
  PRIMARY KEY (goods_category_id)
);

CREATE TABLE goods (
  goods_id              INTEGER NOT NULL,
  goods_name            VARCHAR(100),
  price                 INTEGER,
  tax-included_price    INTEGER,
  goods_class           INTEGER,
  goods_category_id     INTEGER NOT NULL,
  PRIMARY KEY (goods_id),
  FOREIGN KEY (goods_category_id) REFERENCES goods_categories (goods_category_id)
);

CREATE TABLE customers (
  customer_id           INTEGER NOT NULL,
  customer_name         VARCHAR(100),
  phone_number          VARCHAR(100),
  PRIMARY KEY (customer_id)
);

CREATE TABLE orders (
  order_id              INTEGER NOT NULL,
  order_number          INTEGER,
  customer_id           INTEGER NOT NULL,
  goods_id              INTEGER NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
  FOREIGN KEY (goods_id)    REFERENCES goods (goods_id)
);
