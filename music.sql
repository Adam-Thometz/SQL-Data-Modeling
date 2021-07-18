DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL 
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL 
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INT NOT NULL REFERENCES albums (id),
  artist_id INT NOT NULL REFERENCES artists (id),
  artist_collab INT REFERENCES artists (id),
  producer_id INT NOT NULL REFERENCES producers (id),
  producer_collab INT REFERENCES producers (id)
);

INSERT INTO artists
  (name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Carey'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay-Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

INSERT INTO producers
  (name)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Darkchild');

INSERT INTO albums
  (title, release_date)
VALUES
  ('Middle of Nowhere', '04-15-1997'),
  ('A Night At The Opera', '10-31-1975'),
  ('Daydream', '11-14-1995'),
  ('A Star is Born', '09-27-2018'),
  ('Silver Side Up', '08-21-2001'),
  ('The Blueprint 3', '10-20-2009'),
  ('Prism', '12-17-2013'),
  ('Hands All Over', '06-21-2011'),
  ('Let Go', '05-14-2002'),
  ('The Writing''s on the Wall', '11-07-1999');

INSERT INTO songs
  (title, duration_in_seconds, album_id, artist_id, artist_collab, producer_id, producer_collab)
VALUES
  ('MMMBop', 238, 1, 1, NULL, 1, 2),
  ('Bohemian Rhapsody', 355, 2, 2, NULL, 3, NULL),
  ('One Sweet Day', 282, 3, 3, 4, 4, NULL),
  ('Shallow', 216, 4, 5, 6, 5, NULL),
  ('How You Remind Me', 223, 5, 7, NULL, 6, NULL),
  ('New York State of Mind', 276, 6, 8, 9, 7, NULL),
  ('Dark Horse', 215, 7, 10, 11, 8, 9),
  ('Moves Like Jagger', 201, 8, 12, 13, 10, 11),
  ('Complicated', 244, 9, 14, NULL, 12, NULL),
  ('Say My Name', 240, 10, 15, NULL, 13, NULL);