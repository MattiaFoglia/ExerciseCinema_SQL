DROP DATABASE IF EXISTS Film;
CREATE DATABASE Film;
USE Film;

-- Crea la tabella ATTORI
CREATE TABLE ATTORI (
    CodAttore INT PRIMARY KEY,
    Nome VARCHAR(255),
    AnnoNascita INT,
    Nazionalità VARCHAR(255)
);

-- Crea la tabella FILM
CREATE TABLE FILM (
    CodFilm INT PRIMARY KEY,
    Titolo VARCHAR(255),
    AnnoProduzione INT,
    Nazionalità VARCHAR(255),
    Regista VARCHAR(255),
    Genere VARCHAR(255)
);

-- Crea la tabella SALE
CREATE TABLE SALE (
    CodSala INT PRIMARY KEY,
    Posti INT,
    Nome VARCHAR(255),
    Città VARCHAR(255)
);

-- Crea la tabella PROIEZIONI
CREATE TABLE PROIEZIONI (
    CodProiezione INT PRIMARY KEY,
    CodFilm INT,
    CodSala INT,
    Incasso DECIMAL(10, 2),
    DataProiezione DATE,
    FOREIGN KEY (CodFilm) REFERENCES FILM (CodFilm),
    FOREIGN KEY (CodSala) REFERENCES SALE (CodSala)
);


-- Crea la tabella RECITA
CREATE TABLE RECITA (
    CodAttore INT,
    CodFilm INT,
    PRIMARY KEY (CodAttore, CodFilm),
    FOREIGN KEY (CodAttore) REFERENCES ATTORI (CodAttore),
    FOREIGN KEY (CodFilm) REFERENCES FILM (CodFilm)
);

INSERT INTO ATTORI (CodAttore, Nome, AnnoNascita, Nazionalità) VALUES
(1, 'Robert Downey Jr.', 1965, 'USA'),
(2, 'Scarlett Johansson', 1984, 'USA'),
(3, 'Leonardo DiCaprio', 1974, 'USA'),
(4, 'Meryl Streep', 1949, 'USA'),
(5, 'Matt Damon', 1970, 'USA'),
(6, 'Pierfrancesco Favino', 1969, 'Italia');

INSERT INTO FILM (CodFilm, Titolo, AnnoProduzione, Nazionalità, Regista, Genere) VALUES
(1, 'Avengers: Endgame', 2019, 'USA', 'Anthony Russo, Joe Russo', 'Azione'),
(2, 'Black Widow', 2021, 'USA', 'Cate Shortland', 'Azione'),
(3, 'Inception', 2010, 'USA', 'Christopher Nolan', 'Fantascienza'),
(4, 'The Iron Lady', 2011, 'UK', 'Phyllida Lloyd', 'Dramma'),
(5, 'The Martian', 2015, 'USA', 'Ridley Scott', 'Fantascienza'),
(6, 'La Piovra', 1984, 'Italia', 'Damiano Damiani', 'Dramma');

INSERT INTO RECITA (CodAttore, CodFilm) VALUES
(1, 1), -- Robert Downey Jr. in Avengers: Endgame
(2, 1), -- Scarlett Johansson in Avengers: Endgame
(3, 1), -- Leonardo DiCaprio in Avengers: Endgame (ipotetico)
(2, 2), -- Scarlett Johansson in Black Widow
(4, 4), -- Meryl Streep in The Iron Lady
(5, 5), -- Matt Damon in The Martian
(6, 6); -- Pierfrancesco Favino in La Piovra

INSERT INTO SALE (CodSala, Posti, Nome, Città) VALUES
(1, 80, 'Sala 1', 'Pisa'),
(2, 150, 'Sala 2', 'Pisa'),
(3, 50, 'Sala 3', 'Pisa'),
(4, 70, 'Sala 4', 'Milano'),
(5, 120, 'Sala 5', 'Milano'),
(6, 200, 'Sala 6', 'Milano');

INSERT INTO PROIEZIONI (CodProiezione, CodFilm, CodSala, Incasso, DataProiezione) VALUES
(1, 1, 1, 10000, '2023-01-10'),
(2, 1, 4, 15000, '2023-01-10'),
(3, 2, 5, 12000, '2023-02-15'),
(4, 3, 3, 8000, '2023-03-12'),
(5, 5, 6, 20000, '2023-06-20'),
(6, 6, 2, 6000, '2023-06-25');


-- 10
INSERT INTO FILM (CodFilm, Titolo, AnnoProduzione, Nazionalità, Regista, Genere)
VALUES (12345, 'Jurassic Park', 1993, 'USA', 'S. Spielberg', 'Avventura');

SET SQL_SAFE_UPDATES = 0;

-- 16
UPDATE FILM
SET Genere = 'Musicali'
WHERE Genere = 'Musical';

-- 20
DELETE FROM ATTORI
WHERE Nazionalità = 'Inglese';

