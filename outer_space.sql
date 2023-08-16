-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INT REFERENCES stars NOT NULL,
  has_moons BOOLEAN
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbiting_planet INTEGER REFERENCES planets
);

INSERT INTO stars (name, galaxy)
VALUES 
  ('The Sun', 'Milky Way'),
  ('Proxima Centauri', 'Milky Way'),
  ('Gliese 876', 'Milky Way');
  
INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, has_moons)
VALUES
  ('Earth', 1.00, 1, True),
  ('Mars', 1.88, 1, True),
  ('Venus', 0.62, 1, False),
  ('Neptune', 164.8, 1, True),
  ('Proxima Centauri b', 0.03, 2, False),
  ('Gliese 876 b', 0.23, 3, False);

INSERT INTO moons (name, orbiting_planet)
VALUES  
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('S/2004 N 1', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Nereid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laomedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4);