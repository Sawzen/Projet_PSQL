-- quelques exemples de requetes parametrées :
    -- Nombre d'evenement dans une ville donnée
        PREPARE nb_evnmt_par_ville(TEXT) as SELECT count(id_evenement) as nb_evenement from ville natural join lieu_production natural join evenement WHERE nom_ville = $1 group by nom_ville;
            EXECUTE nb_evnmt_par_ville('Marseille');

    -- Planning d'un artiste donné
        PREPARE planning(TEXT) as select nom_scene, id_evenement, nom_lieu, jour from comptes_clients natural join evenement natural join lieu_production where nom_scene = $1 group by nom_scene, id_evenement, nom_lieu;
            EXECUTE planning('Eminem');

 -- inscription d'un nouvel artiste :
        PREPARE nouveau_client(TEXT) as insert into comptes_clients(nom, prenom,sexe, e_mail) values($1,$2,$3,$4);
                EXECUTE nouveau_client('Diallo', 'Grace','F','gadia@gm.com'); 

-- ajout d'une salle :
    PREPARE ajout_salle(VARCHAR) as insert into salles(type_salle) values($1);
        EXECUTE ajout_salle(gymnase);

-- ajout d'un nouveau type d'artiste :
    PREPARE new_typeAr(VARCHAR) as insert into type_artistes(type_artistes) values ($1);
        EXECUTE new_typeAr('violoniste');

-- mise à jour des données d'un artiste :                     
    PREPARE mise_a_jour(VARCHAR, INTEGER) as UPDATE comptes_clients set numero_telephone=$1, e_mail=$2 where id_client=$3;
        EXECUTE mise_a_jour('555.5555','fyaqkhjd@gd.fr',13);

-- changement de contrats :
-- on va prendre un artiste eminem id_client 17, evenement 17 son cachet est de 600000 euros avec une commision de 0.2 on va changer la commission à 0.1
        PREPARE new_contrat(integer) as UPDATE renumeration set id_contrat=$1 where id_client=$2 and id_evenement=$3;
            id

-- suppression de compte : A TESTER/ marche pas
PREPARE supp_client(VARCHAR) as delete cascade from comptes_clients where nom_scene = $1;
EXECUTE supp_client('Karl Lagerfeld');

