DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    preferred_region_id INT NOT NULL REFERENCES region (id)
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL,
    description TEXT NOT NULL,
    userId INT NOT NULL REFERENCES users (id),
    locationId INT NOT NULL REFERENCES region (id),
    catId INT NOT NULL REFERENCES categories (id)
);

-- INSERT INTO region (name)
-- VALUES
-- ('New York City'), ('San Francisco'), ('Butte');

-- INSERT INTO users (name, preferred_region_id)
-- VALUES
-- ('Mr. Hypeman', 1), ('FungusMan', 1);