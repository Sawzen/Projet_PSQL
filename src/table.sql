drop table if exists Renumeration ;
drop table if exists Evenement ;
drop table if exists Capacite_salle ;
drop table if exists Lieu_production ;
drop table if exists Ville ;
drop table if exists Artistes ;
drop table if exists Comptes_Clients ;
drop table if exists Salles ;
drop table if exists Contrats ;
drop table if exists Type_Artistes ;

CREATE TABLE Type_Artistes(id_artiste SERIAL PRIMARY KEY,
                    type_artistes TEXT NOT NULL);

CREATE TABLE Contrats (
                id_contrat SERIAL PRIMARY KEY,
                commission FLOAT  NOT NULL,
                CHECK (commission IN (0.04, 0.06, 0.1, 0.2))
        );


CREATE TABLE Salles(id_salle SERIAL PRIMARY KEY,
                    type_salle TEXT NOT NULL
                    );


CREATE TABLE Comptes_Clients(id_client SERIAL PRIMARY KEY,
                            pseudo TEXT ,
                            nom TEXT,
                            prenom TEXT,
                            nom_scene TEXT,
                            date_naissance DATE,
                            sexe TEXT,
                            numero_telephone TEXT,
                            e_mail TEXT NOT NULL
                            CHECK (sexe IN ('F', 'M')));


CREATE TABLE Artistes(id_client INTEGER REFERENCES Comptes_Clients,
                     id_artiste INTEGER REFERENCES Type_Artistes
                     );


CREATE TABLE Ville(id_ville SERIAL PRIMARY KEY,
                    nom_ville TEXT);


CREATE TABLE Lieu_production(id_lieu SERIAL PRIMARY KEY,
                            nom_lieu TEXT,
                            adresse TEXT UNIQUE,                         
                            id_ville INTEGER REFERENCES Ville
                            );


CREATE TABLE Capacite_salle(id_lieu INTEGER REFERENCES Lieu_production,
                            id_salle INTEGER REFERENCES Salles,
                            capacite INTEGER,
                            PRIMARY KEY(id_lieu, id_salle)
                            );

CREATE TABLE Evenement(id_evenement SERIAL PRIMARY KEY,
                        id_client INTEGER REFERENCES Comptes_Clients,
                        jour  DATE,
                        id_lieu INTEGER REFERENCES Lieu_production,
                        heure_debut TIME,
                        heure_fin TIME,
                        CHECK (heure_debut < heure_fin));

CREATE TABLE Renumeration(
                          id_client INTEGER REFERENCES Comptes_Clients,
                          id_evenement INTEGER REFERENCES Evenement,
                          cachet INTEGER,
                          id_contrat INTEGER REFERENCES Contrats,
                          PRIMARY KEY(id_client, id_evenement)
);





























