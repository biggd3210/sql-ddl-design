
DROP DATABASE IF EXISTS soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT UNIQUE NOT NULL,
    team_code VARCHAR(5),
    league_start DATE,
    league_end DATE
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT NOT NULL,
    team INTEGER REFERENCES teams
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    ref_first_name TEXT NOT NULL,
    ref_last_name TEXT NOT NULL
);


CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team1 INTEGER REFERENCES teams,
    team2 INTEGER REFERENCES teams,
    match_date DATE
);


CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    scoring_player INTEGER REFERENCES players NOT NULL,
    match INTEGER REFERENCES matches,
    game_time TIME
);

CREATE TABLE ref_schedule
(
    id SERIAL PRIMARY KEY,
    referee INTEGER REFERENCES referees,
    game_match INTEGER REFERENCES matches
);

-- CREATE TABLE team_rosters
-- (
--     id SERIAL PRIMARY KEY,
--     team_id REFERENCES teams,
--     player_id REFERENCES players
-- );

-- INSERTIONS --

--teams--

INSERT INTO teams (team_name, team_code, league_start, league_end)
VALUES
    ('cannonballs', 'cann', '2023-08-12', '2023-10-31'),
    ('dudleys', 'duds', '2023-08-12', '2023-10-31'),
    ('dragons', 'drag', '2023-08-14', '2023-11-12'),
    ('sea turtles', 'stur', '2023-08-14', '2023-11-12');

--players--

INSERT INTO players (first_name, last_name, team)
VALUES 
    ('leo', 'tesso', 1),
    ('alex', 'zacko', 2),
    ('william', 'bentley', 3),
    ('zack', 'stoppa', 4);

--referees--

INSERT INTO referees (ref_first_name, ref_last_name)
VALUES 
    ('phil', 'destino'),
    ('will', 'destino'),
    ('bill', 'destino');

--matches--

INSERT INTO matches (team1, team2, match_date)
VALUES
    (1, 2, '2023-08-12'),
    (3, 4, '2023-08-14'),
    (1, 3, '2023-08-24'),
    (2, 4, '2023-09-14');

--goals--

INSERT INTO goals (scoring_player, match, game_time)
VALUES 
    (1, 1, '12:42'),
    (2, 1, '12:48'),
    (1, 1, '13:12'),
    (4, 2, '10:17'),
    (4, 2, '10:25');

--ref_schedule--

INSERT INTO ref_schedule (referee, game_match)
VALUES
    (1, 2),
    (1, 4),
    (2, 1),
    (3, 3);