-----------Proiect-------------

--2.creare schema conceptuala
DROP TABLE Clienti CASCADE CONSTRAINTS;
SELECT * FROM Clienti;

CREATE TABLE Clienti (
    id_client NUMBER PRIMARY KEY,
    nume VARCHAR2(50) NOT NULL,
    prenume VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    telefon VARCHAR2(20),
    adresa VARCHAR2(200),
    data_inregistrare DATE
);
DROP TABLE Categorie CASCADE CONSTRAINTS;
SELECT * FROM Categorie;
CREATE TABLE Categorie (
    id_categorie NUMBER PRIMARY KEY,
    denumire VARCHAR2(100) NOT NULL,
    descriere VARCHAR2(200),
    id_categorie_parinte NUMBER,
    CONSTRAINT fk_categorie_parinte
        FOREIGN KEY (id_categorie_parinte)
        REFERENCES Categorie(id_categorie)
);
DROP TABLE Furnizor CASCADE CONSTRAINTS;
SELECT * FROM Furnizor;
CREATE TABLE Furnizor (
    id_furnizor NUMBER PRIMARY KEY,
    denumire VARCHAR2(100) NOT NULL,
    tara VARCHAR2(50),
    email_contact VARCHAR2(100),
    telefon VARCHAR2(20)
);
DROP TABLE Produs CASCADE CONSTRAINTS;
SELECT * FROM Produs;
CREATE TABLE Produs (
    id_produs NUMBER PRIMARY KEY,
    denumire VARCHAR2(100) NOT NULL,
    pret NUMBER(10,2) CHECK (pret > 0),
    stoc NUMBER CHECK (stoc >= 0),
    data_adaugare DATE,
    id_categorie NUMBER,
    id_furnizor NUMBER,
    CONSTRAINT fk_produs_categorie
        FOREIGN KEY (id_categorie)
        REFERENCES Categorie(id_categorie),
    CONSTRAINT fk_produs_furnizor
        FOREIGN KEY (id_furnizor)
        REFERENCES Furnizor(id_furnizor)
);
select * from Produs;

DROP TABLE Comanda CASCADE CONSTRAINTS;
SELECT * FROM Comanda;

CREATE TABLE Comanda (
    id_comanda NUMBER PRIMARY KEY,
    data_comanda DATE,
    status_comanda VARCHAR2(50),
    valoare_totala NUMBER(10,2),
    id_client NUMBER,
    CONSTRAINT fk_comanda_client
        FOREIGN KEY (id_client)
        REFERENCES Clienti(id_client)
);
CREATE TABLE Detalii_Comanda (
    id_comanda NUMBER,
    id_produs NUMBER,
    cantitate NUMBER CHECK (cantitate > 0),
    pret_unitar NUMBER(10,2),
    CONSTRAINT pk_detalii_comanda
        PRIMARY KEY (id_comanda, id_produs),
    CONSTRAINT fk_detalii_comanda_comanda
        FOREIGN KEY (id_comanda)
        REFERENCES Comanda(id_comanda),
    CONSTRAINT fk_detalii_comanda_produs
        FOREIGN KEY (id_produs)
        REFERENCES Produs(id_produs)
);

DROP TABLE Plata CASCADE CONSTRAINTS;
SELECT * FROM Plata;
CREATE TABLE Plata (
    id_plata NUMBER PRIMARY KEY,
    metoda_plata VARCHAR2(50),
    data_plata DATE,
    suma NUMBER(10,2),
    id_comanda NUMBER UNIQUE,
    CONSTRAINT fk_plata_comanda
        FOREIGN KEY (id_comanda)
        REFERENCES Comanda(id_comanda)
);


-----------3-------------

ALTER TABLE Clienti
ADD limita_credit NUMBER(10,2);

ALTER TABLE Clienti
ADD CONSTRAINT clienti_limita_credit_max
CHECK (limita_credit <= 10000);

select * from Clienti;



ALTER TABLE Comanda
MODIFY status_comanda VARCHAR2(100);

desc Comanda;


ALTER TABLE Clienti
DROP CONSTRAINT clienti_limita_credit_max;

ALTER TABLE Clienti
RENAME COLUMN telefon TO nr_telefon;

desc Clienti;


ALTER TABLE Comanda
MODIFY data_comanda DEFAULT SYSDATE;
desc Comanda;
select * from Comanda;

DROP TABLE Plata;
FLASHBACK TABLE Plata TO BEFORE DROP;

-----------4------------
desc Clienti;
DELETE FROM Clienti
WHERE prenume_client = 'PRENUME_REAL'
  AND nume_client = 'NUME_REAL';



INSERT INTO Clienti
(id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare)
VALUES
(1, 'Ghidurus', 'Andrada', 'ghidurusandrada24@stud.ase.ro',
 '0764461367', 'Bucuresti', SYSDATE);
 

INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (2,'Popescu','Ion','ion.popescu@gmail.com','0722222222','Bucuresti',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (3,'Ionescu','Maria','maria.ionescu@gmail.com','0733333333','Cluj',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (4,'Georgescu','Ana','ana.geo@gmail.com','0744444444','Iasi',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (5,'Marin','Alex','alex.marin@gmail.com','0755555555','Brasov',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (6,'Dumitru','Elena','elena.d@gmail.com','0766666666','Constanta',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (7,'Stan','Paul','paul.stan@gmail.com','0777777777','Sibiu',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (8,'Radu','Ioana','ioana.radu@gmail.com','0788888888','Oradea',SYSDATE);
INSERT INTO Clienti(id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (9,'Matei','Vlad','vlad.matei@gmail.com','0799999999','Arad',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (10,'Sandu','Bianca','bianca.sandu@gmail.com','0700000000','Pitesti',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (11,'Ilie','Cristina','cristina.ilie@gmail.com','0710101010','Bacau',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (12,'Lazar','Mihai','mihai.lazar@gmail.com','0720202020','Timisoara',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (13,'Enache','Raluca','raluca.enache@gmail.com','0730303030','Deva',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (14,'Neagu','Florin','florin.neagu@gmail.com','0740404040','Braila',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (15,'Vasile','Irina','irina.vasile@gmail.com','0750505050','Galati',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (16,'Petre','Dan','dan.petre@gmail.com','0760606060','Focsani',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (17,'Oprea','Carmen','carmen.oprea@gmail.com','0770707070','Slatina',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (18,'Barbu','Andrei','andrei.barbu@gmail.com','0780808080','Targoviste',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (19,'Serban','Alina','alina.serban@gmail.com','0790909090','Buzau',SYSDATE);
INSERT INTO Clienti (id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare) VALUES (20,'Dobre','Rares','rares.dobre@gmail.com','0701010101','Craiova',SYSDATE);


select * from Clienti;


INSERT INTO Categorie
(id_categorie, denumire, descriere, id_categorie_parinte)
VALUES
(1, 'Machiaj', 'Produse de machiaj', NULL);

INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (1,'Machiaj','Produse machiaj',NULL);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (2,'Ten','Produse ten',1);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (3,'Ochi','Produse ochi',1);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (4,'Buze','Produse buze',1);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (5,'Ingrijire','Ingrijire personala',NULL);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (6,'Par','Produse par',5);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (7,'Corp','Produse corp',5);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (8,'Accesorii','Accesorii cosmetice',NULL);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (9,'Pensule','Pensule machiaj',8);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (10,'Truse','Truse cosmetice',8);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (11,'Dermato','Produse dermatologice',NULL);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (12,'SPF','Protectie solara',11);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (13,'Curatare','Curatare ten',11);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (14,'Luxury','Produse premium',NULL);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (15,'Seruri','Seruri fata',14);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (16,'Creme','Creme fata',14);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (17,'Makeup Pro','Machiaj profesional',1);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (18,'Unghii','Produse unghii',NULL);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (19,'Lacuri','Lacuri unghii',18);
INSERT INTO Categorie (id_categorie, denumire, descriere, id_categorie_parinte) VALUES (20,'Geluri','Geluri UV',18);


select * from Categorie;


INSERT INTO Categorie
(id_categorie, denumire, descriere, id_categorie_parinte)
VALUES
(2, 'Ten', 'Produse pentru ten', 1);



select * from categorie;

INSERT INTO Furnizor
(id_furnizor, denumire, tara, email_contact, telefon)
VALUES
(1, 'ValBeauty', 'Romania', 'Valbeauty@beauty.ro', '7655463345');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (1,'ValBeauty','Romania','contact@valbeauty.ro','0211111111');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (2,'CosmoLine','Romania','office@cosmo.ro','0212222222');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (3,'BeautyPro','Italia','info@beautypro.it','0039123456');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (4,'MakeupLux','Franta','sales@makeuplux.fr','0033145678');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (5,'SkinCareLab','Germania','lab@skincare.de','0049300000');
INSERT INTO Furnizor(id_furnizor, denumire, tara, email_contact, telefon)  VALUES (6,'HairStyle','Spania','contact@hair.es','0034900000');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (7,'NailArt','Polonia','office@nail.pl','0048200000');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (8,'DermaPlus','Romania','derma@plus.ro','0213333333');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (9,'SunCare','Grecia','sun@care.gr','0030210000');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (10,'EcoBeauty','Romania','eco@beauty.ro','0214444444');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (11,'ProCosmetic','Italia','pro@cosmetic.it','0039555555');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (12,'NaturalSkin','Austria','info@nat.at','0043666666');
INSERT INTO Furnizor(id_furnizor, denumire, tara, email_contact, telefon)  VALUES (13,'UrbanMakeup','UK','sales@urban.uk','0044777777');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon) VALUES (14,'LuxuryGlow','Franta','lux@glow.fr','0033888888');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (15,'CleanFace','Romania','clean@face.ro','0215555555');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (16,'BioCare','Germania','bio@care.de','0049111111');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon)  VALUES (17,'PerfectHair','Italia','hair@perfect.it','0039222222');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon) VALUES (18,'ColorNails','Spania','color@nails.es','0039333333');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon) VALUES (19,'SunSafe','Romania','safe@sun.ro','0216666666');
INSERT INTO Furnizor (id_furnizor, denumire, tara, email_contact, telefon) VALUES (20,'EliteCosmetics','USA','elite@cos.us','0017777777');

select * from Furnizor;

INSERT INTO Produs
(id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor)
VALUES
(1, 'Fond de ten', 120, 50, SYSDATE, 2, 1);

INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (1,'Fond de ten',120,50,SYSDATE,2,1);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (2,'Mascara',80,40,SYSDATE,3,2);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (3,'Ruj rosu',60,70,SYSDATE,4,3);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (4,'Sampon',45,100,SYSDATE,6,6);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (5,'Crema fata',150,30,SYSDATE,16,5);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (6,'Ser vitamina C',200,25,SYSDATE,15,11);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (7,'Pensula blush',90,60,SYSDATE,9,10);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (8,'Trusa machiaj',300,15,SYSDATE,10,14);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (9,'Lac unghii',35,120,SYSDATE,19,18);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (10,'Gel UV',110,50,SYSDATE,20,7);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (11,'Crema SPF',95,80,SYSDATE,12,9);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (12,'Apa micelara',40,100,SYSDATE,13,15);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (13,'Fard ochi',70,60,SYSDATE,3,13);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (14,'Gloss buze',55,90,SYSDATE,4,2);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (15,'Masca fata',85,70,SYSDATE,7,8);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (16,'Ulei par',130,40,SYSDATE,6,17);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (17,'Creion ochi',45,110,SYSDATE,3,1);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (18,'Exfoliant',100,50,SYSDATE,13,12);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (19,'Set pensule',250,20,SYSDATE,9,14);
INSERT INTO Produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) VALUES (20,'Crema corp',90,60,SYSDATE,7,16);


select * from Produs;


INSERT INTO Comanda
(id_comanda, data_comanda, status_comanda, valoare_totala, id_client)
VALUES
(1, SYSDATE, 'in curs', 120, 1);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (1,SYSDATE,'finalizata',300,1);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (2,SYSDATE,'finalizata',180,2);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (3,SYSDATE,'in procesare',240,3);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (4,SYSDATE,'finalizata',120,4);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (5,SYSDATE,'anulata',0,5);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (6,SYSDATE,'finalizata',400,6);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (7,SYSDATE,'in procesare',150,7);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (8,SYSDATE,'finalizata',500,8);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (9,SYSDATE,'finalizata',200,9);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (10,SYSDATE,'in procesare',350,10);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (11,SYSDATE,'finalizata',180,11);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (12,SYSDATE,'finalizata',220,12);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (13,SYSDATE,'anulata',0,13);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (14,SYSDATE,'finalizata',410,14);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (15,SYSDATE,'in procesare',160,15);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (16,SYSDATE,'finalizata',275,16);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (17,SYSDATE,'finalizata',330,17);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (18,SYSDATE,'finalizata',290,18);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (19,SYSDATE,'in procesare',140,19);
INSERT INTO Comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) VALUES (20,SYSDATE,'finalizata',360,20);


select * from Comanda;



INSERT INTO Detalii_Comanda
(id_comanda, id_produs, cantitate, pret_unitar)
VALUES
(1, 1, 1, 120);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (1,1,2,120);
INSERT INTO Detalii_Comanda  (id_comanda, id_produs, cantitate, pret_unitar)VALUES (2,2,1,80);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (3,3,4,60);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (4,4,2,45);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (5,5,1,150);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (6,6,2,200);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (7,7,1,90);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (8,8,1,300);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (9,9,3,35);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (10,10,2,110);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (11,11,2,95);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (12,12,4,40);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (13,13,2,70);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (14,14,3,55);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (15,15,2,85);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (16,16,1,130);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (17,17,3,45);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (18,18,1,100);
INSERT INTO Detalii_Comanda  (id_comanda, id_produs, cantitate, pret_unitar)VALUES (19,19,1,250);
INSERT INTO Detalii_Comanda (id_comanda, id_produs, cantitate, pret_unitar) VALUES (20,20,2,90);


select * from Detalii_Comanda;


INSERT INTO Plata
(id_plata, metoda_plata, data_plata, suma, id_comanda)
VALUES
(1, 'card', SYSDATE, 120, 1);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (1,'card',SYSDATE,300,1);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (2,'cash',SYSDATE,180,2);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (3,'card',SYSDATE,240,3);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (4,'card',SYSDATE,120,4);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (5,'card',SYSDATE,0,5);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (6,'card',SYSDATE,400,6);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (7,'cash',SYSDATE,150,7);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (8,'card',SYSDATE,500,8);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (9,'card',SYSDATE,200,9);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (10,'cash',SYSDATE,350,10);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (11,'card',SYSDATE,180,11);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (12,'card',SYSDATE,220,12);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (13,'card',SYSDATE,0,13);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (14,'card',SYSDATE,410,14);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (15,'cash',SYSDATE,160,15);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (16,'card',SYSDATE,275,16);
INSERT INTO Plata(id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (17,'card',SYSDATE,330,17);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (18,'card',SYSDATE,290,18);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (19,'cash',SYSDATE,140,19);
INSERT INTO Plata (id_plata, metoda_plata, data_plata, suma, id_comanda) VALUES (20,'card',SYSDATE,360,20);


select * from Plata;

UPDATE Clienti
SET adresa = 'Cluj-Napoca'
WHERE id_client = 1;
select * from Clienti;


UPDATE Produs
SET stoc = stoc - 1
WHERE id_produs = 1;
select * from Produs;


UPDATE Comanda
SET status_comanda = 'finalizata'
WHERE id_comanda = 1;

select * from Comanda;









DELETE FROM Detalii_Comanda
WHERE id_comanda = 1
AND id_produs = 1;

select * from Detalii_Comanda;





DELETE FROM Plata
WHERE id_plata = 1;

select * from Plata;





UPDATE Produs
SET pret = pret + 20
WHERE id_produs = 2;
select * from Produs;

UPDATE Plata
SET metoda_plata = 'cash'
WHERE id_comanda = 3;

select * from Plata;

--interogari

-- 5.1 verificare: clienti cu comenzi peste media generala + clasificare 
SELECT c.nume, c.prenume,
       SUM(co.valoare_totala) total_comenzi,
       CASE
         WHEN SUM(co.valoare_totala) >= 500 THEN 'Client important'
         ELSE 'Client obisnuit'
       END categorie
FROM Clienti c, Comanda co
WHERE c.id_client = co.id_client
GROUP BY c.nume, c.prenume
HAVING SUM(co.valoare_totala) >
       (SELECT AVG(valoare_totala) FROM Comanda);


--5.2 verificare: produse cu stoc sub medie si pret > 50 
SELECT p.denumire, p.stoc, p.pret, cat.denumire categorie
FROM Produs p, Categorie cat
WHERE p.id_categorie = cat.id_categorie
  AND p.stoc < (SELECT AVG(stoc) FROM Produs)
  AND p.pret > 50;










-- 5.3 verificare: comenzi din anul curent + DECODE 
SELECT id_comanda,
       TO_CHAR(data_comanda,'DD-MM-YYYY') data_comanda,
       DECODE(status_comanda,
              'in curs','Neprocesata',
              'finalizata','Procesata',
              'Alta') status_interpretat
FROM Comanda
WHERE EXTRACT(YEAR FROM data_comanda) = EXTRACT(YEAR FROM SYSDATE);










--5.4 verificare: clienti non-Bucuresti cu comenzi intre valori 
SELECT DISTINCT c.nume, c.prenume, c.adresa
FROM Clienti c, Comanda co
WHERE c.id_client = co.id_client
  AND c.adresa != 'Bucuresti'
  AND co.valoare_totala BETWEEN 100 AND 500;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

/* 5.5 verificare: clienti fara email + NVL + SUBSTR */
SELECT SUBSTR(nume,1,3) prefix,
       prenume,
       NVL(email,'email_inexistent') email_afisat
FROM Clienti
WHERE email IS NULL;






























/* 5.6 verificare: produse comandate de cel putin 2 ori */
SELECT p.denumire, COUNT(*) nr_comenzi
FROM Produs p, Detalii_Comanda dc
WHERE p.id_produs = dc.id_produs
GROUP BY p.denumire
HAVING COUNT(*) >= 2;

/* 5.7 verificare: clienti cu comenzi si plati (INTERSECT) */
SELECT id_client FROM Comanda
INTERSECT
SELECT co.id_client
FROM Comanda co, Plata p
WHERE co.id_comanda = p.id_comanda;

/* 5.8. verificare: categorii cu pret mediu intre extreme */
SELECT c.denumire categorie,
       ROUND(AVG(p.pret),2) pret_mediu
FROM Categorie c, Produs p
WHERE c.id_categorie = p.id_categorie
GROUP BY c.denumire
HAVING AVG(p.pret) BETWEEN
       (SELECT MIN(pret) FROM Produs)
   AND (SELECT MAX(pret) FROM Produs);


/* 5.9 verificare: comenzi cu sau fara plata (outer join) */
SELECT co.id_comanda,
       NVL(p.suma,0) suma_platita
FROM Comanda co, Plata p
WHERE co.id_comanda = p.id_comanda(+);

/* 5.10 verificare: clienti cu mai mult de o comanda */
SELECT c.nume, c.prenume, COUNT(*) nr_comenzi
FROM Clienti c, Comanda co
WHERE c.id_client = co.id_client
GROUP BY c.nume, c.prenume
HAVING COUNT(*) > 1;

/* 5.11 verificare: subcerere corelata – comenzi peste media clientului */
SELECT co.id_comanda, co.valoare_totala
FROM Comanda co
WHERE co.valoare_totala >
      (SELECT AVG(co2.valoare_totala)
       FROM Comanda co2
       WHERE co2.id_client = co.id_client);

/* 5.12 verificare: clasificare clienti dupa nr comenzi */
SELECT c.nume, c.prenume,
       COUNT(co.id_comanda) nr_comenzi,
       CASE
         WHEN COUNT(co.id_comanda) >= 3 THEN 'Client frecvent'
         ELSE 'Client ocazional'
       END tip_client
FROM Clienti c, Comanda co
WHERE c.id_client = co.id_client
GROUP BY c.nume, c.prenume;

/* 5.13 verificare: TO_CHAR + EXTRACT */
SELECT id_comanda,
       TO_CHAR(data_comanda,'DD-MM-YYYY') data_formatata,
       EXTRACT(YEAR FROM data_comanda) an
FROM Comanda;

/* 5.14 -23!!!!!!!verificare: comenzi nefinalizate peste media clientului */
SELECT co.id_comanda, co.valoare_totala, co.status_comanda
FROM Comanda co
WHERE co.status_comanda != 'finalizata'
  AND co.valoare_totala >
      (SELECT AVG(co2.valoare_totala)
       FROM Comanda co2
       WHERE co2.id_client = co.id_client);


/* 5.15 verificare: produse cu pret intre valorile extreme ale comenzilor */
SELECT denumire, pret
FROM Produs
WHERE pret BETWEEN
      (SELECT MIN(valoare_totala) FROM Comanda)
  AND (SELECT MAX(valoare_totala) FROM Comanda);

/* 5.16 verificare: structura ierarhica categorii */
SELECT LEVEL, denumire,
       SYS_CONNECT_BY_PATH(denumire,' > ') cale
FROM Categorie
CONNECT BY PRIOR id_categorie = id_categorie_parinte
START WITH id_categorie_parinte IS NULL;

/* 5.17 verificare: clienti cu comenzi selectate */
SELECT c.nume, c.prenume, COUNT(*) nr_comenzi
FROM Clienti c, Comanda co
WHERE c.id_client = co.id_client
  AND co.status_comanda IN ('in curs', 'finalizata')
GROUP BY c.nume, c.prenume
HAVING COUNT(*) > 1;


-- 5.18. verificare: produse cu denumire specifica 
SELECT SUBSTR(denumire,1,1) initiala,
       denumire,
       stoc,
       CASE
         WHEN stoc >= 50 THEN 'Stoc mare'
         ELSE 'Stoc redus'
       END situatie_stoc
FROM Produs
WHERE denumire LIKE 'F%';







--5.19 verificare: categorii cu mai mult de 2 produse 
SELECT cat.denumire, COUNT(*) nr_produse
FROM Categorie cat, Produs p
WHERE cat.id_categorie = p.id_categorie
GROUP BY cat.denumire
HAVING COUNT(*) > 2;









/* 5.20 verificare: ultima comanda pentru fiecare client */
SELECT c.nume, c.prenume, MAX(co.data_comanda) ultima_comanda
FROM Clienti c, Comanda co
WHERE c.id_client = co.id_client
GROUP BY c.nume, c.prenume;















/* 5.21-10!!!!! verificare: furnizori cu produse scumpe + clasificare */
SELECT f.denumire furnizor,
       ROUND(AVG(p.pret),2) pret_mediu,
       CASE
         WHEN AVG(p.pret) >= 150 THEN 'Furnizor premium'
         ELSE 'Furnizor standard'
       END categorie_furnizor
FROM Furnizor f, Produs p
WHERE f.id_furnizor = p.id_furnizor
GROUP BY f.denumire
HAVING AVG(p.pret) >
       (SELECT AVG(pret) FROM Produs);

-- 5.22-11!!!!! verificare: comenzi din anul ultimei comenzi a clientului 
SELECT co.id_comanda,
       c.nume,
       c.prenume,
       EXTRACT(YEAR FROM co.data_comanda) an_comanda,
       NVL(p.suma,0) suma_platita
FROM Clienti c, Comanda co, Plata p
WHERE c.id_client = co.id_client
  AND co.id_comanda = p.id_comanda(+)
  AND EXTRACT(YEAR FROM co.data_comanda) =
      (SELECT EXTRACT(YEAR FROM MAX(co2.data_comanda))
       FROM Comanda co2
       WHERE co2.id_client = c.id_client);

/* 5.13-14!!!!!!verificare: comenzi pe ani cu valori selectate */
SELECT EXTRACT(YEAR FROM data_comanda) an,
       SUM(valoare_totala) total_anual
FROM Comanda
WHERE valoare_totala BETWEEN 100 AND 500
GROUP BY EXTRACT(YEAR FROM data_comanda);






/* 5.34 verificare: clienti activi recent + analiza comenzi */
SELECT c.nume,
       c.prenume,
       COUNT(co.id_comanda) nr_comenzi,
       ROUND(AVG(co.valoare_totala),2) valoare_medie,
       TO_CHAR(MAX(co.data_comanda),'DD-MM-YYYY') ultima_comanda,
       CASE
         WHEN AVG(co.valoare_totala) >= 300 THEN 'Client valoros'
         ELSE 'Client standard'
       END tip_client
FROM Clienti c, Comanda co
WHERE c.id_client = co.id_client
  AND co.data_comanda >= SYSDATE - 30
GROUP BY c.nume, c.prenume
HAVING AVG(co.valoare_totala) >
       (SELECT AVG(valoare_totala) FROM Comanda);












/* 5.17!!!!!!!!!verificare: produse dupa tara furnizorului */
SELECT p.denumire, f.tara,
       CASE
         WHEN p.pret >= 150 THEN 'Scump'
         ELSE 'Accesibil'
       END categorie_pret
FROM Produs p, Furnizor f
WHERE p.id_furnizor = f.id_furnizor
  AND f.tara IN ('Romania', 'Italia');


/* 5.5 verificare: clienti cu comenzi peste medie + clasificare */
SELECT c.nume,
       c.prenume,
       TO_CHAR(co.data_comanda,'DD-MM-YYYY') data_comanda,
       co.valoare_totala,
       CASE
         WHEN co.valoare_totala >= 300 THEN 'Comanda mare'
         ELSE 'Comanda medie'
       END tip_comanda
FROM Clienti c, Comanda co
WHERE c.id_client = co.id_client
  AND co.valoare_totala >
      (SELECT AVG(valoare_totala) FROM Comanda);
      
      
      
      
      
      /* 5.6 verificare: produse vandute peste media vanzarilor */
SELECT p.denumire,
       SUM(dc.cantitate * dc.pret_unitar) valoare_vanduta,
       COUNT(dc.id_comanda) nr_comenzi
FROM Produs p, Detalii_Comanda dc
WHERE p.id_produs = dc.id_produs
GROUP BY p.denumire
HAVING SUM(dc.cantitate * dc.pret_unitar) >
       (SELECT AVG(total)
        FROM (SELECT SUM(cantitate * pret_unitar) total
              FROM Detalii_Comanda
              GROUP BY id_produs));
















