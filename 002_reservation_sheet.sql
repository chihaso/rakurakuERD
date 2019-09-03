CREATE TABLE publishers (
  publisher_id          INTEGER NOT NULL,
  publisher_name        VARCHAR(100),
  PRIMARY KEY (publishers_id)
);

CREATE TABLE books (
  book_id               INTEGER NOT NULL,
  book_name             VARCHAR(100),
  author                VARCHAR(100),
  publisher_id          INTEGER NOT NULL,
  publication_year      DATE,
  price                 INTEGER,
  PRIMARY KEY (book_id),
  FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id)
);

CREATE TABLE information_sources (
  information_source_id INTEGER NOT NULL,
  book_id               INTEGER NOT NULL,
  new_book_info_number  INTEGER,
  newspaper_name        VARCHAR(100),
  newspaper_date        DATE,
  others                VARCHAR(100),
  PRIMARY KEY (information_source_id),
  FOREIGN KEY (book_id) REFERENCES books (book_id)
);

CREATE TABLE users (
  user_id               INTEGER NOT NULL,
  user_name             VARCHAR(100),
  user_furigana         VARCHAR(100),
  usercard_number       VARCHAR(100),
  PRIMARY KEY (user_id)
);

CREATE TABLE libraries (
  library_id            INTEGER NOT NULL,
  library_name          VARCHAR(100),
  PRIMARY KEY (library_id)
);

CREATE TABLE midorigo_stations (
  midorigo_station_id   INTEGER NOT NULL,
  midorigo_station_name VARCHAR(100),
  PRIMARY KEY (midorigo_station_id)
);

CREATE TABLE receive_places (
  receive_place_id      INTEGER NOT NULL,
  library_id            INTEGER,
  midorigo_station_id   INTEGER,
  PRIMARY KEY (receive_place_id),
  FOREIGN KEY (library_id)          REFERENCES libraries (library_id)
  FOREIGN KEY (midorigo_station_id) REFERENCES midorigo_stations (midorigo_station_id)
);

CREATE TABLE reservations (
  reservation_id        INTEGER NOT NULL,
  reservation_date      DATE,
  user_id               INTEGER NOT NULL,
  contact_way           VARCHAR(100),
  contact_number        VARCHAR(100),
  tell_family           VARCHAR(100),
  receive_place_id      INTEGER NOT NULL,
  book_id               INTEGER NOT NULL,
  PRIMARY KEY (reservation_id),
  FOREIGN KEY (user_id)           REFERENCES users (user_id),
  FOREIGN KEY (receive_place_id)  REFERENCES receive_places (receive_place_id),
  FOREIGN KEY (book_id)           REFERENCES books (book_id),
);
