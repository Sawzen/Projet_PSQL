-- Requete 1.  
    select min(jour+1) as dispo,nom_scene from evenement natural join comptes_clients where (jour+1) not in (select jour from evenement natural join comptes_clients where nom_scene = 'Ahmed Sylla') and nom_scene = 'Ahmed Sylla' group by nom_scene;
        -- Dans notre cas, on considere que le premier jour libre d'un artiste est le premier jour apres un evenement où il est programmé.
        -- Par exemple si Cardi B est planifié le 16/02 le 18/03, alors son premier jour dispo est le 17 (16+1), les jours avant le 16, elle serait occupée


-- Requete 2. Liste des salles proposant pour tel artiste un cachet supérieur à 1000 euros. 
    select distinct nom_scene, type_salle as salle_avec_cachet_sup_1000£ from comptes_clients natural join renumeration natural join evenement natural join capacite_salle natural join salles where cachet > 1000;
        -- requete 2) bis select type_salle, cachet, nom_scene from renumeration natural join comptes_clients natural join evenement natural join capacite_salle natural join salles where nom_scene = 'Cardi B' and cachet > 1000; -- cette requete est la meme que la précedente mais en choisissant un artiste particulier.


-- Requete 3. Rentabilité d’un artiste particulier sur le dernier mois. ici en l'occurence Ahmed Sylla
    select sum(cachet) as rentabilite_artiste from renumeration natural join comptes_clients natural join evenement where nom_scene = 'Ahmed Sylla' and (jour between (current_date-30) and CURRENT_DATE);


-- Requete 4. Temps de travail d’un artiste particulier sur l’année écoulée
    select sum(heure_fin - heure_debut) as temps_moyen_de_travail from comptes_clients natural join evenement where nom_scene = 'Cardi B';
        --- requete 4) bis  select sum(heure_fin - heure_debut) as temps_moyen_de_travail from comptes_clients natural join evenement where nom_scene = 'Pablo Picasso';



-- Requete 5. Cachet moyen d’un artiste particulier.
    select nom,prenom, round(avg(cachet),2) as cachet_moyen_artiste from renumeration natural join comptes_clients where nom_scene = 'Eminem' group by nom, prenom;
        -- requete 5) bis select nom,prenom, round(avg(cachet),2) from renumeration natural join comptes_clients where nom_scene = 'Bill Cosby' group by nom, prenom;


-- Requete 6. Chiﬀre d’aﬀaire généré au cours du mois dernier par tous les artistes.
    select nom_scene,sum(cachet) as chiffre_affaire from renumeration natural join evenement natural join comptes_clients where jour between current_date-30 and current_date group by nom_scene ;
