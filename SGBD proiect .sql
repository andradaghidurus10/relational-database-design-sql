-----------Proiect sem 1 BD-------------

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
--desc Clienti;
--DELETE FROM Clienti
--WHERE prenume_client = 'PRENUME_REAL'
--  AND nume_client = 'NUME_REAL';

delete from plata;
delete from detalii_comanda;
delete from comanda;
delete from produs;
delete from furnizor;
delete from categorie;
delete from clienti;
commit;

insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (1,'Ghidurus','Andrada','ghidurusandrada24@stud.ase.ro','0764461367','Bucuresti',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (2,'Popescu','Ion','ion.popescu@gmail.com','0722222222','Bucuresti',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (3,'Ionescu','Maria','maria.ionescu@gmail.com','0733333333','Cluj',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (4,'Georgescu','Ana','ana.geo@gmail.com','0744444444','Iasi',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (5,'Marin','Alex','alex.marin@gmail.com','0755555555','Brasov',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (6,'Dumitru','Elena','elena.d@gmail.com','0766666666','Constanta',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (7,'Stan','Paul','paul.stan@gmail.com','0777777777','Sibiu',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (8,'Radu','Ioana','ioana.radu@gmail.com','0788888888','Oradea',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (9,'Matei','Vlad','vlad.matei@gmail.com','0799999999','Arad',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (10,'Sandu','Bianca','bianca.sandu@gmail.com','0700000000','Pitesti',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (11,'Ilie','Cristina','cristina.ilie@gmail.com','0710101010','Bacau',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (12,'Lazar','Mihai','mihai.lazar@gmail.com','0720202020','Timisoara',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (13,'Enache','Raluca','raluca.enache@gmail.com','0730303030','Deva',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (14,'Neagu','Florin','florin.neagu@gmail.com','0740404040','Braila',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (15,'Vasile','Irina','irina.vasile@gmail.com','0750505050','Galati',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (16,'Petre','Dan','dan.petre@gmail.com','0760606060','Focsani',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (17,'Oprea','Carmen','carmen.oprea@gmail.com','0770707070','Slatina',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (18,'Barbu','Andrei','andrei.barbu@gmail.com','0780808080','Targoviste',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (19,'Serban','Alina','alina.serban@gmail.com','0790909090','Buzau',sysdate);
insert into clienti (id_client, nume, prenume, email, telefon, adresa, data_inregistrare) values (20,'Dobre','Rares','rares.dobre@gmail.com','0701010101','Craiova',sysdate);


select * from clienti;


insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (1,'Machiaj','Produse machiaj',null);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (2,'Ten','Produse ten',1);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (3,'Ochi','Produse ochi',1);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (4,'Buze','Produse buze',1);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (5,'Ingrijire','Ingrijire personala',null);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (6,'Par','Produse par',5);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (7,'Corp','Produse corp',5);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (8,'Accesorii','Accesorii cosmetice',null);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (9,'Pensule','Pensule machiaj',8);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (10,'Truse','Truse cosmetice',8);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (11,'Dermato','Produse dermatologice',null);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (12,'SPF','Protectie solara',11);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (13,'Curatare','Curatare ten',11);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (14,'Luxury','Produse premium',null);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (15,'Seruri','Seruri fata',14);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (16,'Creme','Creme fata',14);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (17,'Makeup Pro','Machiaj profesional',1);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (18,'Unghii','Produse unghii',null);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (19,'Lacuri','Lacuri unghii',18);
insert into categorie (id_categorie, denumire, descriere, id_categorie_parinte) values (20,'Geluri','Geluri UV',18);

select * from categorie;

insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (1,'ValBeauty','Romania','contact@valbeauty.ro','0211111111');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (2,'CosmoLine','Romania','office@cosmo.ro','0212222222');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (3,'BeautyPro','Italia','info@beautypro.it','0039123456');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (4,'MakeupLux','Franta','sales@makeuplux.fr','0033145678');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (5,'SkinCareLab','Germania','lab@skincare.de','0049300000');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (6,'HairStyle','Spania','contact@hair.es','0034900000');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (7,'NailArt','Polonia','office@nail.pl','0048200000');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (8,'DermaPlus','Romania','derma@plus.ro','0213333333');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (9,'SunCare','Grecia','sun@care.gr','0030210000');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (10,'EcoBeauty','Romania','eco@beauty.ro','0214444444');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (11,'ProCosmetic','Italia','pro@cosmetic.it','0039555555');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (12,'NaturalSkin','Austria','info@nat.at','0043666666');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (13,'UrbanMakeup','UK','sales@urban.uk','0044777777');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (14,'LuxuryGlow','Franta','lux@glow.fr','0033888888');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (15,'CleanFace','Romania','clean@face.ro','0215555555');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (16,'BioCare','Germania','bio@care.de','0049111111');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (17,'PerfectHair','Italia','hair@perfect.it','0039222222');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (18,'ColorNails','Spania','color@nails.es','0039333333');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (19,'SunSafe','Romania','safe@sun.ro','0216666666');
insert into furnizor (id_furnizor, denumire, tara, email_contact, telefon) values (20,'EliteCosmetics','USA','elite@cos.us','0017777777');

select * from furnizor;

insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (1,'Fond de ten',120,50,sysdate,2,1);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (2,'Mascara',80,40,sysdate,3,2);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (3,'Ruj rosu',60,70,sysdate,4,3);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (4,'Sampon',45,100,sysdate,6,6);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (5,'Crema fata',150,30,sysdate,16,5);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (6,'Ser vitamina C',200,25,sysdate,15,11);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (7,'Pensula blush',90,60,sysdate,9,10);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (8,'Trusa machiaj',300,15,sysdate,10,14);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (9,'Lac unghii',35,120,sysdate,19,18);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (10,'Gel UV',110,50,sysdate,20,7);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (11,'Crema SPF',95,80,sysdate,12,9);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (12,'Apa micelara',40,100,sysdate,13,15);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (13,'Fard ochi',70,60,sysdate,3,13);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (14,'Gloss buze',55,90,sysdate,4,2);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (15,'Masca fata',85,70,sysdate,7,8);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (16,'Ulei par',130,40,sysdate,6,17);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (17,'Creion ochi',45,110,sysdate,3,1);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (18,'Exfoliant',100,50,sysdate,13,12);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (19,'Set pensule',250,20,sysdate,9,14);
insert into produs (id_produs, denumire, pret, stoc, data_adaugare, id_categorie, id_furnizor) values (20,'Crema corp',90,60,sysdate,7,16);

select * from produs;


insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (1,sysdate,'in curs',120,1);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (2,sysdate,'finalizata',80,2);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (3,sysdate,'in procesare',240,3);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (4,sysdate,'finalizata',90,4);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (5,sysdate,'anulata',150,5);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (6,sysdate,'finalizata',400,6);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (7,sysdate,'in procesare',90,7);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (8,sysdate,'finalizata',300,8);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (9,sysdate,'finalizata',105,9);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (10,sysdate,'in procesare',220,10);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (11,sysdate,'finalizata',190,11);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (12,sysdate,'finalizata',160,12);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (13,sysdate,'anulata',140,13);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (14,sysdate,'finalizata',165,14);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (15,sysdate,'in procesare',170,15);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (16,sysdate,'finalizata',130,16);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (17,sysdate,'finalizata',135,17);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (18,sysdate,'finalizata',100,18);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (19,sysdate,'in procesare',250,19);
insert into comanda (id_comanda, data_comanda, status_comanda, valoare_totala, id_client) values (20,sysdate,'finalizata',180,20);

select * from comanda;


insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (1,1,1,120);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (2,2,1,80);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (3,3,4,60);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (4,4,2,45);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (5,5,1,150);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (6,6,2,200);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (7,7,1,90);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (8,8,1,300);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (9,9,3,35);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (10,10,2,110);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (11,11,2,95);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (12,12,4,40);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (13,13,2,70);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (14,14,3,55);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (15,15,2,85);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (16,16,1,130);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (17,17,3,45);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (18,18,1,100);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (19,19,1,250);
insert into detalii_comanda (id_comanda, id_produs, cantitate, pret_unitar) values (20,20,2,90);

select * from detalii_comanda;

insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (1,'card',sysdate,120,1);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (2,'cash',sysdate,80,2);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (3,'card',sysdate,240,3);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (4,'card',sysdate,90,4);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (5,'card',sysdate,0,5);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (6,'card',sysdate,400,6);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (7,'cash',sysdate,90,7);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (8,'card',sysdate,300,8);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (9,'card',sysdate,105,9);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (10,'cash',sysdate,220,10);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (11,'card',sysdate,190,11);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (12,'card',sysdate,160,12);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (13,'card',sysdate,0,13);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (14,'card',sysdate,165,14);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (15,'cash',sysdate,170,15);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (16,'card',sysdate,130,16);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (17,'card',sysdate,135,17);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (18,'card',sysdate,100,18);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (19,'cash',sysdate,250,19);
insert into plata (id_plata, metoda_plata, data_plata, suma, id_comanda) values (20,'card',sysdate,180,20);

select * from plata;


















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

UPDATE Produs
SET pret = pret + 20
WHERE id_produs = 2;
select * from Produs;

UPDATE Plata
SET metoda_plata = 'cash'
WHERE id_comanda = 3;

select * from Plata;

DELETE FROM Detalii_Comanda
WHERE id_comanda = 1
AND id_produs = 1;

select * from Detalii_Comanda;

DELETE FROM Plata
WHERE id_plata = 1;

select * from Plata;


------------5------------
--interogari

-- 5.1  clienti cu comenzi peste media generala + clasificare 
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


--5.2 produse cu stoc sub medie si pret > 50 
SELECT p.denumire, p.stoc, p.pret, cat.denumire categorie
FROM Produs p, Categorie cat
WHERE p.id_categorie = cat.id_categorie
  AND p.stoc < (SELECT AVG(stoc) FROM Produs)
  AND p.pret > 50;


-- 5.3 comenzi din anul curent + DECODE 
SELECT id_comanda,
       TO_CHAR(data_comanda,'DD-MM-YYYY') data_comanda,
       DECODE(status_comanda,
              'in curs','Neprocesata',
              'finalizata','Procesata',
              'Alta') status_interpretat
FROM Comanda
WHERE EXTRACT(YEAR FROM data_comanda) = EXTRACT(YEAR FROM SYSDATE);


--5.4 clienti non-Bucuresti cu comenzi intre valori 
SELECT DISTINCT c.nume, c.prenume, c.adresa
FROM Clienti c, Comanda co
WHERE c.id_client = co.id_client
  AND c.adresa != 'Bucuresti'
  AND co.valoare_totala BETWEEN 100 AND 500;
  
---- 5.5 clienti cu comenzi peste medie + clasificare 
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
      
--5.6.produse vandute peste media vanzarilor 
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

-- 5.7  
SELECT c.id_client, c.nume, c.prenume
FROM Clienti c
WHERE c.id_client IN
      (SELECT id_client FROM Comanda)
INTERSECT
SELECT c.id_client, c.nume, c.prenume
FROM Clienti c, Comanda co, Plata p
WHERE c.id_client = co.id_client
  AND co.id_comanda = p.id_comanda;


-- 5.8. categorii cu pret mediu intre extreme 
SELECT c.denumire categorie,
       ROUND(AVG(p.pret),2) pret_mediu
FROM Categorie c, Produs p
WHERE c.id_categorie = p.id_categorie
GROUP BY c.denumire
HAVING AVG(p.pret) BETWEEN
       (SELECT MIN(pret) FROM Produs)
   AND (SELECT MAX(pret) FROM Produs);


-- 5.9  comenzi cu sau fara plata (outer join) 
SELECT co.id_comanda,
       NVL(p.suma,0) suma_platita
FROM Comanda co, Plata p
WHERE co.id_comanda = p.id_comanda(+);
--5.10 furnizori cu produse scumpe + clasificare 
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

-- 5.11 comenzi din anul ultimei comenzi a clientului 
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

-- 5.12 clasificare clienti dupa nr comenzi
SELECT c.nume, c.prenume,
       COUNT(co.id_comanda) nr_comenzi,
       CASE
         WHEN COUNT(co.id_comanda) >= 3 THEN 'Client frecvent'
         ELSE 'Client ocazional'
       END tip_client
FROM Clienti c, Comanda co
WHERE c.id_client = co.id_client
GROUP BY c.nume, c.prenume;

-- 5.13 TO_CHAR + EXTRACT 
SELECT id_comanda,
       TO_CHAR(data_comanda,'DD-MM-YYYY') data_formatata,
       EXTRACT(YEAR FROM data_comanda) an
FROM Comanda;
---- 5.14.comenzi pe ani cu valori selectate */
SELECT EXTRACT(YEAR FROM data_comanda) an,
       SUM(valoare_totala) total_anual
FROM Comanda
WHERE valoare_totala BETWEEN 100 AND 500
GROUP BY EXTRACT(YEAR FROM data_comanda);


-- 5.15 produse cu pret intre valorile extreme ale comenzilor 
SELECT denumire, pret
FROM Produs
WHERE pret BETWEEN
      (SELECT MIN(valoare_totala) FROM Comanda)
  AND (SELECT MAX(valoare_totala) FROM Comanda);

-- 5.16 structura ierarhica categorii 
SELECT LEVEL, denumire,SYS_CONNECT_BY_PATH(denumire,' > ') cale
FROM Categorie
CONNECT BY PRIOR id_categorie = id_categorie_parinte
START WITH id_categorie_parinte IS NULL;

----5.17. produse dupa tara furnizorului 
SELECT p.denumire, f.tara,
       CASE
         WHEN p.pret >= 150 THEN 'Scump'
         ELSE 'Accesibil'
       END categorie_pret
FROM Produs p, Furnizor f
WHERE p.id_furnizor = f.id_furnizor
  AND f.tara IN ('Romania', 'Italia');


-- 5.18.produse cu denumire specifica 
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

-- 5.20 verificare: ultima comanda pentru fiecare client 
SELECT c.nume, c.prenume, MAX(co.data_comanda) ultima_comanda
FROM Clienti c, Comanda co
WHERE c.id_client = co.id_client
GROUP BY c.nume, c.prenume;

--5.21 clienti activi recent + analiza comenzi 
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
       (SELECT AVG(valoare_totala) FROM Comanda)

------6----------

CREATE SEQUENCE seq_clienti
START WITH 100
INCREMENT BY 1
NOCACHE
NOCYCLE;

INSERT INTO Clienti
(id_client, nume, prenume, email, nr_telefon, adresa, data_inregistrare)
VALUES
(seq_clienti.NEXTVAL, 'Popescu', 'Ana',
 'ana.popescu@email.ro', '0712345678',
 'Brasov', SYSDATE);
commit;

select * from Clienti
order by id_client desc;


CREATE INDEX idx_clienti_email
ON Clienti(email);

SELECT * FROM Clienti
WHERE email LIKE '%@gmail.com';

CREATE SYNONYM cli FOR Clienti;
SELECT * FROM cli;

CREATE VIEW v_comenzi_clienti AS
SELECT c.nume,
       c.prenume,
       co.id_comanda,
       co.data_comanda,
       co.valoare_totala
FROM Clienti c
JOIN Comanda co ON c.id_client = co.id_client;

SELECT * FROM v_comenzi_clienti;



--------------Proiect SGBD sem 2 continuare-----------------


--1.Să se creeze o procedură care primește ca parametru codul unei comenzi și actualizează stocul produselor aferente acesteia,
--utilizând cursor explicit pentru parcurgerea produselor din comandă, instrucțiuni condiționale pentru verificarea stocului
--și cursor implicit pentru verificarea actualizărilor efectuate. Să se trateze excepțiile corespunzătoare

set serveroutput on; 

create or replace procedure actualizeaza_stoc_comanda
(
    p_id_comanda in comanda.id_comanda%type
)
is
    cursor c_detalii is
        select id_produs, cantitate
        from detalii_comanda
        where id_comanda = p_id_comanda;

    v_detaliu c_detalii%rowtype;
    v_stoc_curent produs.stoc%type;
    v_denumire_produs produs.denumire%type;
    v_exista number;
    v_prag_stoc number := 10;

    e_comanda_inexistenta exception;
    e_stoc_insuficient exception;
begin
    select count(*)
    into v_exista
    from comanda
    where id_comanda = p_id_comanda;

    if v_exista = 0 then
        raise e_comanda_inexistenta;
    end if;

    dbms_output.put_line('se proceseaza comanda cu id-ul: ' || p_id_comanda);
    dbms_output.put_line('---------------------------------------------');

    open c_detalii;
    loop
        fetch c_detalii into v_detaliu;
        exit when c_detalii%notfound;

        select denumire, stoc
        into v_denumire_produs, v_stoc_curent
        from produs
        where id_produs = v_detaliu.id_produs;

        dbms_output.put_line('produs: ' || v_denumire_produs);
        dbms_output.put_line('stoc initial: ' || v_stoc_curent);
        dbms_output.put_line('cantitate comandata: ' || v_detaliu.cantitate);

        if v_stoc_curent < v_detaliu.cantitate then
            raise e_stoc_insuficient;

        elsif v_stoc_curent = v_detaliu.cantitate then
            update produs
            set stoc = 0
            where id_produs = v_detaliu.id_produs;

            if sql%rowcount > 0 then
                dbms_output.put_line('stocul produsului a devenit 0.');
            else
                dbms_output.put_line('nu s-a realizat actualizarea stocului.');
            end if;

        else
            update produs
            set stoc = stoc - v_detaliu.cantitate
            where id_produs = v_detaliu.id_produs;

            if sql%rowcount > 0 then
                dbms_output.put_line('stoc actualizat cu succes.');
            else
                dbms_output.put_line('nu s-a realizat actualizarea stocului.');
            end if;
        end if;

        select stoc
        into v_stoc_curent
        from produs
        where id_produs = v_detaliu.id_produs;

        if v_stoc_curent = 0 then
            dbms_output.put_line('atentie! produs epuizat din stoc.');
        elsif v_stoc_curent < v_prag_stoc then
            dbms_output.put_line('atentie! stoc sub pragul minim: ' || v_stoc_curent);
        else
            dbms_output.put_line('stoc ramas suficient: ' || v_stoc_curent);
        end if;

        dbms_output.put_line('---------------------------------------------');
    end loop;
    close c_detalii;

    dbms_output.put_line('procesarea comenzii s-a incheiat cu succes.');

exception
    when e_comanda_inexistenta then
        dbms_output.put_line('nu exista nicio comanda cu acest id.');

    when e_stoc_insuficient then
        dbms_output.put_line('eroare: stoc insuficient pentru unul dintre produse.');

    when no_data_found then
        dbms_output.put_line('nu exista produsul asociat unei inregistrari din detalii_comanda.');

    when others then
        dbms_output.put_line('a aparut o eroare: ' || sqlerrm);
end;
/

 execute actualizeaza_stoc_comanda(1);
 
 ----captura de ecran:
 select id_produs, denumire, stoc
from produs
order by id_produs;

----------

--2. Să se creeze o procedură care primește ca parametru codul unei comenzi, verifică existența plății asociate acesteia
--și compară suma plătită cu valoarea totală a comenzii. Să se utilizeze cursor explicit pentru parcurgerea plății,
--instrucțiuni condiționale pentru interpretarea rezultatului, instrucțiuni SQL și tratarea excepțiilor.

create or replace procedure verifica_plata_comanda
(
    p_id_comanda in comanda.id_comanda%type
)
is
    cursor c_plata is
        select suma
        from plata
        where id_comanda = p_id_comanda;

    v_suma_platita plata.suma%type;
    v_valoare_comanda comanda.valoare_totala%type;
    v_exista number;

    e_comanda_inexistenta exception;
    e_plata_inexistenta exception;

begin

    select count(*)
    into v_exista
    from comanda
    where id_comanda = p_id_comanda;

    if v_exista = 0 then
        raise e_comanda_inexistenta;
    end if;


    select valoare_totala
    into v_valoare_comanda
    from comanda
    where id_comanda = p_id_comanda;


    open c_plata;

    fetch c_plata into v_suma_platita;

    if c_plata%notfound then
        raise e_plata_inexistenta;
    end if;


    if v_suma_platita = v_valoare_comanda then

        dbms_output.put_line('comanda este achitata integral.');

    elsif v_suma_platita < v_valoare_comanda then

        dbms_output.put_line('comanda este platita partial.');

    else

        dbms_output.put_line('plata depaseste valoarea comenzii.');

    end if;


    close c_plata;


exception

    when e_comanda_inexistenta then

        dbms_output.put_line('comanda nu exista.');

    when e_plata_inexistenta then

        dbms_output.put_line('nu exista plata pentru aceasta comanda.');

    when no_data_found then

        dbms_output.put_line('eroare la extragerea datelor.');

    when others then

        dbms_output.put_line('eroare: ' || sqlerrm);

end;
/
execute verifica_plata_comanda(1);



select c.id_comanda, c.valoare_totala, p.suma
from comanda c, plata p
where c.id_comanda = p.id_comanda
order by c.id_comanda;


--3.Să se creeze o procedură care primește ca parametru codul unui client și afișează toate comenzile acestuia, 
--data fiecărei comenzi, valoarea fiecărei comenzi, precum și valoarea totală a comenzilor plasate. 
--Să se utilizeze cursor explicit cu for loop, instrucțiuni condiționale, instrucțiuni SQL și tratarea excepțiilor.

create or replace procedure raport_comenzi_client
(
    p_id_client in clienti.id_client%type
)
is
    cursor c_comenzi is
        select id_comanda, data_comanda, valoare_totala
        from comanda
        where id_client = p_id_client;

    v_total_comenzi number(10,2) := 0;
    v_exista_client number;
    v_exista_comenzi number;

    e_client_inexistent exception;
    e_fara_comenzi exception;
begin
    select count(*)
    into v_exista_client
    from clienti
    where id_client = p_id_client;

    if v_exista_client = 0 then
        raise e_client_inexistent;
    end if;

    select count(*)
    into v_exista_comenzi
    from comanda
    where id_client = p_id_client;

    if v_exista_comenzi = 0 then
        raise e_fara_comenzi;
    end if;

    dbms_output.put_line('comenzile clientului cu id-ul: ' || p_id_client);
    dbms_output.put_line('---------------------------------------------');

    for rec in c_comenzi loop
        dbms_output.put_line(
            'comanda: ' || rec.id_comanda ||
            ' | data: ' || to_char(rec.data_comanda, 'dd-mm-yyyy') ||
            ' | valoare: ' || rec.valoare_totala
        );

        v_total_comenzi := v_total_comenzi + rec.valoare_totala;
    end loop;

    dbms_output.put_line('---------------------------------------------');
    dbms_output.put_line('valoarea totala a comenzilor clientului este: ' || v_total_comenzi);

exception
    when e_client_inexistent then
        dbms_output.put_line('clientul nu exista.');

    when e_fara_comenzi then
        dbms_output.put_line('clientul nu are comenzi.');

    when others then
        dbms_output.put_line('eroare: ' || sqlerrm);
end;
/

execute raport_comenzi_client(1);


select * from comanda; 

select id_client, id_comanda, data_comanda, valoare_totala
from comanda
order by id_client, id_comanda;


--4.Să se creeze o procedură care primește ca parametru codul unui furnizor și majorează prețul produselor furnizate de acesta 
--în funcție de valoarea actuală a prețului. Pentru produsele cu preț mai mic de 100 se va aplica o majorare de 10%,
--iar pentru cele cu preț mai mare sau egal cu 100 se va aplica o majorare de 5%. Să se utilizeze cursor explicit, 
--instrucțiuni condiționale, instrucțiuni update, cursor implicit și tratarea excepțiilor.

create or replace procedure actualizeaza_preturi_furnizor
(
    p_id_furnizor in furnizor.id_furnizor%type
)
is
    cursor c_produse is
        select id_produs, denumire, pret
        from produs
        where id_furnizor = p_id_furnizor;

    v_exista_furnizor number;
    v_exista_produse number;
    v_pret_nou produs.pret%type;

    e_furnizor_inexistent exception;
    e_furnizor_fara_produse exception;
begin
    select count(*)
    into v_exista_furnizor
    from furnizor
    where id_furnizor = p_id_furnizor;

    if v_exista_furnizor = 0 then
        raise e_furnizor_inexistent;
    end if;

    select count(*)
    into v_exista_produse
    from produs
    where id_furnizor = p_id_furnizor;

    if v_exista_produse = 0 then
        raise e_furnizor_fara_produse;
    end if;

    dbms_output.put_line('se actualizeaza produsele furnizorului cu id-ul: ' || p_id_furnizor);
    dbms_output.put_line('-------------------------------------------------------------');

    for rec in c_produse loop

        if rec.pret < 100 then
            v_pret_nou := rec.pret * 1.10;
        elsif rec.pret >= 100 then
            v_pret_nou := rec.pret * 1.05;
        else
            v_pret_nou := rec.pret;
        end if;

        update produs
        set pret = round(v_pret_nou, 2)
        where id_produs = rec.id_produs;

        if sql%rowcount > 0 then
            dbms_output.put_line(
                'produs: ' || rec.denumire ||
                ' | pret vechi: ' || rec.pret ||
                ' | pret nou: ' || round(v_pret_nou, 2)
            );
        else
            dbms_output.put_line('nu s-a actualizat produsul cu id-ul: ' || rec.id_produs);
        end if;

    end loop;

    dbms_output.put_line('-------------------------------------------------------------');
    dbms_output.put_line('actualizarea preturilor s-a incheiat.');

exception
    when e_furnizor_inexistent then
        dbms_output.put_line('furnizorul nu exista.');

    when e_furnizor_fara_produse then
        dbms_output.put_line('furnizorul nu are produse asociate.');

    when others then
        dbms_output.put_line('eroare: ' || sqlerrm);
end;
/

execute actualizeaza_preturi_furnizor(1);

select id_produs, denumire, pret, id_furnizor
from produs
where id_furnizor = 1
order by id_produs;




--5.Să se creeze o funcție care primește ca parametru codul unui client și returnează categoria acestuia în funcție de activitatea comercială 
--desfășurată în magazinul online. Funcția va parcurge comenzile clientului utilizând un cursor explicit, 
--va calcula numărul comenzilor și valoarea totală a acestora și va clasifica clientul în una dintre categoriile: „client premium”, 
--„client fidel”, „client obișnuit” sau „fără comenzi”. Să se utilizeze instrucțiuni condiționale, instrucțiuni SQL și tratarea excepțiilor.

create or replace function categorie_client
(
    p_id_client in clienti.id_client%type
)
return varchar2
is
    cursor c_comenzi is
        select id_comanda, valoare_totala
        from comanda
        where id_client = p_id_client;

    v_exista_client number;
    v_nr_comenzi number := 0;
    v_total_comenzi number(10,2) := 0;
    v_categorie varchar2(30);

    rec c_comenzi%rowtype;

    e_client_inexistent exception;
begin
    select count(*)
    into v_exista_client
    from clienti
    where id_client = p_id_client;

    if v_exista_client = 0 then
        raise e_client_inexistent;
    end if;

    open c_comenzi;
    loop
        fetch c_comenzi into rec;
        exit when c_comenzi%notfound;

        v_nr_comenzi := v_nr_comenzi + 1;
        v_total_comenzi := v_total_comenzi + nvl(rec.valoare_totala, 0);
    end loop;
    close c_comenzi;

    if v_nr_comenzi = 0 then
        v_categorie := 'fara comenzi';
    elsif v_total_comenzi >= 800 or v_nr_comenzi >= 5 then
        v_categorie := 'client premium';
    elsif v_total_comenzi >= 400 or v_nr_comenzi >= 3 then
        v_categorie := 'client fidel';
    else
        v_categorie := 'client obisnuit';
    end if;

    return v_categorie;

exception
    when e_client_inexistent then
        return 'client inexistent';

    when others then
        return 'eroare';
end;
/


begin
    dbms_output.put_line('categoria clientului este: ' || categorie_client(1));
end;
/

select id_client, nume, prenume, categorie_client(id_client) as categorie
from clienti
order by id_client;

select id_client, count(*) as nr_comenzi, sum(valoare_totala) as total_comenzi
from comanda
group by id_client
order by id_client;


--6.Să se creeze o procedură care primește ca parametru codul unui client și, prin intermediul unui parametru de tip in out, 
--calculează și actualizează valoarea totală a comenzilor acestuia. Procedura va parcurge comenzile clientului utilizând un cursor explicit,
--va însuma valorile comenzilor, va afișa comenzile parcurse și va returna în parametrul in out suma totală obținută. 
--Să se utilizeze structuri repetitive, instrucțiuni condiționale, instrucțiuni SQL și tratarea excepțiilor.

create or replace procedure total_comenzi_client
(
    p_id_client in clienti.id_client%type,
    p_total in out number
)
is
    cursor c_comenzi is
        select id_comanda, data_comanda, valoare_totala, status_comanda
        from comanda
        where id_client = p_id_client
        order by id_comanda;

    rec c_comenzi%rowtype;
    v_exista_client number;
    v_nr_comenzi number := 0;

    e_client_inexistent exception;
begin
    select count(*)
    into v_exista_client
    from clienti
    where id_client = p_id_client;

    if v_exista_client = 0 then
        raise e_client_inexistent;
    end if;

    p_total := 0;

    open c_comenzi;
    loop
        fetch c_comenzi into rec;
        exit when c_comenzi%notfound;

        v_nr_comenzi := v_nr_comenzi + 1;
        p_total := p_total + nvl(rec.valoare_totala, 0);

        dbms_output.put_line(
            'comanda: ' || rec.id_comanda ||
            ' | data: ' || to_char(rec.data_comanda, 'dd-mm-yyyy') ||
            ' | status: ' || rec.status_comanda ||
            ' | valoare: ' || rec.valoare_totala
        );
    end loop;
    close c_comenzi;

    if v_nr_comenzi = 0 then
        dbms_output.put_line('clientul nu are comenzi.');
    elsif p_total >= 500 then
        dbms_output.put_line('clientul are o valoare totala mare a comenzilor.');
    else
        dbms_output.put_line('clientul are o valoare totala medie sau mica a comenzilor.');
    end if;

    dbms_output.put_line('numar comenzi: ' || v_nr_comenzi);
    dbms_output.put_line('total comenzi: ' || p_total);

exception
    when e_client_inexistent then
        dbms_output.put_line('clientul nu exista.');
        p_total := -1;

    when others then
        dbms_output.put_line('eroare: ' || sqlerrm);
        p_total := -1;
end;
/

declare
    v_total number := 0;
begin
    total_comenzi_client(1, v_total);
    dbms_output.put_line('valoarea finala returnata prin parametrul in out este: ' || v_total);
end;
/

select distinct id_client
from comanda
order by id_client;

--7. Să se creeze o procedură care verifică produsele cu stoc sub un prag dat și salvează mesaje de avertizare
--într-o tabelă auxiliară. Procedura va utiliza cursor explicit pentru parcurgerea produselor,
--instrucțiuni condiționale pentru verificarea stocului, instrucțiuni insert și delete,
--cursor implicit și tratarea excepțiilor.




create table mesaje_stoc
(
    id_produs number,
    denumire varchar2(100),
    stoc number,
    mesaj varchar2(200),
    data_mesaj date
);

create or replace procedure avertizare_stoc
(
    p_prag in number
)
is
    cursor c_produse is
        select id_produs, denumire, stoc
        from produs
        order by id_produs;

    v_mesaj varchar2(200);

    e_prag_invalid exception;
begin
    if p_prag < 0 then
        raise e_prag_invalid;
    end if;

    delete from mesaje_stoc;

    for rec in c_produse loop
        if rec.stoc = 0 then
            v_mesaj := 'produs epuizat din stoc';
        elsif rec.stoc < p_prag then
            v_mesaj := 'stoc sub pragul minim';
        else
            v_mesaj := null;
        end if;

        if v_mesaj is not null then
            insert into mesaje_stoc
            (
                id_produs,
                denumire,
                stoc,
                mesaj,
                data_mesaj
            )
            values
            (
                rec.id_produs,
                rec.denumire,
                rec.stoc,
                v_mesaj,
                sysdate
            );

            if sql%rowcount > 0 then
                dbms_output.put_line(
                    'mesaj inserat pentru produsul: ' || rec.denumire ||
                    ' | stoc: ' || rec.stoc
                );
            end if;
        end if;
    end loop;

    dbms_output.put_line('procedura s-a incheiat.');

exception
    when e_prag_invalid then
        dbms_output.put_line('pragul introdus este invalid.');

    when others then
        dbms_output.put_line('eroare: ' || sqlerrm);
end;
/
exec avertizare_stoc(50);

select * from mesaje_stoc order by id_produs;

--8.Să se creeze o funcție care primește ca parametru codul unei comenzi și returnează numărul de produse distincte din acea comandă.
--Funcția va verifica existența comenzii, va utiliza un cursor explicit pentru parcurgerea produselor din detalii_comanda, 
--va număra produsele și va returna rezultatul. Să se utilizeze instrucțiuni condiționale, instrucțiuni SQL și tratarea excepțiilor

create or replace function numar_produse_comanda
(
    p_id_comanda in comanda.id_comanda%type
)
return number
is
    cursor c_detalii is
        select id_produs
        from detalii_comanda
        where id_comanda = p_id_comanda;

    v_exista_comanda number;
    v_numar_produse number := 0;
    rec c_detalii%rowtype;

    e_comanda_inexistenta exception;
begin
    select count(*)
    into v_exista_comanda
    from comanda
    where id_comanda = p_id_comanda;

    if v_exista_comanda = 0 then
        raise e_comanda_inexistenta;
    end if;

    open c_detalii;
    loop
        fetch c_detalii into rec;
        exit when c_detalii%notfound;
        v_numar_produse := v_numar_produse + 1;
    end loop;
    close c_detalii;

    return v_numar_produse;

exception
    when e_comanda_inexistenta then
        return -1;

    when others then
        return -2;
end;
/

begin
    dbms_output.put_line(
        'numarul de produse distincte din comanda este: ' || numar_produse_comanda(1)
    );
end;
/

select id_comanda, numar_produse_comanda(id_comanda) as nr_produse
from comanda
order by id_comanda;

select id_comanda, count(*) as nr_produse
from detalii_comanda
group by id_comanda
order by id_comanda;

------------------------------
--1.Afisare client dupa cod 
--cerinta:Să se afișeze numele, prenumele, emailul și adresa clientului cu codul introdus. 
--Să se clasifice clientul în funcție de adresă. să se trateze cazul în care clientul nu există.

declare
    v_id_client clienti.id_client%type := &p_id_client;
    v_nume clienti.nume%type;
    v_prenume clienti.prenume%type;
    v_email clienti.email%type;
begin

    select nume, prenume, email
    into v_nume, v_prenume, v_email
    from clienti
    where id_client = v_id_client;

    dbms_output.put_line('clientul este: ' || v_nume || ' ' || v_prenume);
    dbms_output.put_line('email: ' || v_email);

exception
    when no_data_found then
        dbms_output.put_line('nu exista client cu acest cod.');

end;
/


--2.Afisare furnizor dintr o tara 
--cerinta:Să se afișeze denumirea și emailul unui furnizor din țara introdusă.
--Să se trateze cazul în care există mai mulți furnizori din aceeași țară sau niciunul.
declare
    v_tara furnizor.tara%type := '&p_tara';
    v_denumire furnizor.denumire%type;
    v_email furnizor.email_contact%type;
begin
    select denumire, email_contact
    into v_denumire, v_email
    from furnizor
    where lower(tara) = lower(v_tara);

    dbms_output.put_line('furnizorul este: ' || v_denumire);
    dbms_output.put_line('email contact: ' || v_email);

exception
    when too_many_rows then
        dbms_output.put_line('exista mai multi furnizori din tara introdusa.');
    when no_data_found then
        dbms_output.put_line('nu exista furnizori din tara introdusa.');
end;
/


--3.Actualizare pret pentru un produs 
--cerinta:Să se actualizeze prețul produsului cu codul introdus. 
--Dacă produsul nu există, să se declanșeze o excepție definită de utilizator. 
--Să se folosească și cursorul implicit. 

declare
    v_id_produs produs.id_produs%type := &p_id_produs;
    v_pret_vechi produs.pret%type;
    v_pret_nou produs.pret%type;

    e_produs_inexistent exception;
begin
    select pret
    into v_pret_vechi
    from produs
    where id_produs = v_id_produs;

    if v_pret_vechi < 100 then
        v_pret_nou := v_pret_vechi * 1.10;
    elsif v_pret_vechi between 100 and 200 then
        v_pret_nou := v_pret_vechi * 1.05;
    else
        v_pret_nou := v_pret_vechi * 1.03;
    end if;

    update produs
    set pret = round(v_pret_nou, 2)
    where id_produs = v_id_produs;

    if sql%notfound then
        raise e_produs_inexistent;
    end if;

    dbms_output.put_line('pret vechi: ' || v_pret_vechi);
    dbms_output.put_line('pret nou: ' || round(v_pret_nou, 2));
    dbms_output.put_line('randuri actualizate: ' || sql%rowcount);

exception
    when no_data_found then
        dbms_output.put_line('produsul nu exista.');
    when e_produs_inexistent then
        dbms_output.put_line('nu s-a putut actualiza produsul.');
    when others then
        dbms_output.put_line('eroare: ' || sqlerrm);
end;
/

--4.Parcurgere produse dintr o categorie cu cursor explicit 
--cerinta:Să se afișeze toate produsele din categoria introdusă, folosind cursor explicit. 
--Să se calculeze numărul lor și să se trateze cazul în care nu există produse în categorie
declare
    v_id_categorie produs.id_categorie%type := &p_id_categorie;
    v_nr number := 0;
    v_total number(10,2) := 0;

    cursor c_produse is
        select id_produs, denumire, pret, stoc
        from produs
        where id_categorie = v_id_categorie
        order by pret desc;

    rec_prod c_produse%rowtype;

    e_fara_produse exception;
begin
    open c_produse;

    loop
        fetch c_produse into rec_prod;
        exit when c_produse%notfound;

        v_nr := v_nr + 1;
        v_total := v_total + rec_prod.pret;

        dbms_output.put_line(
            'produs: ' || rec_prod.denumire ||
            ' | pret: ' || rec_prod.pret ||
            ' | stoc: ' || rec_prod.stoc
        );
    end loop;

    close c_produse;

    if v_nr = 0 then
        raise e_fara_produse;
    else
        dbms_output.put_line('numar produse: ' || v_nr);
        dbms_output.put_line('valoare totala preturi: ' || v_total);
    end if;

exception
    when e_fara_produse then
        dbms_output.put_line('categoria nu are produse.');
    when others then
        dbms_output.put_line('eroare: ' || sqlerrm);
end;
/

--5.Verificarea platii unei comenzi 
--cerinta: Să se verifice dacă o comandă are plată și dacă suma plătită acoperă valoarea totală. 
--Să se folosească sub-bloc, instrucțiuni condiționale și excepții
declare
    v_id_comanda comanda.id_comanda%type := &p_id_comanda;
    v_valoare comanda.valoare_totala%type;
    v_suma plata.suma%type;

    e_plata_inexistenta exception;
begin
    select valoare_totala
    into v_valoare
    from comanda
    where id_comanda = v_id_comanda;

    begin
        select suma
        into v_suma
        from plata
        where id_comanda = v_id_comanda;
    exception
        when no_data_found then
            raise e_plata_inexistenta;
    end;

    dbms_output.put_line('valoare comanda: ' || v_valoare);
    dbms_output.put_line('suma platita: ' || v_suma);

    if v_suma = v_valoare then
        dbms_output.put_line('comanda este achitata integral.');
    elsif v_suma < v_valoare then
        dbms_output.put_line('comanda este platita partial.');
    else
        dbms_output.put_line('plata depaseste valoarea comenzii.');
    end if;

exception
    when no_data_found then
        dbms_output.put_line('comanda nu exista.');
    when e_plata_inexistenta then
        dbms_output.put_line('nu exista plata pentru aceasta comanda.');
    when others then
        dbms_output.put_line('eroare: ' || sqlerrm);
end;
/

--6.Stergere categorie cu exceptie non-predefinita 
--cerinta:Să se încerce ștergerea unei categorii. 
--Dacă există produse legate de ea și se încalcă restricția referențială,
--să se trateze eroarea prin pragma exception_init și să se afișeze sqlcode și 
--sqlerrm.

declare
    v_id_categorie categorie.id_categorie%type := &p_id_categorie;

    e_fk_violata exception;
    pragma exception_init(e_fk_violata, -2292);

    v_cod number;
    v_mesaj varchar2(200);
begin
    delete from categorie
    where id_categorie = v_id_categorie;

    if sql%rowcount = 0 then
        dbms_output.put_line('nu exista categoria cu acest cod.');
    else
        dbms_output.put_line('categoria a fost stearsa.');
    end if;

exception
    when e_fk_violata then
        v_cod := sqlcode;
        v_mesaj := sqlerrm;

        dbms_output.put_line('nu se poate sterge categoria deoarece exista inregistrari dependente.');
        dbms_output.put_line('cod eroare: ' || v_cod);
        dbms_output.put_line('mesaj eroare: ' || v_mesaj);

    when others then
        dbms_output.put_line('alta eroare: ' || sqlerrm);
end;
/
--7.Procesare comanda cu cursor explicit si exceptie definita de utilizator 
--cerinta: Să se parcurgă produsele dintr-o comandă și să se verifice stocul. 
--Dacă stocul este insuficient, să se declanșeze o excepție explicită. 
--Dacă stocul este suficient, să se afișeze noul stoc estimat.
declare
    v_id_comanda comanda.id_comanda%type := &p_id_comanda;
    v_stoc produs.stoc%type;
    v_stoc_nou produs.stoc%type;
    v_exista number;

    cursor c_detalii is
        select d.id_produs, d.cantitate, p.denumire, p.stoc
        from detalii_comanda d, produs p
        where d.id_produs = p.id_produs
          and d.id_comanda = v_id_comanda;

    rec_det c_detalii%rowtype;

    e_comanda_inexistenta exception;
    e_stoc_insuficient exception;
begin
    select count(*)
    into v_exista
    from comanda
    where id_comanda = v_id_comanda;

    if v_exista = 0 then
        raise e_comanda_inexistenta;
    end if;

    open c_detalii;

    loop
        fetch c_detalii into rec_det;
        exit when c_detalii%notfound;

        v_stoc := rec_det.stoc;

        dbms_output.put_line('produs: ' || rec_det.denumire);
        dbms_output.put_line('cantitate comandata: ' || rec_det.cantitate);
        dbms_output.put_line('stoc curent: ' || v_stoc);

        if v_stoc < rec_det.cantitate then
            raise e_stoc_insuficient;
        else
            v_stoc_nou := v_stoc - rec_det.cantitate;
            dbms_output.put_line('stoc ramas dupa procesare: ' || v_stoc_nou);
        end if;

        dbms_output.put_line('---------------------------');
    end loop;

    close c_detalii;

exception
    when e_comanda_inexistenta then
        dbms_output.put_line('comanda nu exista.');
    when e_stoc_insuficient then
        dbms_output.put_line('stoc insuficient pentru unul dintre produse.');
    when others then
        dbms_output.put_line('eroare: ' || sqlerrm);
end;
/






















