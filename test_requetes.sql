/* Requête 1 : 
Afficher la liste des noms des focaccias par ordre alphabétique croissant */
SELECT nom_focaccia
FROM focaccia
ORDER BY nom_focaccia ASC;
/* Résultat attendu : Obtenir la liste des noms des foccacias classé par ordre alphabétique croissant*/
/* Résultat obtenu : Liste classé par ordre alphabétique */ 


/* Requête 2 : 
Afficher le nombre total d'ingrédients */ 

SELECT COUNT(nom_ingredient)
FROM ingredients;
/* Résultat attendu : Obtenir le nombre total d'ingrédients */
/* Résultat obtenu : 25 */


/* Requête 3 : 
Afficher le prix moyen des focaccias */ 

SELECT AVG(prix)
FROM focaccia;
/* Résultat attendu : Prix moyen des focaccias */
/* Résultat obtenu : Prix moyen : 10,37 */


/* Requête 4 : 
Afficher la liste de boissons avec leur marque, triée par nom de boisson */

SELECT nom_boisson, nom_marque
FROM boisson
INNER JOIN marque
ON boisson.id_marque = marque.id_marque
ORDER BY nom_boisson ASC;
/* Résultat attendu : Obtenir la liste complète des boissons ainsi que leur marque triée par nom des boissons */
/* Résultat obtenu : Liste complète de toutes les boissons avec les marques à coté , triée par ordre alphabétique pour les noms des boissons */


/* Requête 5 :
Afficher la liste des ingrédients Raclaccia */

SELECT ingredients.nom_ingredient
FROM focaccia
INNER JOIN comprend
ON focaccia.id_focaccia = comprend.id_focaccia
INNER JOIN ingredients
ON comprend.id_ingredient = ingredients.id_ingredient
WHERE focaccia.nom_focaccia = 'Raclaccia';
/* Résultat attendu : Obtenir la liste d'ingrédient pour une focaccia */
/* Résultat obtenu : Liste complète d'ingrédient ( Base tomate , Raclette Cresson , Ail , Champignon, Parmesan , Poivre ) */


/* Requête 6 : 
Afficher le nom et le nombre d'ingrédients pour chaque focaccia */

SELECT focaccia.nom_focaccia,
       COUNT(comprend.id_ingredient) AS nombre_ingredients
FROM focaccia
INNER JOIN comprend
ON focaccia.id_focaccia = comprend.id_focaccia
GROUP BY focaccia.nom_focaccia;
/* Résultat attendu : Obtenir la liste de noms des focaccias ainsi que leur nombre d'ingrédients */
/* Résultat obtenu : La liste complète des focaccias ainsiq que le nombres d'ingrédients */


/* Requête 7 : 
Afficher le nom de la focaccia qui a le plus d'ingrédients */

SELECT focaccia.nom_focaccia,
       COUNT(comprend.id_ingredient) AS nombre_ingredients
FROM focaccia
INNER JOIN comprend
ON focaccia.id_focaccia = comprend.id_focaccia
GROUP BY focaccia.nom_focaccia
ORDER BY nombre_ingredients DESC
LIMIT 1;
/* Résultat attendu : Obtenir le nom de la focaccia avec le plus d'ingrédients  */
/* Résultat obtenu : Paysanne , 12 */



/* Requête 8 : 
Afficher la liste des focaccia qui contiennent de l'ail */ 

SELECT focaccia.nom_focaccia
FROM focaccia
INNER JOIN comprend
ON focaccia.id_focaccia = comprend.id_focaccia
INNER JOIN ingredients
ON comprend.id_ingredient = ingredients.id_ingredient
WHERE ingredients.nom_ingredient = 'Ail';
/* Résultat attendu : Obtenir la liste des focaccias qui contiennent de l'ail */
/* Résultat obtenu : Liste avec Mozaccia , Gorgonzollacia , Raclaccia et Paysane */



/* Requête 9 : 
Afficher la liste des ingrédients inutilisés */ 

SELECT nom_ingredient
FROM ingredients
WHERE id_ingredient NOT IN (
    SELECT id_ingredient
    FROM comprend
);
/* Résultat attendu : Liste des ingrédient inutilisés   */
/* Résultat obtenu : Salami et tomate cerise */



/* Requête 10 : 
Afficher la liste des focaccias qui n'ont pas de champignons */

SELECT nom_focaccia
FROM focaccia
WHERE id_focaccia NOT IN (
    SELECT comprend.id_focaccia
    FROM comprend
    INNER JOIN ingredients
    ON comprend.id_ingredient = ingredients.id_ingredient
    WHERE ingredients.nom_ingredient = 'Champignon'
);

/* Résultat attendu : Obtenir les focaccias qui n'ont pas de champignons */
/* Résultat obtenu : Hawaienne et Américaine */ 