REQUETES SQL --- TEST --- JABIE KARAMBA


-- question 1 : Affichez le nom des agences
SELECT nom as liste_des_agence
FROM agence


-- question 2 : Affichez le numéro de l’agence « Orpi »

SELECT idAgence as numero_agence_orpi
FROM agence
WHERE nom = "orpi"


-- question 3 :  Affichez le premier enregistrement de la table logement.

SELECT * 
FROM logement
LIMIT 1


-- question 4 : Affichez le nombre de logements (Alias : Nombre_de_logements).

SELECT COUNT(*) as nombre_logement 
FROM logement;


 -- question 5 : Affichez les logements à vendre à moins de 150 000 € dans l’ordre croissant des prix.

SELECT * FROM logement
WHERE prix < 150000 
ORDER BY prix ASC;


 -- question 6  : Affichez le nombre de logements à la location (alias : nombre)

SELECT COUNT(*) as nombre_logement_location
FROM logement 
WHERE categorie = "location"
 
 
 -- question 7 : Affichez les villes différentes recherchées par les personnes demandeuses d'un logement

SELECT ville as ville_ou_des_logements_sont_recherche
FROM logement
WHERE categorie = "vente"
GROUP BY ville
 
 -- Question 8 : Affichez le nombre de biens à vendre par ville
 
SELECT COUNT(categorie) as bien_en_vente, ville
FROM demande
WHERE categorie = "vente" 
GROUP BY ville

 
 -- question 9 :  Quelles sont les id des logements destinés à la location ?

SELECT idLogement as bien_en_vente
FROM logement
WHERE categorie = "location" 

        
-- question 10 : Quels sont les id des logements entre 20 et 30m² ?

SELECT idLogement as id_logement_entre_20_30_m2
FROM logement
WHERE  superficie BETWEEN 30 and 40 
 

-- question 11 : Quel est le prix vendeur (hors commission) du logement le moins cher à vendre ? (Alias : prix minimum)

SELECT MIN(prix) as prix_minimum
FROM logement
 
-- question 12 : Dans quelle ville se trouve les maisons à vendre ?


SELECT ville as ville_ou_des_maisons_sont_a_vendre
FROM logement
WHERE genre = "maison" and categorie = "vente"        


-- question 13 : Affichez le nombre de propriétaires dans la ville de Paris (Alias : Nombre)

SELECT COUNT(categorie)
FROM logement
WHERE logement = "vente"

            
-- question 14 : Affichez le prénom du vendeur pour le logement ayant la référence « 5770 »

SELECT prenom
FROM personne
WHERE idPersonne = 5770;


-- Question 15 : Affichez les prénoms des personnes souhaitant acheter un logement de la plus grande à la plus petite superficie

SELECT idPersonne, prenom
FROM demande
WHERE categorie = "vente"
ORDER BY superficie DESC
INNER JOIN personne ON demande.idPersonne = personne.idPersonne

                
 -- Question 16 : Quel sont les prix finaux proposés par les agences pour la maison à la vente ayant la référence « 5091 » ? (Alias : prix frais d'agence inclus)   
 
SELECT SUM(frais) 
FROM logement_agence
WHERE idLogement = 5091
UNION ALL( 
SELECT SUM(prix)
FROM logement
WHERE idLogement = 5091);









          
          
          
 