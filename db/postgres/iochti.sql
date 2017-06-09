CREATE TYPE units AS ENUM (
  'celsius',
  'farenheit',
  'lux',
  'kilograms',
  'file'
);

CREATE TABLE IF NOT EXISTS data_group (
  id serial PRIMARY KEY,
  name varchar(50),
  unit units
);

CREATE TABLE IF NOT EXISTS thing_group (
  id serial PRIMARY KEY,
  name varchar(50),
  description varchar(200)
);

CREATE TABLE IF NOT EXISTS data_group_things_group (
  data_group_id integer REFERENCES data_group ON DELETE RESTRICT,
  thing_group_id integer REFERENCES thing_group ON DELETE RESTRICT,
  CONSTRAINT data_group_thing_group_pkey PRIMARY KEY(data_group_id, thing_group_id)
);

CREATE TABLE IF NOT EXISTS thing (
  id  serial PRIMARY KEY,
  thing_id integer REFERENCES thing_group (id),
  name varchar(50),
  MAC varchar(17),
  created_at timestamp,
  updated_at timestamp
);

CREATE TABLE IF NOT EXISTS accounts (
  id serial PRIMARY KEY,
  name varchar(40),
  login varchar(40) UNIQUE,
  avatar varchar(250),
  email varchar(100) UNIQUE,
  created_at date,
  updated_at date
);