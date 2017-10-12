INSERT INTO `repertoire_principal` (`idRepertoire_Principal`,`chemin`) VALUE
(1,'C:/data/');

INSERT INTO `chemin_donnees` (`idChemin_Donnees`,`type`,`path`,`FkRepertoire_Principal`) VALUE
(1,'Null','corbeille/Documentation',1),
(2,'Null','corbeille/Word',1),
(3,'Null','corbeille/Excel',1);

INSERT INTO `fichier_corbeille` (`idFichierCorbeille`,`nom`,`FkChemin_Donnees`) VALUE
(1,'Critères pour les paniers.pdf',1),
(2,'Liste des indicateurs.pdf',1),
(3,'Film.docx',2),
(4,'Jeux PC.docx',2),
(5,'302_15_1.xlsx',3),
(6,'302_20.xlsx',3);
