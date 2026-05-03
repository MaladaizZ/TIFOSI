script d'insertions de données :

--Marque -- :
INSERT INTO marque(nom)
Values ("Coca-cola"), ("Cristalline"),("Monster"),("Pepsico");

--Boisson --  :
INSERT INTO boisson( nom, id_marque)
Values ("coca-cola zero",1),("Coca-cola original", 1),("Fanta citron",1),("Fanta orange",1),("capri-sun",1),("Pepsi",2),("Pepsi Max Zéro",2),("Lipton zéro citron",2),
("Lipton peach",2),("Monster energy ultra gold",3),("Monster energy ultra blue",3),("eau de source",4);  


--Ingredient -- : 
INSERT INTO ingredient (nom)
Values ("ail"),("ananas"),("artichaud"),("bacon"),("base tomate"),("base crème"),("champignon"),("chevre"),("cresson"),("emmental"),
("gorgonzola"),("jambon cuit"),("jambon fumé"),("oeuf"),("oignon"),("olive noire"),("olive verte"),("parmesan"),("piment"),("poivre"),
("pomme de terre"),("raclette"),("salami"),("tomate cerise"),("mozarella");

--Foccaccia -- :
INSERT INTO foccacia (nom,prix)
Values ("Mozaccia",9.80),("Gorgozonllaccia",10.80),("Raclaccia",8.90),("emmentalaccia",9.80),("Tradizione",8.90),("Hawaienne",11.20),
("Américaine",10.80),("Paysanne",12.80);

-- Table de jointure focaccia_ingredient --
INSERT INTO foccacia_ingredient (id_foccacia, id_ingredient) VALUES
-- Mozaccia (1) : Base tomate, Mozarella, cresson, jambon fumé, ail, artichaut, champignon, parmesan, poivre, olive noire
(1,5),(1,25),(1,9),(1,13),(1,1),(1,3),(1,7),(1,18),(1,20),(1,16),

-- Gorgonzollaccia (2) : Base tomate, Gorgonzola, cresson, ail, champignon, parmesan, poivre, olive noire
(2,5),(2,11),(2,9),(2,1),(2,7),(2,18),(2,20),(2,16),

-- Raclaccia (3) : Base tomate, raclette, cresson, ail, champignon, parmesan, poivre
(3,5),(3,22),(3,9),(3,1),(3,7),(3,18),(3,20),

-- Emmentalaccia (4) : Base crème, Emmental, cresson, champignon, parmesan, poivre, oignon
(4,6),(4,10),(4,9),(4,7),(4,18),(4,20),(4,15),

-- Tradizione (5) : Base tomate, Mozarella, cresson, jambon cuit, champignon, parmesan, poivre, olive noire, olive verte
(5,5),(5,25),(5,9),(5,12),(5,7),(5,18),(5,20),(5,16),(5,17),

-- Hawaienne (6) : Base tomate, Mozarella, cresson, bacon, ananas, piment, parmesan, poivre, olive noire
(6,5),(6,25),(6,9),(6,4),(6,2),(6,19),(6,18),(6,20),(6,16),

-- Américaine (7) : Base tomate, Mozarella, cresson, bacon, pomme de terre, parmesan, poivre, olive noire
(7,5),(7,25),(7,9),(7,4),(7,21),(7,18),(7,20),(7,16),

-- Paysanne (8) : Base crème, Chèvre, cresson, pomme de terre, jambon fumé, ail, artichaut, champignon, parmesan, poivre, olive noire, oeuf
(8,6),(8,8),(8,9),(8,21),(8,13),(8,1),(8,3),(8,7),(8,18),(8,20),(8,16),(8,14);

--Avoir la liste des foccaccias -- : 
SELECT f.id AS id_focaccia, f.nom AS nom_focaccia, f.prix,
GROUP_CONCAT(i.nom ORDER BY i.nom SEPARATOR ', ') AS ingredients
FROM foccacia f
INNER JOIN foccacia_ingredient fi ON f.id = fi.id_foccacia
INNER JOIN ingredient i ON fi.id_ingredient = i.id
GROUP BY f.id, f.nom, f.prix
ORDER BY f.id;