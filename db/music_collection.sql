DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS albums;

CREATE TABLE artists(
  id SERIAL PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR
);

CREATE TABLE albums(
  id SERIAL PRIMARY KEY,
  genre VARCHAR,
  title VARCHAR,
  artist_id INT REFERENCES artists(id)
);
