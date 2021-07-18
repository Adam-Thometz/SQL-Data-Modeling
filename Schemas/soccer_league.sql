DROP DATABASE soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    teamId INT NOT NULL REFERENCES teams (id)
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY NOT NULL,
    location TEXT NOT NULL,
    date DATE NOT NULL,
    hometeamId INT NOT NULL REFERENCES teams (id),
    awayteamId INT NOT NULL REFERENCES teams (id),
    seasonId INT NOT NULL REFERENCES seasons (id),
    refereeId INT NOT NULL REFERENCES referees (id)
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY NOT NULL,
    matchId INT NOT NULL REFERENCES matches (id),
    playerId INT NOT NULL REFERENCES players (id)
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY NOT NULL,
    teamId INT NOT NULL REFERENCES teams (id),
    matchId INT NOT NULL REFERENCES matches (id)
);

-- INSERT INTO teams (name, city)
-- VALUES
-- ('el-Adly', 'Cairo'),
-- ('Ismaily', 'Ismailia');

-- INSERT INTO players (name, teamId)
-- VALUES
-- ('Mohamed El-Shanawy', 1),
-- ('Mohamed Sobhy', 2);

-- INSERT INTO referees (name)
-- VALUES
-- ('Ahmed Sadawi');