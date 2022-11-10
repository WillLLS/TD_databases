-- Exercice 2 : Requêtes

-- 1. la liste des coureurs inscrits au club USO

SELECT coureur.nom, coureur.prenom
FROM coureur 
INNER JOIN club ON coureur.idClub=club.idClub
WHERE club.nom="USO";

-- 2. La liste des événements qui ont lieu à Orléans

SELECT nom
FROM course 
WHERE lieu="Orléans";

-- 3. La liste des courses courues par Marie Duval

SELECT course.nom
FROM coureur
INNER JOIN participe ON coureur.idCoureur=participe.idCoureur
INNER JOIN course ON participe.idCourse=course.idCourse
WHERE coureur.nom="Duval" AND coureur.prenom="Marie";

-- 4. Le classement de la course senior Foulées d'Orléans

SELECT coureur.nom, coureur.prenom
FROM coureur
INNER JOIN participe ON coureur.idCoureur=participe.idCoureur
INNER JOIN course ON participe.idCourse=course.idCourse
WHERE course.nom="Foulées" 
AND course.idCat=(SELECT idCat FROM categorie WHERE nom="Senior")
ORDER BY participe.temps;