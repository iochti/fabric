CREATE TABLE IF NOT EXISTS users (
  id  SERIAL PRIMARY KEY,
  name varchar(40),
  login varchar(40) UNIQUE,
  avatar varchar(250),
  email varchar(100) UNIQUE,
  created_at date,
  updated_at date
);
