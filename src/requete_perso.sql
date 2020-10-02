-- Requete 1. Ville et adresse  où on a la salle avec la plus grande capacité
    select nom_ville as ville_max, type_salle, capacite as capacite_max, adresse from ville natural join lieu_production natural join salles natural join capacite_salle where capacite  = (select max(capacite) from capacite_salle);


-- Requete 2. Evenement par artiste
    select nom_scene,id_evenement, nom_lieu, heure_debut from comptes_clients natural join (evenement natural join lieu_production) group by id_evenement, nom_scene, nom_lieu order by id_evenement;


-- Requete 3. Cachet moyen par artiste
select nom_scene, type_artistes, round(avg(cachet),2) as salaire_moy from type_artistes natural join artistes natural join comptes_clients natural join renumeration group by nom_scene, type_artistes;


-- Requete 4. Artiste feminine qui gagne plus.
select distinct nom_scene, round(avg(cachet),2) from comptes_clients natural join renumeration where sexe = 'F' group by nom_scene, cachet having avg(cachet) >= ALL (select avg(cachet) from renumeration natural join comptes_clients where sexe='F' group by nom_scene);

-- Requete 5. Benefice pour un evenement
select id_evenement, cachet*commission as benefice from renumeration natural join contrats where id_evenement = 1 group by id_client,id_evenement, cachet, commission;
