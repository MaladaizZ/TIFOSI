Requete de verif de base : 

Requete 1) 
Afficher la liste des noms des focaccias par ordre alphabétiquers croissant : 
SELECT nom FROM foccacia
ORDER BY nom ASC;

Requete 2)
Afficher le nombre total d_ingredients :
SELECT COUNT(*) AS nombre_ingredients 
FROM ingredient;

Requete 3)
Afficher le prix moyen des focaccias :
SELECT ROUND(AVG(prix), 2) AS prix_moyen 
FROM foccacia;

REquete 4 ) 
Afficher la liste des boissons avec leurs marques, triées par nom de boissons
SELECT b.nom, m.nom AS Marque FROM boisson b 
INNER JOIN marque m on m.id = b.id_Marque
ORDER BY nom

REquete 5)
Afficher la liste des ingrédients pour une Racclacia
SELECT f.nom, COUNT(fi.id_ingredient) AS Nombres_ingredients
FROM foccacia f
JOIN foccacia_ingredient fi ON f.id = fi.id_foccacia
WHERE f.nom = "Raclaccia"

requete 6)
Afficher la listes des ingredients pour toutes les focciacas
SELECT f.nom, COUNT(fi.id_ingredient) AS nombre_ingredients
FROM foccacia f
JOIN foccacia_ingredient fi ON f.id = fi.id_foccacia
GROUP BY f.nom
ORDER BY f.nom;

requete 7)
Aficher le nom de la focciaca qui a le plus d_ingredient
SELECT f.nom, COUNT(fi.id_ingredient) AS nombre_ingredients
FROM foccacia f
JOIN foccacia_ingredient fi ON f.id = fi.id_foccacia
GROUP BY f.nom
ORDER BY nombre_ingredients DESC
LIMIT 1;

requete 8) 
Afficher la liste des focciacas qui contienent de l_ail 
SELECT f.nom AS foccacia
FROM foccacia f
JOIN foccacia_ingredient fi ON f.id = fi.id_foccacia
JOIN ingredient i ON fi.id_ingredient = i.id
WHERE i.nom = "ail"
ORDER BY f.nom;

requete 9)
Afficher la listes des ingrédients inutilisées
SELECT i.nom AS ingredient_non_utilise
FROM ingredient i
LEFT JOIN foccacia_ingredient fi ON i.id = fi.id_ingredient
WHERE fi.id_ingredient IS NULL;


requete 10)
afficher la liste des focciacas qui n_ont pas de champignons
SELECT f.nom AS foccacia
FROM foccacia f
WHERE f.id NOT IN (
    SELECT fi.id_foccacia
    FROM foccacia_ingredient fi
    JOIN ingredient i ON fi.id_ingredient = i.id
    WHERE i.nom = "champignon"
)
ORDER BY f.nom;


