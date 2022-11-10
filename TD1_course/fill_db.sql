INSERT INTO categorie(nom)
VALUES
    ("Junior"),
    ("Senior");

INSERT INTO club(nom)
VALUES
    ("USO"),
    ("ASM");

INSERT INTO coureur(nom, prenom, idClub, idCat)
VALUES
    ("Dupont", "Jean", 2, 1),
    ("Durand", "Paul", 2, 2),
    ("Martin", "Pierre", 2, 1),
    ("Duval", "Marie", 1, 2),
    ("Fevrier", "Sonia", 1, 1);

INSERT INTO course(nom, date_, heure, lieu, idCat)
VALUES
    ("Foulées", STR_TO_DATE("12/12/15", "%d/%m/%y"), "13:00:00", "Orléans", 2),
    ("Corrida", STR_TO_DATE("25/12/15", "%d/%m/%y"), "09:00:00", "Olivet", 2),
    ("Corrida", STR_TO_DATE("25/12/15", "%d/%m/%y"), "11:00:00", "Olivet", 1),
    ("Cross'O", STR_TO_DATE("10/01/16", "%d/%m/%y"), "09:00:00", "Orléans", 1),
    ("Vite-Tours", STR_TO_DATE("18/03/16", "%d/%m/%y"), "09:00:00", "Tours", 1),
    ("Vite-Tours", STR_TO_DATE("18/03/16", "%d/%m/%y"), "10:00:00", "Tours", 2);

INSERT INTO participe(idCoureur, idCourse, temps)
VALUES
    (1, 1, "00:12:32"),
    (2, 1, "00:12:36"),
    (1, 2, "00:24:01"),
    (3, 2, "00:23:41"),
    (4, 3, "00:11:53"),
    (4, 4, "00:08:59"),
    (5, 4, "00:08:21");
    