DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

-- ***** create all tables ***** --

--create regions table --
CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region_name TEXT NOT NULL,
    state TEXT
);

-- create categories table --

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

-- Create users table --

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    preferred_region INTEGER REFERENCES regions
);

-- create posts table --

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    o_p INTEGER REFERENCES users,
    location TEXT,
    region INTEGER NOT NULL REFERENCES regions
);

-- Inserations --

-- insert regions --

INSERT INTO regions (region_name, state)
VALUES 
    ('Atlanta', 'Georgia'),
    ('Toledo', 'Ohio'),
    ('San Francisco', 'California'),
    ('Denver', 'Colorado');

-- insesrt categories --

INSERT INTO categories (category)
VALUES 
    ('for sale'), 
    ('property rental'), 
    ('appliances'), 
    ('vehicles'), 
    ('services');

--insert users --

INSERT INTO users (username, preferred_region)
VALUES
    ('not-a-bot', 1),
    ('sell_everything', 3),
    ('here4munny', 4);

--insert posts --

INSERT INTO posts (title, o_p, location, region)
VALUES
    ('warhammer figures', 2, 'Maumee', 2),
    ('New bicycle', 1, 'Boulder', 4);