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


insert into Type_Artistes values
                        (default,'musicien'),                        
                        (default,'peintre'),                           
                        (default,'danseur'),                          
                        (default,'photographe'),
                        (default,'comédien'),                            
                        (default,'humoriste'),                           
                        (default,'sculpteur'),                           
                        (default,'chanteur'),                           
                        (default,'ecrivain'),                          
                        (default,'poete'),                          
                        (default,'realisateur'),
                        (default,'styliste'),
                        (default,'designer'),
                        (default,'mannequin'),
                        (default,'sportif'),
                        (default,'rappeur'),
                        (default,'cirque'),
                        (default,'decorateur interieur'),
                        (default,'architecte'),
                        (default,'producteur'),
                        (default,'scenariste'),
                        (default,'animatrice television'),
                        (default, 'acteur');

insert into Contrats values
                        (default,0.04),                   
                        (default,0.06),                      
                        (default,0.1),                          
                        (default,0.2);

insert into Salles values
                (default,'Salle de réception'),                   
                (default,'Salle de concert'),                       
                (default,'Salle de cinéma'),                          
                (default,'Salle de mariage'),                          
                (default,'Salle de fêtes'),                       
                (default,'Salle de théatre'),
                (default,'Stade'),
                (default,'Opéra'),
                (default,'Péniche'),
                (default,'Chateau'),
                (default,'Péniche'),
                (default,'Loft'),
                (default,'Galerie d art'),
                (default,'Showroom'),
                (default,'Bar'),
                (default,'Discothèque'),
                (default,'Club');
                
insert into Comptes_Clients values
                (default,'IamCardiB','Marlenis Almanzar','Belcalis','Cardi B','11-10-1992','F','509.6995','cardiB@gmail.com'),                    
                (default,'EdithP','Piaf','Edith','Edith Piaf','12-12-1985','F','06.62.44.85.95','edithPro@live.fr'),                     
                (default,'Jlo','Lopez','Jennifer','Jennifer Lopez','24-07-1969','F','555.6587','Jlopez@gmail.com'),                         
                (default,'PabloP','Picasso','Pablo','Pablo Picasso','8-04-1973','M','00.34.824.65.43.21','jesuismort@RIP.com'),                          
                (default,'KarlK','Lagerfeld','Karl','Karl Lagerfeld','10-09-1933','M','508.7955','jesuismort@maisTQT.com'),                   
                (default,'A.Jolie','Jolie','Angelina','Angelina Jolie','4-06-1975','F','523.6542','Angelina.JolieJolie@gmail.com'),                      
                (default,'A.Lima','Lima','Adriana','Adriana Lima','12-06-1981','F','612.2657','Lima.Adrian@google.com'),                                                
                (default,'BiBi','Cosby','Bill','Bill Cosby','12-07-1937','M','555.4582','Cosby.show@google.com'),
                (default,'V.damidot','damidot','valérie','Valerie Damidot','18-01-1965','F','06.96.87.45.21','Valerie.decoration@live.fr'),                        
                (default,'Hanoune','Hanouna','Cyril','Cyril Hanouna','23-01-1974','M','06.45.47.85.85','C.hanounaPro@hotmail.fr'),                            
                (default,'Titi','Burton','Tim','Tim Burton','25-08-1958','M','526.1254','titi.burton@live.com'),                           
                (default,'MickyJack','Jackson','Michael','Michael Jackson','29-08-1958','M',NULL,'jacksonFive@yahoo.com'),                           
                (default,'Itzhak.P','Perlam','Itzhak','Itzhak Perlam','31-08-1945','M',NULL, 'Itzhak.perlman@gmail.com'),
                (default,'GG', 'Gulan', 'Genco' , 'Genco Gulan', '31-03-1987','M', '06.25.46.31.', 'GGSulpture@gmail.com'),                       
                (default,'SyllaA', 'Sylla', 'Ahmed' , 'Ahmed Sylla', '14-03-1989','M','06.14.12.17.18', 'sylla@live.com'),                        
                (default,'RG.Family', 'Ronald', 'Georges' ,'The RG Family', '04-03-1958','M','06.14.85.89.18', 'RG.Comedie@gmail.com'),                        
                (default,'M.bruce', 'Bruce', 'Marshall' ,'Eminem', '17-10-1969','M','556.2458', 'planeteRAP@google.com');                       

insert into Artistes values
                (1,16),
                (2,8),
                (3,8),
                (4,2),
                (5,12),
                (6,23),
                (7,14),
                (8,18),
                (9,22),
                (10,6),
                (11,11),
                (12,3),
                (13,1),
                (14,7),
                (15,6),
                (16,5),
                (17,16);

insert into Ville values
                (default,'Paris'),
                (default,'Marseille'),
                (default,'Lyon'),
                (default,'Bordeaux'),
                (default,'Nice'),
                (default,'Lille'),
                (default,'Toulouse'),
                (default,'Grenoble'),
                (default,'Strasbourg'),
                (default,'Nimes'),
                (default,'Versaille');

insert into Lieu_production values
                (default,'Le Zenith Paris','Avenue Jean Jaures',1),
                (default,'Peniche Abysse', 'quai Francois Mauriac', 1),
                (default,'Theatre le Bourvil', 'rue des Boulets', 1),
                (default,'Showroom Artmid', 'rue des balais', 10),
                (default,'Diamonds Club', 'Rue de Bulle', 7),
                (default,'Chateau Versaille', 'Place Armes', 11),
                (default,'Residence T-Loft', 'Rue Georges Sand', 8),
                (default,'Aragon Ballroom', 'Avenue docteur gley', 8),
                (default,'Resort El Gouna','avenue francois', 3),
                (default,'Villa Michelangelo Vicenza', 'rue bougainville', 2),
                (default,'Le Clara One', 'quai de la liberté', 5),
                (default,'Arkea Arena', 'rue alfonso', 4),
                (default,'Stade de France', 'rue saint denis', 1),
                (default,'Palais des glaces', 'rue faubourg du temple', 1);

insert into Capacite_salle values
                        (1,2,1000),
                        (2,11,130),
                        (3,6,250),
                        (4,14,300),
                        (5,17,100),
                        (6,10,270),
                        (7,12,80),
                        (8,5,120),
                        (9,13,70),
                        (10,4,200),
                        (11,16,300),
                        (12,2,700);

insert into Evenement values
                        (default,1,'20-12-2019',1, '18:30', '23:45'), -- client 1 et 12 pour id lieu 1 
                        (default,1,'24-12-2019',1, '22:00', '23:00'),
                        (default,12,'26-12-2019',1, '14:30', '18:00'),
                        (default,12,'02-01-2020',1, '14:30', '18:00'),

                        (default,10,'02-02-2020',2, '17:30', '23:55'),
                        (default,2,'24-12-2019',2, '14:30', '22:45'),

                        (default,10, '02-02-2020',3, '15:45', '22:00'),
                        (default,10, '04-02-2020',3, '19:45', '22:00'),
                        (default,10, '05-02-2020',3, '19:45', '22:00'),
                        (default,15, '03-02-2020',3, '20:30', '23:30'),
                        (default,15, '06-02-2020',3, '20:30', '23:45'),
                        (default,16, '13-03-2020',3, '12:30', '23:30'),
                        (default,16, '15-03-2020',3, '21:30', '23:56'),

                        (default,5, '18-05-2020',4, '11:30', '23:55'),

                        (default,1, '18-05-2020',5, '21:30', '23:55'),
                        (default,3, '18-05-2020',5, '23:30', '23:55'),
                        (default,17, '18-06-2020',5, '22:00', '23:55'),
                        (default,17, '19-06-2020',5, '22:00', '23:55'),

                        (default,14, '04-04-2020',6, '11:00', '16:30'),
                        (default,14, '05-04-2020',6, '13:00', '23:55'),
                        (default,4, '04-04-2020',6, '18:00', '23:55'),
                        (default,4, '08-04-2020',6, '14:00', '23:55'),

                        (default,9, '18-04-2020',7, '14:00', '23:55'),

                        (default,14, '18-03-2020',10, '11:00', '18:00'),
                        (default,14, '19-03-2020',10, '11:30', '18:30'),
                        (default,14, '20-03-2020',10, '14:00', '20:00'),

                        (default,3, '14-03-2020',12, '21:00', '23:50'),
                        (default,3, '15-03-2020',12, '21:30', '23:50'),
                        (default,3, '16-03-2020',12, '21:30', '23:50'),

                        (default,15, '16-03-2020',14, '18:30', '23:55'),
                        (default,15, '15-01-2020',14, '17:30', '23:55');


insert into Renumeration values(1,1, 300000,4),
                        (3,27,300000,4),
                        (3,28,350000,4),
                        (3,29,300000,4),

                        (4,21,800,1),
                        (4,22,600,1),

                        (5,14,40000,2),

                        (9,23,500,1),
                        (10,5,900,1), -- client 10 =  Cosby evenement 5,7,8,9 sur lieu= péniche(default,evenement 5), théatre bourvil 3 fois)
                        (10,7,2000,2),
                        (10,8,2000,2),
                        (10,9,2000,2),
                        (12,3,400000,4), -- client 12 = M Jackson, evenement 3 et 4 lieu = zenith *2 
                        (12,4,400000,4),

                        (14,19,300,1),
                        (14,20,500,1),
                        (14,24,450,1),
                        (14,25,600,1),
                        (14,26,200,1),

                        (15,10,300,1),
                        (15,11,300,1),
                        (15,30,250,1),
                        (15,31,250,1),

                        (16,12,1500,2),
                        (16,13,1500,2),

                        (17,17,600000,4),
                        (17,18,650000,4);

