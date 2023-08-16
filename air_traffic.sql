-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airports
(
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  dep_airport INTEGER REFERENCES airports,
  arr_airport INTEGER REFERENCES airports
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  flight INTEGER REFERENCES flights
);

INSERT INTO airports (city, country)
VALUES 
  ('Washington DC', 'United States'),
  ('Tokyo', 'Japan'),
  ('Los Angeles', 'United States'),
  ('Seattle', 'United States'),
  ('Paris', 'France'),
  ('Dubai', 'UAE'),
  ('New York', 'United States'),
  ('Cedar Rapids', 'United States'),
  ('Charlotte', 'United States'),
  ('Sao Paolo', 'Brazil'),
  ('London', 'United Kingdom'),
  ('Las Vegas', 'United States'),
  ('Mexico City', 'Mexico'),
  ('Casablanca', 'Morocco'),
  ('Beijing', 'China'),
  ('Chicago', 'United States'),
  ('New Orleans', 'United States'),
  ('Santiago', 'Chile');

INSERT INTO flights (airline, departure, arrival, dep_airport, arr_airport)
VALUES 
  ('United', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 4),
  ('British Airways', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 11),
  ('Delta', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 12),
  ('Delta', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 4, 13),
  ('TUI Fly Belgium', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 5, 14),
  ('Air China', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 6, 15),
  ('United', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 7, 9),
  ('American Airlines', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 8, 16),
  ('American Airlines', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 9, 17),
  ('Aviance Brasil', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 10, 18);



INSERT INTO tickets
  (first_name, last_name, seat, flight)
VALUES
  ('Jennifer', 'Finch', '33B', 1),
  ('Thadeus', 'Gathercoal', '8A', 2),
  ('Sonja', 'Pauley', '12F', 3),
  ('Jennifer', 'Finch', '20A', 4),
  ('Waneta', 'Skeleton', '23D', 5),
  ('Thadeus', 'Gathercoal', '18C', 6),
  ('Berkie', 'Wycliff', '9E', 7),
  ('Alvin', 'Leathes', '1A', 8),
  ('Berkie', 'Wycliff', '32B', 9),
  ('Cory', 'Squibbes', '10D', 10);