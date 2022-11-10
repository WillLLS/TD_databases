-- TD2 - William Lalis - 09/11/2022

-- Question 3.a
SELECT ISBN, titre, editeurs.nom, nombre FROM livres, editeurs WHERE livres.idEditeur=editeurs.idEditeur;

-- Question 3.b
SELECT titre, utilisateur.nom, utilisateur.prenom, emprunt.d_emprunt FROM livres 
INNER JOIN emprunt ON livres.ISBN=emprunt.ISBN 
INNER JOIN utilisateur ON emprunt.idUser=utilisateur.idUser;

-- Question 3.c
SELECT livres.titre, DATEDIFF(emprunt.d_retour, emprunt.d_emprunt) AS retard, utilisateur.nom
FROM livres
INNER JOIN emprunt ON livres.ISBN=emprunt.ISBN 
INNER JOIN utilisateur ON emprunt.idUser=utilisateur.idUser
WHERE DATEDIFF(emprunt.d_retour, emprunt.d_emprunt) > DATEDIFF(emprunt.d_limit, emprunt.d_emprunt);

-- Quesstion 4.a
SELECT livres.ISBN, livres.titre, editeurs.nom, livres.nombre
FROM livres
LEFT OUTER JOIN emprunt ON livres.ISBN=emprunt.ISBN
INNER JOIN editeurs ON livres.idEditeur=editeurs.idEditeur
WHERE emprunt.ISBN IS NULL;

-- Question 4.b
CREATE OR REPLACE VIEW all_book AS
SELECT livres.titre, livres.ISBN, emprunt.idUser
FROM livres
LEFT JOIN emprunt ON emprunt.ISBN=livres.ISBN;

SELECT DISTINCT titre
FROM all_book
WHERE idUser!=(SELECT u.idUser FROM utilisateur AS u WHERE u.nom="Durand")
OR idUser IS NULL;

-- Question 4.c

CREATE OR REPLACE VIEW view_count AS
SELECT ISBN, COUNT(idAuteur) AS c
FROM ecrit
GROUP BY ISBN;

CREATE OR REPLACE VIEW isbn_auteur AS
SELECT ISBN, idAuteur
FROM ecrit
WHERE ISBN IN 
    (SELECT ISBN
    FROM view_count
    WHERE c=2);

SELECT A1.nom, A1.prenom, A2.nom, A2.prenom
FROM isbn_auteur a1
INNER JOIN isbn_auteur a2 ON a1.ISBN=a2.ISBN
INNER JOIN auteurs A1 ON A1.idAuteur=a1.idAuteur
INNER JOIN auteurs A2 ON A2.idAuteur=a2.idAuteur
WHERE a1.idAuteur > a2.idAuteur;

-- Question 4.d

CREATE OR REPLACE VIEW aut_edit AS
SELECT a.idAuteur, l.idEditeur
FROM auteurs a
INNER JOIN ecrit w ON a.idAuteur=w.idAuteur
INNER JOIN livres l ON l.ISBN=w.ISBN;

CREATE OR REPLACE VIEW aut_edit_inter AS
SELECT ae1.idAuteur, COUNT(ae1.idEditeur) AS c
FROM aut_edit ae1
INNER JOIN aut_edit ae2 ON ae1.idAuteur=ae2.idAuteur
WHERE ae1.idEditeur=ae2.idEditeur
GROUP BY ae1.idAuteur;

select auteurs.nom
FROM aut_edit_inter aei
INNER JOIN auteurs ON aei.idAuteur=auteurs.idAuteur
WHERE c>1;

-- Question 5.a

SELECT u.prenom, l.titre, COUNT(*) AS nbPret
from utilisateur u
INNER JOIN emprunt e ON e.idUser=u.idUser
INNER JOIN livres l ON l.ISBN=e.ISBN
GROUP BY u.prenom, l.titre;

-- Question 5.b

SELECT l.titre, COUNT(e.idUser) AS NumberOFfBorrow
from livres l
LEFT JOIN emprunt e ON l.ISBN=e.ISBN
GROUP BY l.ISBN
ORDER BY NumberOFfBorrow DESC;  

-- Question 5.c

SELECT a.nom, a.prenom, COUNT(idUser) AS nbTotalEmprunté
FROM auteurs a
INNER JOIN ecrit e ON a.idAuteur=e.idAuteur
INNER JOIN livres l ON e.ISBN=l.ISBN
INNER JOIN emprunt ep ON ep.ISBN=l.ISBN
GROUP BY a.idAuteur
ORDER BY nbTotalEmprunté DESC;

-- Question 6.a

CREATE OR REPLACE VIEW sort_book AS
SELECT a.nom, l.titre -- a.nom, l.titre, e.ISBN
FROM auteurs a
LEFT JOIN ecrit e ON a.idAuteur=e.idAuteur
LEFT JOIN livres l ON e.ISBN=l.ISBN
LEFT JOIN emprunt ON emprunt.ISBN=l.ISBN
WHERE d_emprunt IS NULL;

CREATE OR REPLACE VIEW view_borrow AS
SELECT s1.nom, COUNT(*) AS NeverBorrowCount
FROM sort_book s1
INNER JOIN sort_book s2 ON s1.nom=s2.nom
WHERE s1.titre=s2.titre
GROUP BY s1.nom;

SELECT * FROM view_borrow;

-- Question 6.b

SELECT nom FROM view_borrow
WHERE NeverBorrowCount=(SELECT MAX(NeverBorrowCount) FROM view_borrow);

-- Question 6.c

CREATE OR REPLACE VIEW max_late AS
SELECT u.idUser, MAX(DATEDIFF(e.d_retour, e.d_emprunt)) AS maxLate
FROM utilisateur u 
INNER JOIN emprunt e ON u.idUser=e.idUser
GROUP BY u.idUser;

CREATE OR REPLACE VIEW nb_emprunt AS
SELECT u.idUser, COUNT(*) AS nbEmprunt
FROM utilisateur u 
INNER JOIN emprunt e ON u.idUser=e.idUser
GROUP BY u.idUser;

CREATE OR REPLACE VIEW isbn_late AS
SELECT u.idUser, e.ISBN, DATEDIFF(e.d_retour, e.d_emprunt) AS late
FROM utilisateur u
INNER JOIN emprunt e ON u.idUser=e.idUser;

SELECT ml.idUser, nbe.nbEmprunt, ml.maxLate, isbn_late.ISBN
FROM max_late ml
INNER JOIN nb_emprunt nbe ON ml.idUser=nbe.idUser
INNER JOIN isbn_late ON ml.maxLate=isbn_late.late;
