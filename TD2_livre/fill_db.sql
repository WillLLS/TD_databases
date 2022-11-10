INSERT INTO editeurs(nom, adresse)
VALUES
    ("Belin Education", "170 bis, Boulevard du Montparnasse, 75680 Paris Cedex 14"),
    ("FOLIO", "5 rue Gaston-Gallimard 75328 Paris cedex 07 FRANCE"),
    ("Flammarion", "rue Saint-Lazare CS 10124 75009 Paris");


INSERT INTO livres
VALUES
    (1001, "Le Parti pris des choses", STR_TO_DATE("18/08/2021", "%d/%m/%Y"), 10, 1),
    (1002, "Paroles", STR_TO_DATE("10/09/1976", "%d/%m/%Y"), 20, 2),
    (1003, "Histoires", STR_TO_DATE("09/06/1972", "%d/%m/%Y"), 2, 2),
    (1004, "La Peau de chagrin", STR_TO_DATE("09/06/1972", "%d/%m/%Y"), 100, 3);

INSERT INTO auteurs(nom, prenom, adresse)
VALUES 
    ("Ponge", "Francis", "unknown"),
    ("Prevert", "Jacques", "unknown"),
    ("de Balzac", "Honore", "unknown"),
    ("Baudelaire", "Charles", "unknown");

INSERT INTO ecrit
VALUES
    (1001, 1),
    (1001, 2),
    (1002, 2),
    (1003, 2),
    (1003, 4),
    (1004, 3);

INSERT INTO utilisateur(nom, prenom, adresse, email)
VALUES
    ("Dupond", "Hugo", "125 rue des cailloux", "superdupond45@gmail.com"),
    ("Lefevre", "Pat", "14 rue du haut des cours", "omomi@free.fr"),
    ("Lagaffe", "Gaston", "unknown", "unknwon"),
    ("Jean", "Jean", "1 rue de jean", "jean@jean.fr"),
    ("Durand", "Charlie", "unknown", "unknown");

INSERT INTO emprunt
VALUES 
    (1002, 1, STR_TO_DATE("09/06/2012", "%d/%m/%Y"), STR_TO_DATE("09/12/2012", "%d/%m/%Y"), STR_TO_DATE("09/08/2012", "%d/%m/%Y")),
    (1003, 1, STR_TO_DATE("09/06/2012", "%d/%m/%Y"), STR_TO_DATE("09/12/2012", "%d/%m/%Y"), STR_TO_DATE("01/01/2013", "%d/%m/%Y")),
    (1004, 1, STR_TO_DATE("09/06/2012", "%d/%m/%Y"), STR_TO_DATE("09/12/2012", "%d/%m/%Y"), STR_TO_DATE("09/08/2012", "%d/%m/%Y")),
    (1002, 1, STR_TO_DATE("01/01/2018", "%d/%m/%Y"), STR_TO_DATE("01/03/2018", "%d/%m/%Y"), STR_TO_DATE("23/08/2020", "%d/%m/%Y")),
    (1002, 2, STR_TO_DATE("01/01/2015", "%d/%m/%Y"), STR_TO_DATE("01/06/2015", "%d/%m/%Y"), STR_TO_DATE("01/08/2016", "%d/%m/%Y")),
    (1004, 4, STR_TO_DATE("23/09/2021", "%d/%m/%Y"), STR_TO_DATE("23/06/2022", "%d/%m/%Y"), STR_TO_DATE("09/10/2022", "%d/%m/%Y"));