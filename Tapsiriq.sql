CREATE DATABASE movie

USE movie

CREATE TABLE Director (
    Id int IDENTITY PRIMARY KEY,
    Name NVARCHAR(50),
    Surname NVARCHAR(50),
)

CREATE TABLE Movies (
    Id int IDENTITY PRIMARY KEY,
    Movie_name NVARCHAR(255),
    imdb_point int,
    Director_id int FOREIGN KEY REFERENCES Director (Id),
)

CREATE TABLE Actors (
    Id int IDENTITY PRIMARY KEY,
    Name NVARCHAR(50),
    Surname NVARCHAR(50),
)

CREATE TABLE Genres (
    Id int IDENTITY PRIMARY KEY,
    Name NVARCHAR(50),
)

CREATE TABLE ActorsinMovie (
    Actor_id int FOREIGN KEY REFERENCES Actors (Id),
    Movie_id int FOREIGN KEY REFERENCES Movies (Id),
)

CREATE TABLE GenresinMovie (
    Genre_Id int FOREIGN KEY REFERENCES Genres (Id),
    Movie_id int FOREIGN KEY REFERENCES Movies (Id),
)


INSERT INTO Actors
VALUES ('Taleh', 'Yüzbəyov'), ('Mehdi', 'Sadiq'), ('Uzel', 'Kərimova')

INSERT INTO Genres
VALUES ('Aksiyon'), ('Macera'), ('Korku'), ('Gerilim')

INSERT INTO Director
VALUES ('Taleh', 'Yüzbəyov')

INSERT INTO Movies
VALUES ('7 Gözəl', 10, 1), ('Adəm və Həvva', 10, 1), ('Zəhər tuluğu', 10, 1)

INSERT INTO ActorsinMovie
VALUES (1, 1), (2, 1), (3, 2), (1,2), (2, 3), (3, 3)

INSERT INTO GenresinMovie
VALUES (1, 1), (2, 1), (4,1), (1, 2), (3,2), (2, 3), (4, 3)


SELECT m.Movie_name as 'Movie name',
        m.imdb_point as 'IMDB Point',
        d.Name as 'Director name',
        d.Surname as 'Director Surname',
        a.Name as 'Actor Name',
        a.Surname as 'Actor Surname',
        g.Name as 'Genre'
FROM Movies m
JOIN ActorsinMovie ma on ma.Movie_id = m.Id
JOIN Actors a on ma.Actor_id = a.Id
JOIN Director d on m.Director_id = d.Id
JOIN GenresinMovie mg on mg.Movie_id = m.Id
JOIN Genres g on g.Id = mg.Genre_Id
WHERE m.imdb_point > 6


SELECT m.Movie_name as 'Movie name',
        m.imdb_point as 'IMDB Point',
        g.Name as 'Genre'
FROM Movies m
JOIN GenresinMovie mg on mg.Movie_id = m.Id
JOIN Genres g on g.Id = mg.Genre_Id
WHERE g.Name LIKE '%a%'


SELECT m.Movie_name as 'Movie name',
        m.imdb_point as 'IMDB Point',
        g.Name as 'Genre'
FROM Movies m
JOIN GenresinMovie mg on mg.Movie_id = m.Id
JOIN Genres g on g.Id = mg.Genre_Id
WHERE m.Movie_name LIKE '%t' AND LEN(m.Movie_name) >= 5


SELECT m.Movie_name as 'Movie name',
        m.imdb_point as 'IMDB Point',
        d.Name as 'Director name',
        d.Surname as 'Director Surname',
        a.Name as 'Actor Name',
        a.Surname as 'Actor Surname',
        g.Name as 'Genre'
FROM Movies m
JOIN ActorsinMovie ma on ma.Movie_id = m.Id
JOIN Actors a on ma.Actor_id = a.Id
JOIN Director d on m.Director_id = d.Id
JOIN GenresinMovie mg on mg.Movie_id = m.Id
JOIN Genres g on g.Id = mg.Genre_Id
WHERE m.imdb_point > (select AVG(Movies.imdb_point) from Movies)

