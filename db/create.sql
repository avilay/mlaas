SET client_min_messages=WARNING;

-- create tables
\echo 'Creating users table'
CREATE TABLE IF NOT EXISTS users (
  id serial CONSTRAINT u_pri_key PRIMARY KEY,
  name varchar(50),
  email varchar(50),
  hashed_password varchar(1024),
  salt varchar(1024),
  created_at timestamp,
  last_activity_at timestamp
);

\echo 'Creating categories table'
CREATE TABLE IF NOT EXISTS categories (
  id serial CONSTRAINT c_pri_key PRIMARY KEY,
  name varchar(1024),
  icon_url varchar(1024),
  purpose text,
);

\echo 'Creating datasets table'
CREATE TABLE IF NOT EXISTS datasets (
  id serial CONSTRAINT d_pri_key PRIMARY KEY,
  name varchar(1024),
  headline varchar(1024),
  logo_url varchar(1024),
  description text,
  schema text,
  url varchar(1024),
  size decimal(5,2),
  size_unit char(4),
  price decimal(5,2),
  is_public boolean,
  owner_user_id integer CONSTRAINT fk_d_users REFERENCES users,
  category_id integer CONSTRAINT fk_d_categories REFERENCES categories,
  created_at timestamp
);

\echo 'Creating algorithms table'
CREATE TABLE IF NOT EXISTS algorithms (
  id serial CONSTRAINT a_pri_key PRIMARY KEY,
  name varchar(1024),
  headline varchar(1024),
  logo_url varchar(1024),
  purpose text,
  input_schema text,
  output_schema text,
  price decimal(5,2),
  is_public boolean,
  owner_user_id integer CONSTRAINT fk_a_users REFERENCES users,
  category_id integer CONSTRAINT fk_a_categories REFERENCES categories,
  created_at timestamp
);

\echo 'Creating tasks table'
CREATE TABLE IF NOT EXISTS tasks (
  id serial CONSTRAINT t_pri_key PRIMARY KEY,
  start_on timestamp,
  status varchar(10),
  end_on timestamp,
  dataset_id integer CONSTRAINT fk_t_datasets REFERENCES datasets,
  algorithm_id integer CONSTRAINT fk_t_algorithms REFERENCES algorithms
);
