CREATE TABLE IF NOT EXISTS things (
  id  SERIAL PRIMARY KEY,
  name varchar(40),
  description varchar(255),
  created_at timestamp,
  updated_at timestamp
);
