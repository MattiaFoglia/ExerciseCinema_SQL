-- 1
SELECT COUNT(CodSala) AS NumeroSale
FROM Sale
WHERE Città = 'Pisa' AND Posti > 60
;
-- 2
SELECT DISTINCT Attori.Nome
FROM Attori
JOIN Recita ON Attori.CodAttore = Recita.CodAttore
JOIN Film ON Recita.CodFilm = FILM.CodFilm
JOIN Proiezioni ON FILM.CodFilm = Proiezioni.CodFilm
JOIN Sale ON Proiezioni.CodSala = Sale.CodSala
WHERE Sale.Città = 'Milano'
;
-- 3
SELECT SUM(Posti) AS TotalePosti
FROM Sale
WHERE Città = 'Pisa'
;
-- 4
SELECT Città, COUNT(CodSala) AS NumeroSale
FROM Sale
GROUP BY Città
;
-- 5
SELECT Città, COUNT(CodSala) AS NumeroSaleConPiuDi60Posti
FROM Sale
WHERE Posti > 60
GROUP BY Città
;
-- 6
SELECT Regista, COUNT(CodFilm) AS NumeroFilmDopo1990
FROM Film
WHERE AnnoProduzione > 1990
GROUP BY Regista
;
-- 7
SELECT Film.Regista, SUM(Proiezioni.Incasso) AS IncassoTotale
FROM Film
JOIN Proiezioni ON Film.CodFilm = Proiezioni.CodFilm
GROUP BY Film.Regista
;
-- 8
SELECT FILM.Titolo, COUNT(Proiezioni.CodProiezione) AS NumeroProiezioniPisa, SUM(PROIEZIONI.Incasso) AS IncassoTotale
FROM FILM
JOIN Proiezioni ON FILM.CodFilm = Proiezioni.CodFilm
JOIN Film ON Proiezioni.CodSala = Sale.CodSala
WHERE Film.Regista = 'S. Spielberg' AND Sale.Citta = 'Pisa'
GROUP BY Film.Titolo
;
-- 9
SELECT DISTINCT FILM.Titolo
FROM FILM
JOIN RECITA ON FILM.CodFilm = RECITA.CodFilm
JOIN ATTORI ON RECITA.CodAttore = ATTORI.CodAttore
WHERE ATTORI.Nazionalità = 'Italia';

-- 11
SELECT FILM.Regista, ATTORI.Nome AS Attore, COUNT(*) AS NumeroFilm
FROM FILM
JOIN RECITA ON FILM.CodFilm = RECITA.CodFilm
JOIN ATTORI ON RECITA.CodAttore = ATTORI.CodAttore
GROUP BY FILM.Regista, ATTORI.Nome
;
-- 12
SELECT DISTINCT FILM.Titolo
FROM FILM
JOIN RECITA ON FILM.CodFilm = RECITA.CodFilm
JOIN ATTORI ON RECITA.CodAttore = ATTORI.CodAttore
WHERE FILM.Regista = ATTORI.Nome
;
-- 13
SELECT FILM.Regista, FILM.Titolo
FROM FILM
JOIN RECITA ON FILM.CodFilm = RECITA.CodFilm
GROUP BY FILM.CodFilm, FILM.Regista, FILM.Titolo
HAVING COUNT(RECITA.CodAttore) < 6
;
-- 14
SELECT FILM.CodFilm, FILM.Titolo, SUM(PROIEZIONI.Incasso) AS IncassoTotale
FROM FILM
JOIN PROIEZIONI ON FILM.CodFilm = PROIEZIONI.CodFilm
WHERE FILM.AnnoProduzione > 2000
GROUP BY FILM.CodFilm, FILM.Titolo
;
-- 15
SELECT SALE.Nome AS Sala, SUM(PROIEZIONI.Incasso) AS IncassoTotale
FROM SALE
JOIN PROIEZIONI ON SALE.CodSala = PROIEZIONI.CodSala
JOIN FILM ON PROIEZIONI.CodFilm = FILM.CodFilm
WHERE FILM.Nazionalità != 'Italia'
GROUP BY SALE.Nome
;
-- 17
SELECT FILM.Titolo, COUNT(ATTORI.CodAttore) AS NumeroAttori
FROM FILM
JOIN RECITA ON FILM.CodFilm = RECITA.CodFilm
JOIN ATTORI ON RECITA.CodAttore = ATTORI.CodAttore
GROUP BY FILM.CodFilm, FILM.Titolo
HAVING COUNT(CASE WHEN ATTORI.AnnoNascita >= 1970 THEN 1 END) = 0
;
-- 18
SELECT FILM.Titolo, SUM(PROIEZIONI.Incasso) AS IncassoTotale
FROM FILM
JOIN PROIEZIONI ON FILM.CodFilm = PROIEZIONI.CodFilm
WHERE FILM.Genere = 'Fantascienza'
GROUP BY FILM.Titolo
;
-- 19
SELECT FILM.Titolo, SUM(PROIEZIONI.Incasso) AS IncassoTotale
FROM FILM
JOIN PROIEZIONI ON FILM.CodFilm = PROIEZIONI.CodFilm
WHERE FILM.Genere = 'Fantascienza' AND PROIEZIONI.DataProiezione > '2001-01-01'
GROUP BY FILM.Titolo
;
-- 21
SELECT FILM.Titolo, SUM(PROIEZIONI.Incasso) AS IncassoTotale
FROM FILM
JOIN PROIEZIONI ON FILM.CodFilm = PROIEZIONI.CodFilm
WHERE FILM.Genere = 'Fantascienza'
GROUP BY FILM.Titolo
HAVING MIN(PROIEZIONI.DataProiezione) >= '2001-01-01';

-- 22
SELECT SALE.Nome AS Sala, SUM(PROIEZIONI.Incasso) AS IncassoTotale
FROM SALE
JOIN PROIEZIONI ON SALE.CodSala = PROIEZIONI.CodSala
WHERE SALE.Città = 'Pisa' 
AND PROIEZIONI.DataProiezione BETWEEN '2005-01-01' AND '2005-01-31'
GROUP BY SALE.Nome
HAVING SUM(PROIEZIONI.Incasso) > 20000;


