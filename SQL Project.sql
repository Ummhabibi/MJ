USE GMC;
/*Table: CATEGORIES                                          */
/*==============================================================*/
CREATE TABLE CATEGORIES (
   CATEGORY_CODE INT NOT NULL,
   CATEGORY_NAME VARCHAR(25) NOT NULL,
   DESCRIPTION VARCHAR(100) NOT NULL,
   CONSTRAINT PK_CATEGORIES PRIMARY KEY (CATEGORY_CODE)
);
/*==============================================================*/
/* Table: CUSTOMERS                                               */
/*==============================================================*/
CREATE TABLE CUSTOMERS (
   CUSTOMER_CODE CHAR(5) NOT NULL,
   COMPANY NVARCHAR(40) NOT NULL,
   ADDRESS NVARCHAR(60) NOT NULL,
   CITY VARCHAR(30) NOT NULL,
   POSTAL_CODE VARCHAR(10) NOT NULL,
   COUNTRY VARCHAR(15) NOT NULL,
   PHONE VARCHAR(24) NOT NULL,
   FAX VARCHAR(24),
   CONSTRAINT PK_CUSTOMERS PRIMARY KEY (CUSTOMER_CODE)
);

/*==============================================================*/
/* Table: ORDERS                                          */
/*==============================================================*/
CREATE TABLE            ORDERS  (
   ORDER_NUMBER           INT                       NOT NULL,
   CUSTOMER_CODE          CHAR(5)                         NOT NULL,
   EMPLOYEE_NUMBER          INT                       NOT NULL,
   ORDER_DATE	         DATE                            NOT NULL,
   SHIP_DATE          		DATE,
   SHIPPING_COST                DECIMAL(8,2),
   CONSTRAINT PK_ORDERS  PRIMARY KEY (ORDER_NUMBER)
    );
/*==============================================================*/
/* Table: ORDER_DETAILS                                   */
/*==============================================================*/
CREATE TABLE            ORDER_DETAILS  (
   ORDER_NUMBER         INT                       NOT NULL,
   PRODUCT_REF         INT                       NOT NULL,
   UNIT_PRICE       DECIMAL(8,2)                     NOT NULL,
   QUANTITY            INT                       NOT NULL,
   DISCOUNT              FLOAT                           NOT NULL,
   CONSTRAINT PK_DETAILS_ORDERS  PRIMARY KEY (ORDER_NUMBER , PRODUCT_REF )
  );

/*==============================================================*/
/* Table: EMPLOYEES                                             */
/*==============================================================*/
CREATE TABLE            EMPLOYEES (
   EMPLOYEE_NUMBER          INT                       NOT NULL,
   REPORTS_TO         INT,
   LAST_NAME                 NVARCHAR(40)                   NOT NULL,
   FIRST_NAME              NVARCHAR(30)                   NOT NULL,
   POSITION            VARCHAR(30)                    NOT NULL,
   TITLE               VARCHAR(5)                     NOT NULL,
   BIRTH_DATE      DATE                            NOT NULL,
   HIRE_DATE       DATE            DEFAULT GETDATE() NOT NULL,
   SALARY             DECIMAL(8,2)                     NOT NULL,
   COMMISSION          DECIMAL(8,2),
   CONSTRAINT PK_EMPLOYEES PRIMARY KEY (EMPLOYEE_NUMBER)
  );
/*==============================================================*/
/* Table: SUPPLIERS                                          */
/*==============================================================*/
CREATE TABLE            SUPPLIERS  (
   SUPPLIER_NUMBER      INT                       NOT NULL,
   COMPANY             NVARCHAR(40)                   NOT NULL,
   ADDRESS             NVARCHAR(60)                   NOT NULL,
   CITY               VARCHAR(30)                    NOT NULL,
   POSTAL_CODE         VARCHAR(10)                    NOT NULL,
   COUNTRY                VARCHAR(15)                    NOT NULL,
   PHONE          	 VARCHAR(24)                    NOT NULL,
   FAX                 VARCHAR(24),
   CONSTRAINT PK_SUPPLIERS PRIMARY KEY (SUPPLIER_NUMBER)
  );

/*==============================================================*/
/* Table: PRODUCTS                                             */
/*==============================================================*/
CREATE TABLE            PRODUCTS (
   PRODUCT_REF         INT                       NOT NULL,
   PRODUCT_NAME         NVARCHAR(40)                   NOT NULL,
   SUPPLIER_NUMBER      INT                       NOT NULL,
   CATEGORY_CODE     	 INT                       NOT NULL,
   QUANTITY            VARCHAR(30),
   UNIT_PRICE       	DECIMAL(8,2)                     NOT NULL,
   UNITS_IN_STOCK        INT,
   UNITS_ON_ORDER   	INT,
   UNAVAILABLE	        INT,
   CONSTRAINT PK_PRODUCTS  PRIMARY KEY (PRODUCT_REF)
  );
/*==============================================================*/

INSERT INTO EMPLOYEES VALUES (2, 2, 'Fuller', 'Andrew', 'Vice President', 'Dr.', '02/19/52', '08/14/92', 10000.00, NULL); 
INSERT INTO EMPLOYEES VALUES (8, 2, 'Callahan', 'Laura', 'Sales Assistant', 'Miss', '01/09/58', '03/05/94', 2000.00, NULL);
INSERT INTO EMPLOYEES VALUES (4, 2, 'Peacock', 'Margaret', 'Sales Representative', 'Mrs.', '09/19/58', '05/03/93', 2856.00, 250.00);
INSERT INTO EMPLOYEES VALUES (3, 2, 'Leverling', 'Janet', 'Sales Representative', 'Miss', '08/30/63', '04/01/92', 3500.00, 1000.00);
INSERT INTO EMPLOYEES VALUES (1, 2, 'Davolio', 'Nancy', 'Sales Representative', 'Miss', '12/08/68', '05/01/92', 3135.00, 1500.00);
INSERT INTO EMPLOYEES VALUES (5, 2, 'Buchanan', 'Steven', 'Sales Manager', 'Mr.', '03/04/55', '10/17/93', 8000.00, NULL);
INSERT INTO EMPLOYEES VALUES (9, 5, 'Dodsworth', 'Anne', 'Sales Representative', 'Miss', '07/02/69', '11/15/94', 2180.00, 0.00);
INSERT INTO EMPLOYEES VALUES (6, 5, 'Suyama', 'Michael', 'Sales Representative', 'Mr.', '07/02/63', '10/17/93', 2534.00, 600.00);
INSERT INTO EMPLOYEES VALUES (7, NULL, 'King', 'Robert', 'Sales Representative', 'Mr.', '05/29/60', '01/02/94', 2356.00, 800.00);

SELECT * FROM CATEGORIES;

/*==============================================================*/
INSERT INTO CATEGORIES VALUES (1, 'Beverages', 'Beverages, coffees, teas');
INSERT INTO CATEGORIES VALUES (2, 'Condiments', 'Sauces, seasonings, and spices');
INSERT INTO CATEGORIES VALUES (3, 'Desserts', 'Desserts and sweets');
INSERT INTO CATEGORIES VALUES (4, 'Dairy Products', 'Cheeses');
INSERT INTO CATEGORIES VALUES (5, 'Pasta and Cereals', 'Breads, biscuits, pasta, and cereals');
INSERT INTO CATEGORIES VALUES (6, 'Meats', 'Prepared meats');
INSERT INTO CATEGORIES VALUES (7, 'Dry Products', 'Dried fruits, raisins, others');
INSERT INTO CATEGORIES VALUES (8, 'Fish and Seafood', 'Fish, seafood, snails');
INSERT INTO CATEGORIES VALUES (9, 'Computer Equipment', 'Laptops, keyboards, mice');


/*==============================================================*/


SELECT * FROM CUSTOMERS;




INSERT INTO CUSTOMERS VALUES ( 'ALFKI','Alfreds Futterkiste','Obere Str. 57','Berlin','12209','Allemagne','030-0074321','030-0076545' );

INSERT INTO CUSTOMERS VALUES ( 'ANATR','Ana Trujillo Emparedados y helados','Avda. de la Constituci�n 2222','M�xico D.F.','05021','Mexique','(5) 555-4729','(5) 555-3745' );

INSERT INTO CUSTOMERS VALUES ( 'ANTON','Antonio Moreno Taquer�a','Mataderos  2312','M�xico D.F.','05023','Mexique','(5) 555-3932','' );

INSERT INTO CUSTOMERS VALUES ( 'AROUT','Around the Horn','120 Hanover Sq.','London','WA1 4SD','Royaume-Uni','(71) 555-7788','(71) 555-6750' );

INSERT INTO CUSTOMERS VALUES ( 'BERGS','Berglunds snabbk�p','Berguvsv�gen  8','Lule�','S-958 22','Su�de','0921-12 34 65','0921-12 34 67' );

INSERT INTO CUSTOMERS VALUES ('BLAUS','BlauerSeeDelikatessen','Forsterstr. 57','Mannheim','68306','Allemagne','0621-08460','0621-08924' );

INSERT INTO CUSTOMERS VALUES ( 'BLONP','Blondel p�re et fils','24, place Kl�ber','Strasbourg','67000','France','03.88.60.15.31','03.88.60.15.32' );

INSERT INTO CUSTOMERS VALUES ( 'BOLID','B�lido Comidas preparadas','Araquil, 67','Madrid','28023','Espagne','(91) 555 22 82','(91) 555 91 99' );

INSERT INTO CUSTOMERS VALUES ( 'BONAP','Bon app''','12, rue des Bouchers','Marseille','13008','France','04.91.24.45.40','04.91.24.45.41' );

INSERT INTO CUSTOMERS VALUES ( 'BOTTM','Bottom-Dollar Markets','23 Tsawassen Blvd.','Tsawassen','T2F 8M4','Canada','(604) 555-4729','(604) 555-3745' );

INSERT INTO CUSTOMERS VALUES ( 'BSBEV','B''s Beverages','Fauntleroy Circus','London','EC2 4SD','Royaume-Uni','(71) 555-1212','' );

INSERT INTO CUSTOMERS VALUES ( 'CACTU','Cactus Comidas para llevar','Cerrito 333','Buenos Aires','1010','Argentine','(1) 135-5555','(1) 135-4892' );

INSERT INTO CUSTOMERS VALUES ( 'CENTC','Centro comercial Moctezuma','Sierras de Granada 9993','M�xico D.F.','05022','Mexique','(5) 555-3392','(5) 555-7293' );

INSERT INTO CUSTOMERS VALUES ( 'CHOPS','Chop-suey Chinese','Hauptstr. 29','Bern','3012','Suisse','0452-076545','' );

INSERT INTO CUSTOMERS VALUES ( 'COMMI','Com�rcio Mineiro','Av. dos Lus�adas, 23','S�o Paulo','05432-043','Br�sil','(11) 555-7647','' );

INSERT INTO CUSTOMERS VALUES ( 'CONSH','Consolidated Holdings','Berkeley Gardens12  Brewery ','London','WX1 4SD','Royaume-Uni','(71) 555-2282','(71) 555-9199' );

INSERT INTO CUSTOMERS VALUES ( 'DRACD','Drachenblut Delikatessen','Walserweg 21','Aachen','52066','Allemagne','0241-039123','0241-059428' );

INSERT INTO CUSTOMERS VALUES ( 'DUMON','Du monde entier','67, rue des Cinquante Otages','Nantes','44000','France','02.40.67.88.88','02.40.67.89.89' );

INSERT INTO CUSTOMERS VALUES ( 'EASTC','Eastern Connection','35 King George','London','WX3 6FW','Royaume-Uni','(71) 555-0297','(71) 555-3373' );

INSERT INTO CUSTOMERS VALUES ( 'ERNSH','Ernst Handel','Kirchgasse 6','Graz','8010','Autriche','7675-3425','7675-3426' );

INSERT INTO CUSTOMERS VALUES ( 'FAMIA','Familia Arquibaldo','Rua Or�s, 92','S�o Paulo','05442-030','Br�sil','(11) 555-9857','' );

INSERT INTO CUSTOMERS VALUES ( 'FISSA','FISSA Fabrica Inter. Salchichas S.A.','Moralzarzal, 86','Madrid','28034','Espagne','(91) 555 94 44','(91) 555 55 93' );

INSERT INTO CUSTOMERS VALUES ( 'FOLIG','Folies gourmandes','184, chauss�e de Tournai','Lille','59000','France','03.20.16.10.16','03.20.16.10.17' );

INSERT INTO CUSTOMERS VALUES ( 'FOLKO','Folk och f� HB','�kergatan 24','Br�cke','S-844 67','Su�de','0695-34 67 21','' );

INSERT INTO CUSTOMERS VALUES ( 'FRANK','Frankenversand','Berliner Platz 43','M�nchen','80805','Allemagne','089-0877310','089-0877451' );

INSERT INTO CUSTOMERS VALUES ( 'FRANR','France restauration','54, rue Royale','Nantes','44000','France','02.40.32.21.21','02.40.32.21.20' );

INSERT INTO CUSTOMERS VALUES ( 'FRANS','Franchi S.p.A.','Via Monte Bianco 34','Torino','10100','Italie','011-4988260','011-4988261' );
INSERT INTO CUSTOMERS VALUES ( 'FURIB','Furia Bacalhau e Frutos do Mar','Jardim das rosas n. 32','Lisboa','1675','Portugal','(1) 354-2534','(1) 354-2535' );

INSERT INTO CUSTOMERS VALUES ( 'GALED','Galer�a del gastr�nomo','Rambla de Catalu�a, 23','Barcelona','08022','Espagne','(93) 203 4560','(93) 203 4561' );

INSERT INTO CUSTOMERS VALUES ( 'GODOS','Godos Cocina T�pica','Romero, 33','Sevilla','41101','Espagne','(95) 555 82 82','' );

INSERT INTO CUSTOMERS VALUES ( 'GOURL','Gourmet Lanchonetes','Av. Brasil, 442','Campinas','04876-786','Br�sil','(11) 555-9482','' );

INSERT INTO CUSTOMERS VALUES ( 'GREAL','Great Lakes Food Market','2732 Baker Blvd.','Eugene','97403','�tats-Unis','(503) 555-7555','' );

INSERT INTO CUSTOMERS VALUES ( 'GROSR','GROSELLA-Restaurante','5� Ave. Los Palos Grandes','Caracas','1081','Venezuela','(2) 283-2951','(2) 283-3397' );

INSERT INTO CUSTOMERS VALUES ( 'HANAR','Hanari Carnes','Rua do Pa�o, 67','Rio de Janeiro','05454-876','Br�sil','(21) 555-0091','(21) 555-8765' );

INSERT INTO CUSTOMERS VALUES ( 'HILAA','HILARI�N-Abastos','Carrera 22 con Ave. Carlos Soublette #8-35','San Crist�bal','5022','Venezuela','(5) 555-1340','(5) 555-1948' );

INSERT INTO CUSTOMERS VALUES ( 'HUNGC','Hungry Coyote Import Store','City Center Plaza516 Main St.','Elgin','97827','�tats-Unis','(503) 555-6874','(503) 555-2376' );

INSERT INTO CUSTOMERS VALUES ( 'HUNGO','Hungry Owl All-Night Grocers','8 Johnstown Road','Cork','2506','Irlande','2967 542','2967 3333' );

INSERT INTO CUSTOMERS VALUES ( 'ISLAT','Island Trading','Garden HouseCrowther Way','Cowes','PO31 7PJ','Royaume-Uni','(198) 555-8888','' );

INSERT INTO CUSTOMERS VALUES ( 'KOENE','K�niglich Essen','Maubelstr. 90','Brandenburg','14776','Allemagne','0555-09876','' );

INSERT INTO CUSTOMERS VALUES ( 'LACOR','La corne d''abondance','67, avenue de l''Europe','Versailles','78000','France','01.30.59.84.10','01.30.59.85.11' );

INSERT INTO CUSTOMERS VALUES ( 'LAMAI','La maison d''Asie','1 rue Alsace-Lorraine','Toulouse','31000','France','05.61.77.61.10','05.61.77.61.11' );

INSERT INTO CUSTOMERS VALUES ( 'LAUGB','Laughing Bacchus Wine Cellars','1900 Oak St.','Vancouver','V3F 2K1','Canada','(604) 555-3392','(604) 555-7293' );

INSERT INTO CUSTOMERS VALUES ( 'LAZYK','Lazy K Kountry Store','12 Orchestra Terrace','Walla Walla','99362','�tats-Unis','(509) 555-7969','(509) 555-6221' );

INSERT INTO CUSTOMERS VALUES ( 'LEHMS','Lehmanns Marktstand','Magazinweg 7','Frankfurt a.M. ','60528','Allemagne','069-0245984','069-0245874' );

INSERT INTO CUSTOMERS VALUES ( 'LETSS','Let''s Stop N Shop','87 Polk St.Suite 5','San Francisco','94117','�tats-Unis','(415) 555-5938','' );

INSERT INTO CUSTOMERS VALUES ( 'LILAS','LILA-Supermercado','Carrera 52 con Ave. Bol�var #65-98 Llano Largo','Barquisimeto','3508','Venezuela','(9) 331-6954','(9) 331-7256' );

INSERT INTO CUSTOMERS VALUES ( 'LINOD','LINO-Delicateses','Ave. 5 de Mayo Porlamar','I. de Margarita','4980','Venezuela','(8) 34-56-12','(8) 34-93-93' );

INSERT INTO CUSTOMERS VALUES ( 'LONEP','Lonesome Pine Restaurant','89 Chiaroscuro Rd.','Portland','97219','�tats-Unis','(503) 555-9573','(503) 555-9646' );

INSERT INTO CUSTOMERS VALUES ( 'MAGAA','Magazzini Alimentari Riuniti','Via Ludovico il Moro 22','Bergamo','24100','Italie','035-640230','035-640231' );

INSERT INTO CUSTOMERS VALUES ( 'MAISD','Maison Dewey','Rue Joseph-Bens 532','Bruxelles','B-1180','Belgique','(02) 201 24 67','(02) 201 24 68' );

INSERT INTO CUSTOMERS VALUES ( 'MEREP','M�re Paillarde','43 rue St. Laurent','Montr�al','H1J 1C3','Canada','(514) 555-8054','(514) 555-8055' );

INSERT INTO CUSTOMERS VALUES ( 'MORGK','Morgenstern Gesundkost','Heerstr. 22','Leipzig','04179','Allemagne','0342-023176','' );

INSERT INTO CUSTOMERS VALUES ( 'NORTS','North/South','South House300 Queensbridge','London','SW7 1RZ','Royaume-Uni','(71) 555-7733','(71) 555-2530' );

INSERT INTO CUSTOMERS VALUES ( 'OCEAN','Oc�ano Atl�ntico Ltda.','Ing. Gustavo Moncada 8585Piso 20-A','Buenos Aires','1010','Argentine','(1) 135-5333','(1) 135-5535' );

INSERT INTO CUSTOMERS VALUES ( 'OLDWO','Old World Delicatessen','2743 Bering St.','Anchorage','99508','�tats-Unis','(907) 555-7584','(907) 555-2880' );

INSERT INTO CUSTOMERS VALUES ( 'OTTIK','Ottilies K�seladen','Mehrheimerstr. 369','K�ln','50739','Allemagne','0221-0644327','0221-0765721' );

INSERT INTO CUSTOMERS VALUES ( 'PARIS','Paris sp�cialit�s','265, boulevard Charonne','Paris','75012','France','01.42.34.22.66','01.42.34.22.77' );

INSERT INTO CUSTOMERS VALUES ( 'PERIC','Pericles Comidas cl�sicas','Calle Dr. Jorge Cash 321','M�xico D.F.','05033','Mexique','(5) 552-3745','(5) 545-3745' );

INSERT INTO CUSTOMERS VALUES ( 'PICCO','Piccolo und mehr','Geislweg 14','Salzburg','5020','Autriche','6562-9722','6562-9723' );

INSERT INTO CUSTOMERS VALUES ( 'PRINI','Princesa Isabel Vinhos','Estrada da sa�de n. 58','Lisboa','1756','Portugal','(1) 356-5634','' );

INSERT INTO CUSTOMERS VALUES ( 'QUEDE','Que Del�cia','Rua da Panificadora, 12','Rio de Janeiro','02389-673','Br�sil','(21) 555-4252','(21) 555-4545' );

INSERT INTO CUSTOMERS VALUES ( 'QUEEN','Queen Cozinha','Alameda dos Can�rios, 891','S�o Paulo','05487-020','Br�sil','(11) 555-1189','' );

INSERT INTO CUSTOMERS VALUES ( 'QUICK','QUICK-Stop','Taucherstra�e 10','Cunewalde','01307','Allemagne','0372-035188','' );

INSERT INTO CUSTOMERS VALUES ( 'RANCH','Rancho grande','Av. del Libertador 900','Buenos Aires','1010','Argentine','(1) 123-5555','(1) 123-5556' );

INSERT INTO CUSTOMERS VALUES ( 'RATTC','Rattlesnake Canyon Grocery','2817 Milton Dr.','Albuquerque','87110','�tats-Unis','(505) 555-5939','(505) 555-3620' );

INSERT INTO CUSTOMERS VALUES ( 'REGGC','Reggiani Caseifici','Strada Provinciale 124','Reggio Emilia','42100','Italie','0522-556721','0522-556722' );

INSERT INTO CUSTOMERS VALUES ( 'RICAR','Ricardo Adocicados','Av. Copacabana, 267','Rio de Janeiro','02389-890','Br�sil','(21) 555-3412','' );

INSERT INTO CUSTOMERS VALUES ( 'RICSU','Richter Supermarkt','Grenzacherweg 237','Gen�ve','1203','Suisse','0897-034214','' );

INSERT INTO CUSTOMERS VALUES ( 'ROMEY','Romero y tomillo','Gran V�a, 1','Madrid','28001','Espagne','(91) 745 6200','(91) 745 6210' );

INSERT INTO CUSTOMERS VALUES ( 'SANTG','Sant� Gourmet','Erling Skakkes gate 78','Stavern','4110','Norv�ge','07-98 92 35','07-98 92 47' );

INSERT INTO CUSTOMERS VALUES ( 'SAVEA','Save-a-lot Markets','187 Suffolk Ln.','Boise','83720','�tats-Unis','(208) 555-8097','' );

INSERT INTO CUSTOMERS VALUES ( 'SEVES','Seven Seas Imports','90 Wadhurst Rd.','London','OX15 4NB','Royaume-Uni','(71) 555-1717','(71) 555-5646' );

INSERT INTO CUSTOMERS VALUES ( 'SIMOB','Simons bistro','Vinb�ltet 34','K�benhavn','1734','Danemark','31 12 34 56','31 13 35 57' );

INSERT INTO CUSTOMERS VALUES ( 'SPECD','Sp�cialit�s du monde','25, rue Lauriston','Paris','75016','France','01.47.55.60.10','01.47.55.60.20' );

INSERT INTO CUSTOMERS VALUES ( 'SPLIR','Split Rail Beer  Ale','P.O. Box 555','Lander','82520','�tats-Unis','(307) 555-4680','(307) 555-6525' );


INSERT INTO CUSTOMERS VALUES ( 'SUPRD','Supr�mes d�lices','Boulevard Tirou, 255','Charleroi','B-6000','Belgique','(071) 23 67 22 20','(071) 23 67 22 21' );

INSERT INTO CUSTOMERS VALUES ( 'THEBI','The Big Cheese','89 Jefferson WaySuite 2','Portland','97201','�tats-Unis','(503) 555-3612','' );

INSERT INTO CUSTOMERS VALUES ( 'THECR','The Cracker Box','55 Grizzly Peak Rd.','Butte','59801','�tats-Unis','(406) 555-5834','(406) 555-8083' );

INSERT INTO CUSTOMERS VALUES ( 'TOMSP','Toms Spezialit�ten','Luisenstr. 48','M�nster','44087','Allemagne','0251-031259','0251-035695' );

INSERT INTO CUSTOMERS VALUES ( 'TORTU','Tortuga Restaurante','Avda. Azteca 123','M�xico D.F.','05033','Mexique','(5) 555-2933','' );

INSERT INTO CUSTOMERS VALUES ( 'TRADH','Tradi��o Hipermercados','Av. In�s de Castro, 414','S�o Paulo','05634-030','Br�sil','(11) 555-2167','(11) 555-2168' );

INSERT INTO CUSTOMERS VALUES ( 'TRAIH','Trail''s Head Gourmet Provisioners','722 DaVinci Blvd.','Kirkland','98034','�tats-Unis','(206) 555-8257','(206) 555-2174' );

INSERT INTO CUSTOMERS VALUES ( 'VAFFE','Vaffeljernet','Smagsl�get 45','�rhus','8200','Danemark','86 21 32 43','86 22 33 44' );

INSERT INTO CUSTOMERS VALUES ( 'VICTE','Victuailles en stock','2, rue du Commerce','Lyon','69004','France','04.78.32.54.86','04.78.32.54.87' );

INSERT INTO CUSTOMERS VALUES ( 'VINET','Vinis et Chevalier','59 rue de l''Abbaye','Reims','51100','France','03.26.47.15.10','03.26.47.15.11' );

INSERT INTO CUSTOMERS VALUES ( 'WANDK','Die Wandernde Kuh','Adenauerallee 900','Stuttgart','70563','Allemagne','0711-020361','0711-035428' );

INSERT INTO CUSTOMERS VALUES ( 'WARTH','Wartian Herkku','Torikatu 38','Oulu','90110','Finlande','981-443655','981-443655' );

INSERT INTO CUSTOMERS VALUES ( 'WELLI','Wellington Importadora','Rua do Mercado, 12','Resende','08737-363','Br�sil','(14) 555-8122','' );

INSERT INTO CUSTOMERS VALUES ( 'WHITC','White Clover Markets','305 - 14th Ave. S.Suite 3B','Seattle','98128','�tats-Unis','(206) 555-4112','(206) 555-4115' );

INSERT INTO CUSTOMERS VALUES ( 'WILMK','Wilman Kala','Keskuskatu 45','Helsinki','21240','Finlande','90-224 8858','90-224 8858' );

INSERT INTO CUSTOMERS VALUES ( 'WOLZA','Wolski  Zajazd','ul. Filtrowa 68','Warszawa','01-012','Pologne','(26) 642-7012','(26) 642-7012' );

INSERT INTO CUSTOMERS VALUES ( 'MONP','MONOPRIX - SFAX EL AIN','Route d''El Ain Km 1,5 3000 Sfax ','Safx','1003','Tunisie','(26) 642-7012','(26) 642-7012' );

/*==============================================================*/
SELECT * FROM CUSTOMERS;

SELECT * FROM SUPPLIERS;

INSERT INTO SUPPLIERS VALUES ( 1,'Exotic Liquids','49 Gilbert St.','London','EC1 4SD','Royaume-Uni','(171) 555-2222','' );

INSERT INTO SUPPLIERS VALUES ( 2,'Nouvelle-Orl�ans Cajun Delights','P.O. Box 78934','Nouvelle-Orl�ans','70117','Etats-Unis','(100) 555-4822','' );

INSERT INTO SUPPLIERS VALUES ( 3,'Grandma Kelly''s Homestead','707 Oxford Rd.','Ann Arbor','48104','Etats-Unis','(313) 555-5735','(313) 555-3349' );

INSERT INTO SUPPLIERS VALUES ( 4,'Tokyo Traders','9-8 SekimaiMusashino-shi','Tokyo','100','Japon','(03) 3555-5011','' );

INSERT INTO SUPPLIERS VALUES ( 5,'Cooperativa de Quesos ''Las Cabras''','Calle del Rosal 4','Oviedo','33007','Espagne','(98) 598 76 54','' );

INSERT INTO SUPPLIERS VALUES ( 6,'Mayumi''s','92 SetsukoChuo-ku','Osaka','545','Japon','(06) 431-7877','' );

INSERT INTO SUPPLIERS VALUES ( 7,'Pavlova, Ltd.','74 Rose St.Moonie Ponds','Melbourne','3058','Australie','(059) 55-5450','(03) 444-6588' );

INSERT INTO SUPPLIERS VALUES ( 8,'Specialty Biscuits, Ltd.','29 King''s Way','Manchester','M14 GSD','Royaume-Uni','(161) 555-4448','' );

INSERT INTO SUPPLIERS VALUES ( 9,'PB Kn�ckebr�d AB','Kaloadagatan 13','G�teborg','S-345 67','Su�de','031-987 65 43','031-987 65 91' );

INSERT INTO SUPPLIERS VALUES ( 10,'Refrescos Americanas LTDA','Av. das Americanas 12.890','S�o Paulo','5442','Br�sil','(11) 555 4640','' );

INSERT INTO SUPPLIERS VALUES ( 11,'Heli S��waren GmbH  Co. KG','Tiergartenstra�e 5','Berlin','10785','Allemagne','(010) 9984510','' );

INSERT INTO SUPPLIERS VALUES ( 12,'Plutzer Lebensmittelgro�m�rkte AG','Bogenallee 51','Frankfurt','60439','Allemagne','(069) 992755','' );

INSERT INTO SUPPLIERS VALUES ( 13,'Nord-Ost-Fisch Handelsgesellschaft mbH','Frahmredder 112a','Cuxhaven','27478','Allemagne','(04721) 8713','(04721) 8714' );

INSERT INTO SUPPLIERS VALUES ( 14,'Formaggi Fortini s.r.l.','Viale Dante, 75','Ravenna','48100','Italie','(0544) 60323','(0544) 60603' );

INSERT INTO SUPPLIERS VALUES ( 15,'Norske Meierier','Hatlevegen 5','Sandvika','1320','Norv�ge','(0)2-953010','' );

INSERT INTO SUPPLIERS VALUES ( 16,'Bigfoot Breweries','3400 - 8th AvenueSuite 210','Bend','97101','Etats-Unis','(503) 555-9931','' );

INSERT INTO SUPPLIERS VALUES ( 17,'Svensk Sj�f�da AB','Brovallav�gen 231','Stockholm','S-123 45','Su�de','08-123 45 67','' );

INSERT INTO SUPPLIERS VALUES ( 18,'Aux joyeux eccl�siastiques','203, Rue des Francs-Bourgeois','Paris','75004','France','01.03.83.00.68','01.03.83.00.62' );

INSERT INTO SUPPLIERS VALUES ( 19,'New England Seafood Cannery','Order Processing Dept.2100 Paul Revere Blvd.','Boston','02134','Etats-Unis','(617) 555-3267','(617) 555-3389' );

INSERT INTO SUPPLIERS VALUES ( 20,'Leka Trading','471 Serangoon Loop, Suite #402','Singapore','0512','Singapour','555-8787','' );

INSERT INTO SUPPLIERS VALUES ( 21,'Lyngbysild','LyngbysildFiskebakken 10','Lyngby','2800','Danemark','43844108','43844115' );

INSERT INTO SUPPLIERS VALUES ( 22,'Zaanse Snoepfabriek','VerkoopRijnweg 22','Zaandam','9999 ZZ','Pays-Bas','(12345)1212','(12345) 1210' );

INSERT INTO SUPPLIERS VALUES ( 23,'Karkki Oy','Valtakatu 12','Lappeenranta','53120','Finlande','(953) 10956','' );

INSERT INTO SUPPLIERS VALUES ( 24,'G''day, Mate','170 Prince Edward ParadeHunter''s Hill','Sydney','2042','Australie','(02) 555-4873','(02) 555-4873' );

INSERT INTO SUPPLIERS VALUES ( 25,'Ma Maison','2960 Rue St. Laurent','Montr�al','H1J 1C3','Canada','(514) 555-9022','' );

INSERT INTO SUPPLIERS VALUES ( 26,'Pasta Buttini s.r.l.','Via dei Gelsomini, 153','Salerno','84100','Italie','(089) 6547665','(089) 6547667' );

INSERT INTO SUPPLIERS VALUES ( 27,'Escargots Nouveaux','22, rue H. Voiron','Montceau','71300','France','04.85.57.00.07','' );

INSERT INTO SUPPLIERS VALUES ( 28,'Gai p�turage','Bat. B3, rue des Alpes','Annecy','74000','France','04.38.76.98.06','04.38.76.98.58' );

INSERT INTO SUPPLIERS VALUES ( 29,'For�ts d''�rables','148 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canada','(514) 555-2955','(514) 555-2921' );

INSERT INTO SUPPLIERS VALUES ( 30,'Lenovo','149 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canada','(514) 555-2956','(514) 555-2922' );

INSERT INTO SUPPLIERS VALUES ( 31,'Asus','150 rue Chasseur','Ste-Hyacinthe','J2S 7S8','Canada','(514) 555-2957','(514) 555-2923' );


/*==============================================================*/

INSERT INTO PRODUCTS VALUES (1, 'Chai', 1, 1, '10 boxes x 20 bags', 90.00, 39, 0, 0);
INSERT INTO PRODUCTS VALUES (2, 'Chang', 1, 1, '24 bottles (1 liter)', 95.00, 17, 40, 0);
INSERT INTO PRODUCTS VALUES (3, 'Aniseed Syrup', 1, 2, '12 bottles (550 ml)', 50.00, 13, 70, 0);
INSERT INTO PRODUCTS VALUES (4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 jars (6 ounces)', 110.00, 53, 0, 0);
INSERT INTO PRODUCTS VALUES (6, 'Grandma''s Boysenberry Spread', 3, 2, '12 jars (8 ounces)', 125.00, 120, 0, 0);
INSERT INTO PRODUCTS VALUES (7, 'Uncle Bob''s Organic Dried Pears', 3, 7, '12 cartons (1 kg)', 150.00, 15, 0, 0);
INSERT INTO PRODUCTS VALUES (8, 'Northwoods Cranberry Sauce', 3, 2, '12 jars (12 ounces)', 200.00, 6, 0, 0);
INSERT INTO PRODUCTS VALUES (9, 'Mishi Kobe Niku', 4, 6, '18 cartons (500 g)', 485.00, 29, 0, -1);
INSERT INTO PRODUCTS VALUES (10, 'Ikura', 4, 8, '12 jars (200 g)', 155.00, 31, 0, 0);
INSERT INTO PRODUCTS VALUES (11, 'Queso Cabrales', 5, 4, '1 carton (1 kg)', 105.00, 22, 30, 0);
INSERT INTO PRODUCTS VALUES (12, 'Queso Manchego La Pastora', 5, 4, '10 cartons (500 g)', 190.00, 86, 0, 0);
INSERT INTO PRODUCTS VALUES (13, 'Konbu', 6, 8, '1 box (2 kg)', 30.00, 24, 0, 0);
INSERT INTO PRODUCTS VALUES (17, 'Alice Mutton', 7, 6, '20 boxes (1 kg)', 195.00, 0, 0, -1);
INSERT INTO PRODUCTS VALUES (19, 'Teatime Chocolate Biscuits', 8, 3, '10 boxes x 12 pieces', 46.00, 25, 0, 0);
INSERT INTO PRODUCTS VALUES (20, 'Sir Rodney''s Marmalade', 8, 3, '30 jars', 405.00, 40, 0, 0);
INSERT INTO PRODUCTS VALUES (21, 'Sir Rodney''s Scones', 8, 3, '24 cartons x 4 pieces', 50.00, 3, 40, 0);
INSERT INTO PRODUCTS VALUES (22, 'Gustaf''s Kn�ckebr�d', 9, 5, '24 cartons (500 g)', 105.00, 104, 0, 0);
INSERT INTO PRODUCTS VALUES (23, 'Tunnbr�d', 9, 5, '12 cartons (250 g)', 45.00, 61, 0, 0);
INSERT INTO PRODUCTS VALUES (25, 'NuNuCa Nu�-Nougat-Creme', 11, 3, '20 jars (450 g)', 70.00, 76, 0, 0);
INSERT INTO PRODUCTS VALUES (28, 'R�ssle Sauerkraut', 12, 7, '25 cans (825 g)', 228.00, 26, 0, -1);
INSERT INTO PRODUCTS VALUES (32, 'Mascarpone Fabioli', 14, 4, '24 cartons (200 g)', 160.00, 9, 40, 0);
INSERT INTO PRODUCTS VALUES (34, 'Sasquatch Ale', 16, 1, '24 bottles (70 cl)', 70.00, 111, 0, 0);
INSERT INTO PRODUCTS VALUES (35, 'Steeleye Stout', 16, 1, '24 bottles (1 liter)', 90.00, 20, 0, 0);
INSERT INTO PRODUCTS VALUES (36, 'Inlagd Sill', 17, 8, '24 jars (250 g)', 95.00, 112, 0, 0);
INSERT INTO PRODUCTS VALUES (37, 'Gravad lax', 17, 8, '12 cartons (500 g)', 130.00, 11, 50, 0);
INSERT INTO PRODUCTS VALUES (39, 'Chartreuse verte', 18, 1, '1 bottle (750 cc)', 90.00, 69, 0, 0);
INSERT INTO PRODUCTS VALUES (40, 'Boston Crab Meat', 19, 8, '24 cans (4 ounces)', 92.00, 123, 0, 0);
INSERT INTO PRODUCTS VALUES (42, 'Singaporean Hokkien Fried Mee', 20, 5, '32 cartons (1 kg)', 70.00, 26, 0, -1);
INSERT INTO PRODUCTS VALUES (43, 'Ipoh Coffee', 20, 1, '16 boxes (500 g)', 230.00, 17, 10, 0);
INSERT INTO PRODUCTS VALUES (46, 'Spegesild', 21, 8, '4 cans (250 g)', 60.00, 95, 0, 0);
INSERT INTO PRODUCTS VALUES (49, 'Maxilaku', 23, 3, '24 cartons (50 g)', 100.00, 10, 60, 0);
INSERT INTO PRODUCTS VALUES (51, 'Manjimup Dried Apples', 24, 7, '50 cartons (300 g)', 265.00, 20, 0, 0);
INSERT INTO PRODUCTS VALUES (52, 'Filo Mix', 24, 5, '16 boxes (2 kg)', 35.00, 38, 0, 0);
INSERT INTO PRODUCTS VALUES (53, 'Perth Pasties', 24, 6, '48 pieces', 164.00, 0, 0, -1);
INSERT INTO PRODUCTS VALUES (55, 'P�t� chinois', 25, 6, '24 boxes x 2 pies', 120.00, 115, 0, 0);
INSERT INTO PRODUCTS VALUES (56, 'Gnocchi di nonna Alice', 26, 5, '24 cartons (250 g)', 190.00, 21, 10, 0);
INSERT INTO PRODUCTS VALUES (59, 'Raclette Courdavault', 28, 4, '1 carton (5 kg)', 275.00, 79, 0, 0);
INSERT INTO PRODUCTS VALUES (60, 'Camembert Pierrot', 28, 4, '15 units (300 g)', 170.00, 19, 0, 0);
INSERT INTO PRODUCTS VALUES (66, 'Louisiana Hot Spiced Okra', 2, 2, '24 jars (8 ounces)', 85.00, 4, 100, 0);
INSERT INTO PRODUCTS VALUES (67, 'Laughing Lumberjack Lager', 16, 1, '24 bottles (12 ounces)', 70.00, 52, 0, 0);
INSERT INTO PRODUCTS VALUES (69, 'Gudbrandsdalsost', 15, 4, '1 carton (10 kg)', 180.00, 26, 0, 0);
INSERT INTO PRODUCTS VALUES (70, 'Outback Lager', 7, 1, '24 bottles (355 ml)', 75.00, 15, 10, 0);
INSERT INTO PRODUCTS VALUES (72, 'Mozzarella di Giovanni', 14, 4, '24 cartons (200 g)', 174.00, 14, 0, 0);
INSERT INTO PRODUCTS VALUES (73, 'R�d Kaviar', 17, 8, '24 jars (150 g)', 75.00, 101, 0, 0);
INSERT INTO PRODUCTS VALUES (74, 'Longlife Tofu', 4, 7, '1 carton (5 kg)', 50.00, 4, 20, 0);
INSERT INTO PRODUCTS VALUES (76, 'Lakkalik��ri', 23, 1, '1 bottle (500 ml)', 90.00, 57, 0, 0);
INSERT INTO PRODUCTS VALUES (77, 'Original Frankfurter gr�ne So�e', 12, 2, '12 cans', 65.00, 32, 0, 0);
INSERT INTO PRODUCTS VALUES (5, 'Chef Anton''s Gumbo Mix', 2, 2, '36 cans', 106.00, 0, 0, 1);
INSERT INTO PRODUCTS VALUES (14, 'Tofu', 6, 7, '40 cartons (100 g)', 116.00, 35, 0, 0);
INSERT INTO PRODUCTS VALUES (15, 'Genen Shouyu', 6, 2, '24 bottles (250 ml)', 78.00, 5, 0, 0);

SELECT * FROM ORDERS;

/*==============================================================*/

INSERT INTO ORDERS  VALUES (10354, 'PERIC', 8, CONVERT(date, '14/11/96', 3), CONVERT(date, '20/11/96', 3), 2.69);
INSERT INTO ORDERS  VALUES ( 10365,'ANTON',3,CONVERT(date,'27/11/96',3), CONVERT(date,'02/12/96', 3), 1.10);
INSERT INTO ORDERS VALUES (10410, 'BOTTM', 3, CONVERT(date, '10/01/97', 3), CONVERT(date, '15/01/97', 3), .12);
INSERT INTO ORDERS VALUES (10415, 'HUNGC', 3, CONVERT(date, '15/01/97', 3), CONVERT(date, '24/01/97', 3), .01);
INSERT INTO ORDERS VALUES (10464, 'FURIB', 4, CONVERT(date, '04/03/97', 3), CONVERT(date, '14/03/97', 3), 4.45);
INSERT INTO ORDERS VALUES (10472, 'SEVES', 8, CONVERT(date, '12/03/97', 3), CONVERT(date, '19/03/97', 3), .21);
INSERT INTO ORDERS VALUES (10556, 'SIMOB', 2, CONVERT(date, '03/06/97', 3), CONVERT(date, '13/06/97', 3), .49);
INSERT INTO ORDERS VALUES (10566, 'BLONP', 9, CONVERT(date, '12/06/97', 3), CONVERT(date, '18/06/97', 3), 4.42);
INSERT INTO ORDERS VALUES (10574, 'TRAIH', 4, CONVERT(date, '19/06/97', 3), CONVERT(date, '30/06/97', 3), 1.88);
INSERT INTO ORDERS VALUES (10578, 'BSBEV', 4, CONVERT(date, '24/06/97', 3), CONVERT(date, '25/07/97', 3), 1.48);
INSERT INTO ORDERS VALUES (10593, 'LEHMS', 7, CONVERT(date, '09/07/97', 3), CONVERT(date, '13/08/97', 3), 8.71);
INSERT INTO ORDERS VALUES (10606, 'TRADH', 4, CONVERT(date, '22/07/97', 3), CONVERT(date, '31/07/97', 3), 3.97);
INSERT INTO ORDERS VALUES (10624, 'THECR', 4, CONVERT(date, '07/08/97', 3), CONVERT(date, '19/08/97', 3), 4.74);
INSERT INTO ORDERS VALUES (10649, 'MAISD', 5, CONVERT(date, '28/08/97', 3), CONVERT(date, '29/08/97', 3), .31);
INSERT INTO ORDERS VALUES (10651, 'WANDK', 8, CONVERT(date, '01/09/97', 3), CONVERT(date, '11/09/97', 3), 1.03);
INSERT INTO ORDERS VALUES (10683, 'DUMON', 2, CONVERT(date, '26/09/97', 3), CONVERT(date, '01/10/97', 3), .22);
INSERT INTO ORDERS VALUES (10690, 'HANAR', 1, CONVERT(date, '02/10/97', 3), CONVERT(date, '03/10/97', 3), .79);
INSERT INTO ORDERS VALUES (10709, 'GOURL', 1, CONVERT(date, '17/10/97', 3), CONVERT(date, '20/11/97', 3), 10.54);
INSERT INTO ORDERS VALUES (10715, 'BONAP', 3, CONVERT(date, '23/10/97', 3), CONVERT(date, '29/10/97', 3), 3.16);
INSERT INTO ORDERS VALUES (10774, 'FOLKO', 4, CONVERT(date, '11/12/97', 3), CONVERT(date, '12/12/97', 3), 2.41);
INSERT INTO ORDERS VALUES (10789, 'FOLIG', 1, CONVERT(date, '22/12/97', 3), CONVERT(date, '31/12/97', 3), 5.03);
INSERT INTO ORDERS VALUES (10822, 'TRAIH', 6, CONVERT(date, '08/01/98', 3), CONVERT(date, '16/01/98', 3), .35);
INSERT INTO ORDERS VALUES (10919, 'LINOD', 2, CONVERT(date, '02/03/98', 3), CONVERT(date, '04/03/98', 3), .99);
INSERT INTO ORDERS VALUES (10931, 'RICSU', 4, CONVERT(date, '06/03/98', 3), CONVERT(date, '19/03/98', 3), .68);
INSERT INTO ORDERS VALUES (10946, 'VAFFE', 1, CONVERT(date, '12/03/98', 3), CONVERT(date, '19/03/98', 3), 1.36);
INSERT INTO ORDERS VALUES (10968, 'ERNSH', 1, CONVERT(date, '23/03/98', 3), CONVERT(date, '01/04/98', 3), 3.73);
INSERT INTO ORDERS VALUES (10995, 'PERIC', 1, CONVERT(date, '02/04/98', 3), CONVERT(date, '06/04/98', 3), 2.30);
INSERT INTO ORDERS VALUES (11014, 'LINOD', 2, CONVERT(date, '10/04/98', 3), CONVERT(date, '15/04/98', 3), 1.18);
INSERT INTO ORDERS VALUES (11016, 'AROUT', 9, CONVERT(date, '10/04/98', 3), CONVERT(date, '13/04/98', 3), 1.69);
INSERT INTO ORDERS VALUES (11037, 'GODOS', 7, CONVERT(date, '21/04/98', 3), CONVERT(date, '27/04/98', 3), .16);
INSERT INTO ORDERS VALUES (11039, 'LINOD', 1, CONVERT(date, '21/04/98', 3), NULL, 3.25);
INSERT INTO ORDERS VALUES (11043, 'SPECD', 5, CONVERT(date, '22/04/98', 3), CONVERT(date, '29/04/98', 3), .44);
INSERT INTO ORDERS VALUES (11059, 'RICAR', 2, CONVERT(date, '29/04/98', 3), NULL, 4.29);
INSERT INTO ORDERS VALUES (11070, 'LEHMS', 2, CONVERT(date, '05/05/98', 3), NULL, 6.80);
INSERT INTO ORDERS VALUES (10248, 'VINET', 5, CONVERT(date, '04/07/96', 3), CONVERT(date, '16/07/96', 3), 161.90);
INSERT INTO ORDERS VALUES (10249, 'TOMSP', 6, CONVERT(date, '05/07/96', 3), CONVERT(date, '10/07/96', 3), 58.05);
INSERT INTO ORDERS VALUES (10291, 'QUEDE', 6, CONVERT(date, '27/08/96', 3), CONVERT(date, '04/09/96', 3), .32);
INSERT INTO ORDERS VALUES (10322, 'PERIC', 7, CONVERT(date, '04/10/96', 3), CONVERT(date, '23/10/96', 3), .02);
INSERT INTO ORDERS VALUES (10250, 'HANAR', 4, CONVERT(date, '08/07/96', 3), CONVERT(date, '12/07/96', 3), 329.15);
INSERT INTO ORDERS VALUES (10251, 'VICTE', 3, CONVERT(date, '08/07/96', 3), CONVERT(date, '15/07/96', 3), 206.70);
INSERT INTO ORDERS VALUES (10252, 'SUPRD', 4, CONVERT(date, '09/07/96', 3), CONVERT(date, '11/07/96', 3), 256.50);
INSERT INTO ORDERS VALUES (10253, 'HANAR', 3, CONVERT(date, '10/07/96', 3), CONVERT(date, '16/07/96', 3), 290.85);
INSERT INTO ORDERS VALUES (10254, 'CHOPS', 5, CONVERT(date, '11/07/96', 3), CONVERT(date, '23/07/96', 3), 114.90);
INSERT INTO ORDERS VALUES (10255, 'RICSU', 9, CONVERT(date, '12/07/96', 3), CONVERT(date, '15/07/96', 3), 741.65);
INSERT INTO ORDERS VALUES (10256, 'WELLI', 3, CONVERT(date, '15/07/96', 3), CONVERT(date, '17/07/96', 3), 69.85);
INSERT INTO ORDERS VALUES (10257, 'HILAA', 4, CONVERT(date, '16/07/96', 3), CONVERT(date, '22/07/96', 3), 409.55);
INSERT INTO ORDERS VALUES (10258, 'ERNSH', 1, CONVERT(date, '17/07/96', 3), CONVERT(date, '23/07/96', 3), 702.55);
INSERT INTO ORDERS VALUES (10259, 'CENTC', 4, CONVERT(date, '18/07/96', 3), CONVERT(date, '25/07/96', 3), 16.25);
INSERT INTO ORDERS VALUES (10260, 'OTTIK', 4, CONVERT(date, '19/07/96', 3), CONVERT(date, '29/07/96', 3), 275.45);
INSERT INTO ORDERS VALUES (10261, 'QUEDE', 4, CONVERT(date, '19/07/96', 3), CONVERT(date, '30/07/96', 3), 15.25);
INSERT INTO ORDERS VALUES (10262, 'RATTC', 8, CONVERT(date, '22/07/96', 3), CONVERT(date, '25/07/96', 3), 241.45);
INSERT INTO ORDERS VALUES (10263, 'ERNSH', 9, CONVERT(date, '23/07/96', 3), CONVERT(date, '31/07/96', 3), 730.30);
INSERT INTO ORDERS VALUES (10264, 'FOLKO', 6, CONVERT(date, '24/07/96', 3), CONVERT(date, '23/08/96', 3), 18.35);
INSERT INTO ORDERS VALUES (10265, 'BLONP', 2, CONVERT(date, '25/07/96', 3), CONVERT(date, '12/08/96', 3), 276.40);
INSERT INTO ORDERS VALUES (10266, 'WARTH', 3, CONVERT(date, '26/07/96', 3), CONVERT(date, '31/07/96', 3), 128.65);
INSERT INTO ORDERS VALUES (10267, 'FRANK', 4, CONVERT(date, '29/07/96', 3), CONVERT(date, '06/08/96', 3), 1042.90);
INSERT INTO ORDERS VALUES (10268, 'GROSR', 8, CONVERT(date, '30/07/96', 3), CONVERT(date, '02/08/96', 3), 331.45);
INSERT INTO ORDERS VALUES (10269, 'WHITC', 5, CONVERT(date, '31/07/96', 3), CONVERT(date, '09/08/96', 3), 22.80);
INSERT INTO ORDERS VALUES (10270, 'WARTH', 1, CONVERT(date, '01/08/96', 3), CONVERT(date, '02/08/96', 3), 682.70);
INSERT INTO ORDERS VALUES (10271, 'SPLIR', 6, CONVERT(date, '01/08/96', 3), CONVERT(date, '30/08/96', 3), 22.70);
INSERT INTO ORDERS VALUES (10272, 'RATTC', 6, CONVERT(date, '02/08/96', 3), CONVERT(date, '06/08/96', 3), 490.15);
INSERT INTO ORDERS VALUES (10273, 'QUICK', 3, CONVERT(date, '05/08/96', 3), CONVERT(date, '12/08/96', 3), 380.35);
INSERT INTO ORDERS VALUES (10274, 'VINET', 6, CONVERT(date, '06/08/96', 3), CONVERT(date, '16/08/96', 3), 30.05);
INSERT INTO ORDERS VALUES (10275, 'MAGAA', 1, CONVERT(date, '07/08/96', 3), CONVERT(date, '09/08/96', 3), 134.65);
INSERT INTO ORDERS VALUES (10276, 'TORTU', 8, CONVERT(date, '08/08/96', 3), CONVERT(date, '14/08/96', 3), 69.20);
INSERT INTO ORDERS VALUES (10277, 'MORGK', 2, CONVERT(date, '09/08/96', 3), CONVERT(date, '13/08/96', 3), 628.85);
INSERT INTO ORDERS VALUES (10278, 'BERGS', 8, CONVERT(date, '12/08/96', 3), CONVERT(date, '16/08/96', 3), 463.45);
INSERT INTO ORDERS VALUES (10279, 'LEHMS', 8, CONVERT(date, '13/08/96', 3), CONVERT(date, '16/08/96', 3), 129.15);
INSERT INTO ORDERS VALUES (10280, 'BERGS', 2, CONVERT(date, '14/08/96', 3), CONVERT(date, '12/09/96', 3), 44.90);
INSERT INTO ORDERS VALUES (10281, 'ROMEY', 4, CONVERT(date, '14/08/96', 3), CONVERT(date, '21/08/96', 3), 14.70);
INSERT INTO ORDERS VALUES (10282, 'ROMEY', 4, CONVERT(date, '15/08/96', 3), CONVERT(date, '21/08/96', 3), 63.45);
INSERT INTO ORDERS VALUES (10283, 'LILAS', 3, CONVERT(date, '16/08/96', 3), CONVERT(date, '23/08/96', 3), 424.05);
INSERT INTO ORDERS VALUES (10284, 'LEHMS', 4, CONVERT(date, '19/08/96', 3), CONVERT(date, '27/08/96', 3), 382.80);
INSERT INTO ORDERS VALUES (10285, 'QUICK', 1, CONVERT(date, '20/08/96', 3), CONVERT(date, '26/08/96', 3), 384.15);
INSERT INTO ORDERS VALUES (10286, 'QUICK', 8, CONVERT(date, '21/08/96', 3), CONVERT(date, '30/08/96', 3), 1146.20);
INSERT INTO ORDERS VALUES (10287, 'RICAR', 8, CONVERT(date, '22/08/96', 3), CONVERT(date, '28/08/96', 3), 63.80);
INSERT INTO ORDERS VALUES (10288, 'REGGC', 4, CONVERT(date, '23/08/96', 3), CONVERT(date, '03/09/96', 3), 37.25);
INSERT INTO ORDERS VALUES (10289, 'BSBEV', 7, CONVERT(date, '26/08/96', 3), CONVERT(date, '28/08/96', 3), 113.85);
INSERT INTO ORDERS VALUES (10290, 'COMMI', 8, CONVERT(date, '27/08/96', 3), CONVERT(date, '03/09/96', 3), 398.50);
INSERT INTO ORDERS VALUES (10292, 'TRADH', 1, CONVERT(date, '28/08/96', 3), CONVERT(date, '02/09/96', 3), 6.75);
INSERT INTO ORDERS VALUES (10293, 'TORTU', 1, CONVERT(date, '29/08/96', 3), CONVERT(date, '11/09/96', 3), 105.90);
INSERT INTO ORDERS VALUES (10294, 'RATTC', 4, CONVERT(date, '30/08/96', 3), CONVERT(date, '05/09/96', 3), 736.30);
INSERT INTO ORDERS VALUES (10295, 'VINET', 2, CONVERT(date, '02/09/96', 3), CONVERT(date, '10/09/96', 3), 5.75);
INSERT INTO ORDERS VALUES (10296, 'LILAS', 6, CONVERT(date, '03/09/96', 3), CONVERT(date, '11/09/96', 3), .60);
INSERT INTO ORDERS VALUES (10297, 'BLONP', 5, CONVERT(date, '04/09/96', 3), CONVERT(date, '10/09/96', 3), 28.70);
INSERT INTO ORDERS VALUES (10298, 'HUNGO', 6, CONVERT(date, '05/09/96', 3), CONVERT(date, '11/09/96', 3), 841.10);
INSERT INTO ORDERS VALUES (10299, 'RICAR', 4, CONVERT(date, '06/09/96', 3), CONVERT(date, '13/09/96', 3), 148.80);
INSERT INTO ORDERS VALUES (10300, 'MAGAA', 2, CONVERT(date, '09/09/96', 3), CONVERT(date, '18/09/96', 3), 88.40);
INSERT INTO ORDERS VALUES (10301, 'WANDK', 8, CONVERT(date, '09/09/96', 3), CONVERT(date, '17/09/96', 3), 225.40);
INSERT INTO ORDERS VALUES (10302, 'SUPRD', 4, CONVERT(date, '10/09/96', 3), CONVERT(date, '09/10/96', 3), 31.35);
INSERT INTO ORDERS VALUES (10303, 'GODOS', 7, CONVERT(date, '11/09/96', 3), CONVERT(date, '18/09/96', 3), 539.15);
INSERT INTO ORDERS VALUES (10304, 'TORTU', 1, CONVERT(date, '12/09/96', 3), CONVERT(date, '17/09/96', 3), 318.95);
INSERT INTO ORDERS VALUES (10305, 'OLDWO', 8, CONVERT(date, '13/09/96', 3), CONVERT(date, '09/10/96', 3), 1288.10);
INSERT INTO ORDERS VALUES (10306, 'ROMEY', 1, CONVERT(date, '16/09/96', 3), CONVERT(date, '23/09/96', 3), 37.80);
INSERT INTO ORDERS VALUES (10307, 'LONEP', 2, CONVERT(date, '17/09/96', 3), CONVERT(date, '25/09/96', 3), 2.80);
INSERT INTO ORDERS VALUES (10308, 'ANATR', 7, CONVERT(date, '18/09/96', 3), CONVERT(date, '24/09/96', 3), 8.05);
INSERT INTO ORDERS VALUES (10309, 'HUNGO', 3, CONVERT(date, '19/09/96', 3), CONVERT(date, '23/10/96', 3), 236.50);
INSERT INTO ORDERS VALUES (10310, 'THEBI', 8, CONVERT(date, '20/09/96', 3), CONVERT(date, '27/09/96', 3), 87.60);
INSERT INTO ORDERS VALUES (10311, 'DUMON', 1, CONVERT(date, '20/09/96', 3), CONVERT(date, '26/09/96', 3), 123.45);
INSERT INTO ORDERS VALUES (10312, 'WANDK', 2, CONVERT(date, '23/09/96', 3), CONVERT(date, '03/10/96', 3), 201.30);
INSERT INTO ORDERS VALUES (10313, 'QUICK', 2, CONVERT(date, '24/09/96', 3), CONVERT(date, '04/10/96', 3), 9.80);
INSERT INTO ORDERS VALUES (10314, 'RATTC', 1, CONVERT(date, '25/09/96', 3), CONVERT(date, '04/10/96', 3), 370.80);
INSERT INTO ORDERS VALUES (10315, 'ISLAT', 4, CONVERT(date, '26/09/96', 3), CONVERT(date, '03/10/96', 3), 208.80);
INSERT INTO ORDERS VALUES (10316, 'RATTC', 1, CONVERT(date, '27/09/96', 3), CONVERT(date, '08/10/96', 3), 750.75);
INSERT INTO ORDERS VALUES (10317, 'LONEP', 6, CONVERT(date, '30/09/96', 3), CONVERT(date, '10/10/96', 3), 63.45);
INSERT INTO ORDERS VALUES (10318, 'ISLAT', 8, CONVERT(date, '01/10/96', 3), CONVERT(date, '04/10/96', 3), 23.65);
INSERT INTO ORDERS VALUES (10319, 'TORTU', 7, CONVERT(date, '02/10/96', 3), CONVERT(date, '11/10/96', 3), 322.50);
INSERT INTO ORDERS VALUES (10320, 'WARTH', 5, CONVERT(date, '03/10/96', 3), CONVERT(date, '18/10/96', 3), 172.85);
INSERT INTO ORDERS VALUES (10321, 'ISLAT', 3, CONVERT(date, '03/10/96', 3), CONVERT(date, '11/10/96', 3), 17.15);
INSERT INTO ORDERS VALUES (10323, 'KOENE', 4, CONVERT(date, '07/10/96', 3), CONVERT(date, '14/10/96', 3), 24.40);
INSERT INTO ORDERS VALUES (10324, 'SAVEA', 9, CONVERT(date, '08/10/96', 3), CONVERT(date, '10/10/96', 3), 1071.35);
INSERT INTO ORDERS VALUES (10325, 'KOENE', 1, CONVERT(date, '09/10/96', 3), CONVERT(date, '14/10/96', 3), 324.30);
INSERT INTO ORDERS VALUES (10326, 'BOLID', 4, CONVERT(date, '10/10/96', 3), CONVERT(date, '14/10/96', 3), 389.60);
INSERT INTO ORDERS VALUES (10327, 'FOLKO', 2, CONVERT(date, '11/10/96', 3), CONVERT(date, '14/10/96', 3), 316.80);
INSERT INTO ORDERS VALUES (10328, 'FURIB', 4, CONVERT(date, '14/10/96', 3), CONVERT(date, '17/10/96', 3), 435.15);--stop here
INSERT INTO ORDERS VALUES (10329, 'SPLIR', 4, CONVERT(date, '15/10/96', 3), CONVERT(date, '23/10/96', 3), 958.35);
INSERT INTO ORDERS VALUES (10330, 'LILAS', 3, CONVERT(date, '16/10/96', 3), CONVERT(date, '28/10/96', 3), 63.75);
INSERT INTO ORDERS VALUES (10331, 'BONAP', 9, CONVERT(date, '16/10/96', 3), CONVERT(date, '21/10/96', 3), 50.95);
INSERT INTO ORDERS VALUES (10332, 'MEREP', 3, CONVERT(date, '17/10/96', 3), CONVERT(date, '21/10/96', 3), 264.20);
INSERT INTO ORDERS VALUES (10333, 'WARTH', 5, CONVERT(date, '18/10/96', 3), CONVERT(date, '25/10/96', 3), 2.95);
INSERT INTO ORDERS VALUES (10334, 'VICTE', 8, CONVERT(date, '21/10/96', 3), CONVERT(date, '28/10/96', 3), 42.80);
INSERT INTO ORDERS VALUES (10335, 'HUNGO', 7, CONVERT(date, '22/10/96', 3), CONVERT(date, '24/10/96', 3), 210.55);
INSERT INTO ORDERS VALUES (10336, 'PRINI', 7, CONVERT(date, '23/10/96', 3), CONVERT(date, '25/10/96', 3), 77.55);
INSERT INTO ORDERS VALUES (10337, 'FRANK', 4, CONVERT(date, '24/10/96', 3), CONVERT(date, '29/10/96', 3), 541.30);
INSERT INTO ORDERS VALUES (10338, 'OLDWO', 4, CONVERT(date, '25/10/96', 3), CONVERT(date, '29/10/96', 3), 421.05);
INSERT INTO ORDERS VALUES (10339, 'MEREP', 2, CONVERT(date, '28/10/96', 3), CONVERT(date, '04/11/96', 3), 78.30);
INSERT INTO ORDERS VALUES (10340, 'BONAP', 1, CONVERT(date, '29/10/96', 3), CONVERT(date, '08/11/96', 3), 831.55);
INSERT INTO ORDERS VALUES (10341, 'SIMOB', 7, CONVERT(date, '29/10/96', 3), CONVERT(date, '05/11/96', 3), 133.90);
INSERT INTO ORDERS VALUES (10342, 'FRANK', 4, CONVERT(date, '30/10/96', 3), CONVERT(date, '04/11/96', 3), 274.15);
INSERT INTO ORDERS VALUES (10343, 'LEHMS', 4, CONVERT(date, '31/10/96', 3), CONVERT(date, '06/11/96', 3), 551.85);
INSERT INTO ORDERS VALUES (10344, 'WHITC', 4, CONVERT(date, '01/11/96', 3), CONVERT(date, '05/11/96', 3), 116.45);
INSERT INTO ORDERS VALUES (10345, 'QUICK', 2, CONVERT(date, '04/11/96', 3), CONVERT(date, '11/11/96', 3), 1245.30);
INSERT INTO ORDERS VALUES (10346, 'RATTC', 3, CONVERT(date, '05/11/96', 3), CONVERT(date, '08/11/96', 3), 710.40);
INSERT INTO ORDERS VALUES (10347, 'FAMIA', 4, CONVERT(date, '06/11/96', 3), CONVERT(date, '08/11/96', 3), 15.50);
INSERT INTO ORDERS VALUES (10348, 'WANDK', 4, CONVERT(date, '07/11/96', 3), CONVERT(date, '15/11/96', 3), 3.90);
INSERT INTO ORDERS VALUES (10349, 'SPLIR', 7, CONVERT(date, '08/11/96', 3), CONVERT(date, '15/11/96', 3), 43.15);
INSERT INTO ORDERS VALUES (10350, 'LAMAI', 6, CONVERT(date, '11/11/96', 3), CONVERT(date, '03/12/96', 3), 320.95);
INSERT INTO ORDERS VALUES (10351, 'ERNSH', 1, CONVERT(date, '11/11/96', 3), CONVERT(date, '20/11/96', 3), 811.65);
INSERT INTO ORDERS VALUES (10352, 'FURIB', 3, CONVERT(date, '12/11/96', 3), CONVERT(date, '18/11/96', 3), 6.50);
INSERT INTO ORDERS VALUES (10353, 'PICCO', 7, CONVERT(date, '13/11/96', 3), CONVERT(date, '25/11/96', 3), 1803.15);
INSERT INTO ORDERS VALUES (10355, 'AROUT', 6, CONVERT(date, '15/11/96', 3), CONVERT(date, '20/11/96', 3), 209.75);
INSERT INTO ORDERS VALUES (10356, 'WANDK', 6, CONVERT(date, '18/11/96', 3), CONVERT(date, '27/11/96', 3), 183.55);
INSERT INTO ORDERS VALUES (10357, 'LILAS', 1, CONVERT(date, '19/11/96', 3), CONVERT(date, '02/12/96', 3), 174.40);
INSERT INTO ORDERS VALUES (10358, 'LAMAI', 5, CONVERT(date, '20/11/96', 3), CONVERT(date, '27/11/96', 3), 98.20);
INSERT INTO ORDERS VALUES (10359, 'SEVES', 5, CONVERT(date, '21/11/96', 3), CONVERT(date, '26/11/96', 3), 1442.15);
INSERT INTO ORDERS VALUES (10360, 'BLONP', 4, CONVERT(date, '22/11/96', 3), CONVERT(date, '02/12/96', 3), 658.50);
INSERT INTO ORDERS VALUES (10361, 'QUICK', 1, CONVERT(date, '22/11/96', 3), CONVERT(date, '03/12/96', 3), 915.85);
INSERT INTO ORDERS VALUES (10362, 'BONAP', 3, CONVERT(date, '25/11/96', 3), CONVERT(date, '28/11/96', 3), 480.20);
INSERT INTO ORDERS VALUES (10363, 'DRACD', 4, CONVERT(date, '26/11/96', 3), CONVERT(date, '04/12/96', 3), 152.70);
INSERT INTO ORDERS VALUES (10364, 'EASTC', 1, CONVERT(date, '26/11/96', 3), CONVERT(date, '04/12/96', 3), 359.85);
INSERT INTO ORDERS VALUES (10366, 'GALED', 8, CONVERT(date, '28/11/96', 3), CONVERT(date, '30/12/96', 3), 50.70);
INSERT INTO ORDERS VALUES (10367, 'VAFFE', 7, CONVERT(date, '28/11/96', 3), CONVERT(date, '02/12/96', 3), 67.75);
INSERT INTO ORDERS VALUES (10368, 'ERNSH', 2, CONVERT(date, '29/11/96', 3), CONVERT(date, '02/12/96', 3), 509.75);
INSERT INTO ORDERS VALUES (10369, 'SPLIR', 8, CONVERT(date, '02/12/96', 3), CONVERT(date, '09/12/96', 3), 978.40);
INSERT INTO ORDERS VALUES (10370, 'CHOPS', 6, CONVERT(date, '03/12/96', 3), CONVERT(date, '27/12/96', 3), 5.85);
INSERT INTO ORDERS VALUES (10371, 'LAMAI', 1, CONVERT(date, '03/12/96', 3), CONVERT(date, '24/12/96', 3), 2.25);
INSERT INTO ORDERS VALUES (10372, 'QUEEN', 5, CONVERT(date, '04/12/96', 3), CONVERT(date, '09/12/96', 3), 4453.90);
INSERT INTO ORDERS VALUES (10373, 'HUNGO', 4, CONVERT(date, '05/12/96', 3), CONVERT(date, '11/12/96', 3), 620.60);
INSERT INTO ORDERS VALUES (10374, 'WOLZA', 1, CONVERT(date, '05/12/96', 3), CONVERT(date, '09/12/96', 3), 19.70);
INSERT INTO ORDERS VALUES (10375, 'HUNGC', 3, CONVERT(date, '06/12/96', 3), CONVERT(date, '09/12/96', 3), 100.60);
INSERT INTO ORDERS VALUES (10376, 'MEREP', 1, CONVERT(date, '09/12/96', 3), CONVERT(date, '13/12/96', 3), 101.95);
INSERT INTO ORDERS VALUES (10377, 'SEVES', 1, CONVERT(date, '09/12/96', 3), CONVERT(date, '13/12/96', 3), 111.05);
INSERT INTO ORDERS VALUES (10378, 'FOLKO', 5, CONVERT(date, '10/12/96', 3), CONVERT(date, '19/12/96', 3), 27.20);
INSERT INTO ORDERS VALUES (10379, 'QUEDE', 2, CONVERT(date, '11/12/96', 3), CONVERT(date, '13/12/96', 3), 225.15);
INSERT INTO ORDERS VALUES (10380, 'HUNGO', 8, CONVERT(date, '12/12/96', 3), CONVERT(date, '16/01/97', 3), 175.15);
INSERT INTO ORDERS VALUES (10381, 'LILAS', 3, CONVERT(date, '12/12/96', 3), CONVERT(date, '13/12/96', 3), 39.95);
INSERT INTO ORDERS VALUES (10382, 'ERNSH', 4, CONVERT(date, '13/12/96', 3), CONVERT(date, '16/12/96', 3), 473.85);
INSERT INTO ORDERS VALUES (10383, 'AROUT', 8, CONVERT(date, '16/12/96', 3), CONVERT(date, '18/12/96', 3), 171.20);
INSERT INTO ORDERS VALUES (10384, 'BERGS', 3, CONVERT(date, '16/12/96', 3), CONVERT(date, '20/12/96', 3), 843.20);
INSERT INTO ORDERS VALUES (10385, 'SPLIR', 1, CONVERT(date, '17/12/96', 3), CONVERT(date, '23/12/96', 3), 154.80);
INSERT INTO ORDERS VALUES (10386, 'FAMIA', 9, CONVERT(date, '18/12/96', 3), CONVERT(date, '25/12/96', 3), 69.95);
INSERT INTO ORDERS VALUES (10387, 'SANTG', 1, CONVERT(date, '18/12/96', 3), CONVERT(date, '20/12/96', 3), 468.15);
INSERT INTO ORDERS VALUES (10388, 'SEVES', 2, CONVERT(date, '19/12/96', 3), CONVERT(date, '20/12/96', 3), 174.30);
INSERT INTO ORDERS VALUES (10389, 'BOTTM', 4, CONVERT(date, '20/12/96', 3), CONVERT(date, '24/12/96', 3), 237.10);
INSERT INTO ORDERS VALUES (10390, 'ERNSH', 6, CONVERT(date, '23/12/96', 3), CONVERT(date, '26/12/96', 3), 631.90);
INSERT INTO ORDERS VALUES (10391, 'DRACD', 3, CONVERT(date, '23/12/96', 3), CONVERT(date, '31/12/96', 3), 27.25);
INSERT INTO ORDERS VALUES (10392, 'PICCO', 2, CONVERT(date, '24/12/96', 3), CONVERT(date, '01/01/97', 3), 612.30);
INSERT INTO ORDERS VALUES (10393, 'SAVEA', 1, CONVERT(date, '25/12/96', 3), CONVERT(date, '03/01/97', 3), 632.80);
INSERT INTO ORDERS VALUES (10394, 'HUNGC', 1, CONVERT(date, '25/12/96', 3), CONVERT(date, '03/01/97', 3), 151.70);
INSERT INTO ORDERS VALUES (10395, 'HILAA', 6, CONVERT(date, '26/12/96', 3), CONVERT(date, '03/01/97', 3), 922.05);
INSERT INTO ORDERS VALUES (10396, 'FRANK', 1, CONVERT(date, '27/12/96', 3), CONVERT(date, '06/01/97', 3), 676.75);
INSERT INTO ORDERS VALUES (10397, 'PRINI', 5, CONVERT(date, '27/12/96', 3), CONVERT(date, '02/01/97', 3), 301.30);
INSERT INTO ORDERS VALUES (10398, 'SAVEA', 2, CONVERT(date, '30/12/96', 3), CONVERT(date, '09/01/97', 3), 445.80);
INSERT INTO ORDERS VALUES (10399, 'VAFFE', 8, CONVERT(date, '31/12/96', 3), CONVERT(date, '08/01/97', 3), 136.80);
INSERT INTO ORDERS VALUES (10400, 'EASTC', 1, CONVERT(date, '01/01/97', 3), CONVERT(date, '16/01/97', 3), 419.65);
INSERT INTO ORDERS VALUES (10401, 'RATTC', 1, CONVERT(date, '01/01/97', 3), CONVERT(date, '10/01/97', 3), 62.55);
INSERT INTO ORDERS VALUES (10402, 'ERNSH', 8, CONVERT(date, '02/01/97', 3), CONVERT(date, '10/01/97', 3), 339.40);
INSERT INTO ORDERS VALUES (10403, 'ERNSH', 4, CONVERT(date, '03/01/97', 3), CONVERT(date, '09/01/97', 3), 368.95);
INSERT INTO ORDERS VALUES (10404, 'MAGAA', 2, CONVERT(date, '03/01/97', 3), CONVERT(date, '08/01/97', 3), 779.85);
INSERT INTO ORDERS VALUES (10405, 'LINOD', 1, CONVERT(date, '06/01/97', 3), CONVERT(date, '22/01/97', 3), 174.10);
INSERT INTO ORDERS VALUES (10406, 'QUEEN', 7, CONVERT(date, '07/01/97', 3), CONVERT(date, '13/01/97', 3), 540.20);
INSERT INTO ORDERS VALUES (10407, 'OTTIK', 2, CONVERT(date, '07/01/97', 3), CONVERT(date, '30/01/97', 3), 457.40);
INSERT INTO ORDERS VALUES (10408, 'FOLIG', 8, CONVERT(date, '08/01/97', 3), CONVERT(date, '14/01/97', 3), 56.30);
INSERT INTO ORDERS VALUES (10409, 'OCEAN', 3, CONVERT(date, '09/01/97', 3), CONVERT(date, '14/01/97', 3), 149.15);
INSERT INTO ORDERS VALUES (10411, 'BOTTM', 9, CONVERT(date, '10/01/97', 3), CONVERT(date, '21/01/97', 3), 118.25);
INSERT INTO ORDERS VALUES (10412, 'WARTH', 8, CONVERT(date, '13/01/97', 3), CONVERT(date, '15/01/97', 3), 18.85);
INSERT INTO ORDERS VALUES (10413, 'LAMAI', 3, CONVERT(date, '14/01/97', 3), CONVERT(date, '16/01/97', 3), 478.30);
INSERT INTO ORDERS VALUES (10414, 'FAMIA', 2, CONVERT(date, '14/01/97', 3), CONVERT(date, '17/01/97', 3), 107.40);
INSERT INTO ORDERS VALUES (10416, 'WARTH', 8, CONVERT(date, '16/01/97', 3), CONVERT(date, '27/01/97', 3), 113.60);
INSERT INTO ORDERS VALUES (10417, 'SIMOB', 4, CONVERT(date, '16/01/97', 3), CONVERT(date, '28/01/97', 3), 351.45);
INSERT INTO ORDERS VALUES (10418, 'QUICK', 4, CONVERT(date, '17/01/97', 3), CONVERT(date, '24/01/97', 3), 87.75);
INSERT INTO ORDERS VALUES (10419, 'RICSU', 4, CONVERT(date, '20/01/97', 3), CONVERT(date, '30/01/97', 3), 686.75);
INSERT INTO ORDERS VALUES (10420, 'WELLI', 3, CONVERT(date, '21/01/97', 3), CONVERT(date, '27/01/97', 3), 220.60);
INSERT INTO ORDERS VALUES (10421, 'QUEDE', 8, CONVERT(date, '21/01/97', 3), CONVERT(date, '27/01/97', 3), 496.15);
INSERT INTO ORDERS VALUES (10422, 'FRANS', 2, CONVERT(date, '22/01/97', 3), CONVERT(date, '31/01/97', 3), 15.10);
INSERT INTO ORDERS VALUES (10423, 'GOURL', 6, CONVERT(date, '23/01/97', 3), CONVERT(date, '24/02/97', 3), 122.50);
INSERT INTO ORDERS VALUES (10424, 'MEREP', 7, CONVERT(date, '23/01/97', 3), CONVERT(date, '27/01/97', 3), 1853.05);
INSERT INTO ORDERS VALUES (10425, 'LAMAI', 6, CONVERT(date, '24/01/97', 3), CONVERT(date, '14/02/97', 3), 39.65);
INSERT INTO ORDERS VALUES (10426, 'GALED', 4, CONVERT(date, '27/01/97', 3), CONVERT(date, '06/02/97', 3), 93.45);
INSERT INTO ORDERS VALUES (10427, 'PICCO', 4, CONVERT(date, '27/01/97', 3), CONVERT(date, '03/03/97', 3), 156.45);
INSERT INTO ORDERS VALUES (10428, 'REGGC', 7, CONVERT(date, '28/01/97', 3), CONVERT(date, '04/02/97', 3), 55.45);
INSERT INTO ORDERS VALUES (10429, 'HUNGO', 3, CONVERT(date, '29/01/97', 3), CONVERT(date, '07/02/97', 3), 283.15);
INSERT INTO ORDERS VALUES (10430, 'ERNSH', 4, CONVERT(date, '30/01/97', 3), CONVERT(date, '03/02/97', 3), 2293.90);
INSERT INTO ORDERS VALUES (10431, 'BOTTM', 4, CONVERT(date, '30/01/97', 3), CONVERT(date, '07/02/97', 3), 220.85);
INSERT INTO ORDERS VALUES (10432, 'SPLIR', 3, CONVERT(date, '31/01/97', 3), CONVERT(date, '07/02/97', 3), 21.70);
INSERT INTO ORDERS VALUES (10433, 'PRINI', 3, CONVERT(date, '03/02/97', 3), CONVERT(date, '04/03/97', 3), 369.15);
INSERT INTO ORDERS VALUES (10434, 'FOLKO', 3, CONVERT(date, '03/02/97', 3), CONVERT(date, '13/02/97', 3), 89.60);
INSERT INTO ORDERS VALUES (10435, 'CONSH', 8, CONVERT(date, '04/02/97', 3), CONVERT(date, '07/02/97', 3), 180.35);
INSERT INTO ORDERS VALUES (10506, 'KOENE', 9, CONVERT(date, '15/04/97', 3), CONVERT(date, '02/05/97', 3), 105.95);
INSERT INTO ORDERS VALUES (10507, 'ANTON', 7, CONVERT(date, '15/04/97', 3), CONVERT(date, '22/04/97', 3), 237.25);
INSERT INTO ORDERS VALUES (10508, 'OTTIK', 1, CONVERT(date, '16/04/97', 3), CONVERT(date, '13/05/97', 3), 24.95);
INSERT INTO ORDERS VALUES (10509, 'BLAUS', 4, CONVERT(date, '17/04/97', 3), CONVERT(date, '29/04/97', 3), 0.75);
INSERT INTO ORDERS VALUES (10510, 'SAVEA', 6, CONVERT(date, '18/04/97', 3), CONVERT(date, '28/04/97', 3), 1838.15);
INSERT INTO ORDERS VALUES (10511, 'BONAP', 4, CONVERT(date, '18/04/97', 3), CONVERT(date, '21/04/97', 3), 1753.20);
INSERT INTO ORDERS VALUES (10512, 'FAMIA', 7, CONVERT(date, '21/04/97', 3), CONVERT(date, '24/04/97', 3), 17.65);
INSERT INTO ORDERS VALUES (10513, 'WANDK', 7, CONVERT(date, '22/04/97', 3), CONVERT(date, '28/04/97', 3), 528.25);
INSERT INTO ORDERS VALUES (10514, 'ERNSH', 3, CONVERT(date, '22/04/97', 3), CONVERT(date, '16/05/97', 3), 3949.75);
INSERT INTO ORDERS VALUES (10515, 'QUICK', 2, CONVERT(date, '23/04/97', 3), CONVERT(date, '23/05/97', 3), 1022.35);
INSERT INTO ORDERS VALUES (10516, 'HUNGO', 2, CONVERT(date, '24/04/97', 3), CONVERT(date, '01/05/97', 3), 313.90);
INSERT INTO ORDERS VALUES (10517, 'NORTS', 3, CONVERT(date, '24/04/97', 3), CONVERT(date, '29/04/97', 3), 160.35);
INSERT INTO ORDERS VALUES (10518, 'TORTU', 4, CONVERT(date, '25/04/97', 3), CONVERT(date, '05/05/97', 3), 1090.75);
INSERT INTO ORDERS VALUES (10519, 'CHOPS', 6, CONVERT(date, '28/04/97', 3), CONVERT(date, '01/05/97', 3), 458.80);
INSERT INTO ORDERS VALUES (10520, 'SANTG', 7, CONVERT(date, '29/04/97', 3), CONVERT(date, '01/05/97', 3), 66.85);
INSERT INTO ORDERS VALUES (10521, 'CACTU', 8, CONVERT(date, '29/04/97', 3), CONVERT(date, '02/05/97', 3), 86.10);
INSERT INTO ORDERS VALUES (10522, 'LEHMS', 4, CONVERT(date, '30/04/97', 3), CONVERT(date, '06/05/97', 3), 226.65);
INSERT INTO ORDERS VALUES (10523, 'SEVES', 7, CONVERT(date, '01/05/97', 3), CONVERT(date, '30/05/97', 3), 388.15);
INSERT INTO ORDERS VALUES (10524, 'BERGS', 1, CONVERT(date, '01/05/97', 3), CONVERT(date, '07/05/97', 3), 1223.95);
INSERT INTO ORDERS VALUES (10525, 'BONAP', 1, CONVERT(date, '02/05/97', 3), CONVERT(date, '23/05/97', 3), 55.30);
INSERT INTO ORDERS VALUES (10526, 'WARTH', 4, CONVERT(date, '05/05/97', 3), CONVERT(date, '15/05/97', 3), 292.95);
INSERT INTO ORDERS VALUES (10527, 'QUICK', 7, CONVERT(date, '05/05/97', 3), CONVERT(date, '07/05/97', 3), 209.50);
INSERT INTO ORDERS VALUES (10528, 'GREAL', 6, CONVERT(date, '06/05/97', 3), CONVERT(date, '09/05/97', 3), 16.75);
INSERT INTO ORDERS VALUES (10529, 'MAISD', 5, CONVERT(date, '07/05/97', 3), CONVERT(date, '09/05/97', 3), 333.45);
INSERT INTO ORDERS VALUES (10530, 'PICCO', 3, CONVERT(date, '08/05/97', 3), CONVERT(date, '12/05/97', 3), 1696.10);
INSERT INTO ORDERS VALUES (10531, 'OCEAN', 7, CONVERT(date, '08/05/97', 3), CONVERT(date, '19/05/97', 3), 40.60);
INSERT INTO ORDERS VALUES (10532, 'EASTC', 7, CONVERT(date, '09/05/97', 3), CONVERT(date, '12/05/97', 3), 372.30);
INSERT INTO ORDERS VALUES (10533, 'FOLKO', 8, CONVERT(date, '12/05/97', 3), CONVERT(date, '22/05/97', 3), 940.20);
INSERT INTO ORDERS VALUES (10534, 'LEHMS', 8, CONVERT(date, '12/05/97', 3), CONVERT(date, '14/05/97', 3), 139.70);
INSERT INTO ORDERS VALUES (10535, 'ANTON', 4, CONVERT(date, '13/05/97', 3), CONVERT(date, '21/05/97', 3), 78.20);
INSERT INTO ORDERS VALUES (10536, 'LEHMS', 3, CONVERT(date, '14/05/97', 3), CONVERT(date, '06/06/97', 3), 294.40);
INSERT INTO ORDERS VALUES (10537, 'RICSU', 1, CONVERT(date, '14/05/97', 3), CONVERT(date, '19/05/97', 3), 394.25);
INSERT INTO ORDERS VALUES (10538, 'BSBEV', 9, CONVERT(date, '15/05/97', 3), CONVERT(date, '16/05/97', 3), 24.35);
INSERT INTO ORDERS VALUES (10539, 'BSBEV', 6, CONVERT(date, '16/05/97', 3), CONVERT(date, '23/05/97', 3), 61.80);
INSERT INTO ORDERS VALUES (10540, 'QUICK', 3, CONVERT(date, '19/05/97', 3), CONVERT(date, '13/06/97', 3), 5038.20);
INSERT INTO ORDERS VALUES (10541, 'HANAR', 2, CONVERT(date, '19/05/97', 3), CONVERT(date, '29/05/97', 3), 343.25);
INSERT INTO ORDERS VALUES (10542, 'KOENE', 1, CONVERT(date, '20/05/97', 3), CONVERT(date, '26/05/97', 3), 54.75);
INSERT INTO ORDERS VALUES (10543, 'LILAS', 8, CONVERT(date, '21/05/97', 3), CONVERT(date, '23/05/97', 3), 240.85);
INSERT INTO ORDERS VALUES (10544, 'LONEP', 4, CONVERT(date, '21/05/97', 3), CONVERT(date, '30/05/97', 3), 124.55);
INSERT INTO ORDERS VALUES (10545, 'LAZYK', 8, CONVERT(date, '22/05/97', 3), CONVERT(date, '26/06/97', 3), 59.60);
INSERT INTO ORDERS VALUES (10546, 'VICTE', 1, CONVERT(date, '23/05/97', 3), CONVERT(date, '30/05/97', 3), 1947.00);
INSERT INTO ORDERS VALUES (10547, 'SAVEA', 4, CONVERT(date, '23/05/97', 3), CONVERT(date, '27/05/97', 3), 1082.00);
INSERT INTO ORDERS VALUES (10613, 'HILAA', 4, CONVERT(date, '29/07/97', 3), CONVERT(date, '01/08/97', 3), 40.55);
INSERT INTO ORDERS VALUES (10614, 'BLAUS', 8, CONVERT(date, '29/07/97', 3), CONVERT(date, '01/08/97', 3), 9.65);
INSERT INTO ORDERS VALUES (10615, 'WILMK', 2, CONVERT(date, '30/07/97', 3), CONVERT(date, '06/08/97', 3), 3.75);
INSERT INTO ORDERS VALUES (10616, 'GREAL', 1, CONVERT(date, '31/07/97', 3), CONVERT(date, '05/08/97', 3), 582.65);
INSERT INTO ORDERS VALUES (10617, 'GREAL', 4, CONVERT(date, '31/07/97', 3), CONVERT(date, '04/08/97', 3), 92.65);
INSERT INTO ORDERS VALUES (10618, 'MEREP', 1, CONVERT(date, '01/08/97', 3), CONVERT(date, '08/08/97', 3), 773.40);
INSERT INTO ORDERS VALUES (10619, 'MEREP', 3, CONVERT(date, '04/08/97', 3), CONVERT(date, '07/08/97', 3), 455.25);
INSERT INTO ORDERS VALUES (10620, 'LAUGB', 2, CONVERT(date, '05/08/97', 3), CONVERT(date, '14/08/97', 3), 4.70);
INSERT INTO ORDERS VALUES (10621, 'ISLAT', 4, CONVERT(date, '05/08/97', 3), CONVERT(date, '11/08/97', 3), 118.65);
INSERT INTO ORDERS VALUES (10622, 'RICAR', 4, CONVERT(date, '06/08/97', 3), CONVERT(date, '11/08/97', 3), 254.85);
INSERT INTO ORDERS VALUES (10623, 'FRANK', 8, CONVERT(date, '07/08/97', 3), CONVERT(date, '12/08/97', 3), 485.90);
INSERT INTO ORDERS VALUES (10625, 'ANATR', 3, CONVERT(date, '08/08/97', 3), CONVERT(date, '14/08/97', 3), 219.50);
INSERT INTO ORDERS VALUES (10626, 'BERGS', 1, CONVERT(date, '11/08/97', 3), CONVERT(date, '20/08/97', 3), 693.45);
INSERT INTO ORDERS VALUES (10627, 'SAVEA', 8, CONVERT(date, '11/08/97', 3), CONVERT(date, '21/08/97', 3), 537.30);
INSERT INTO ORDERS VALUES (10628, 'BLONP', 4, CONVERT(date, '12/08/97', 3), CONVERT(date, '20/08/97', 3), 151.80);
INSERT INTO ORDERS VALUES (10629, 'GODOS', 4, CONVERT(date, '12/08/97', 3), CONVERT(date, '20/08/97', 3), 427.30);
INSERT INTO ORDERS VALUES (10630, 'KOENE', 1, CONVERT(date, '13/08/97', 3), CONVERT(date, '19/08/97', 3), 161.75);
INSERT INTO ORDERS VALUES (10631, 'LAMAI', 8, CONVERT(date, '14/08/97', 3), CONVERT(date, '15/08/97', 3), 4.35);
INSERT INTO ORDERS VALUES (10632, 'WANDK', 8, CONVERT(date, '14/08/97', 3), CONVERT(date, '19/08/97', 3), 206.90);
INSERT INTO ORDERS VALUES (10633, 'ERNSH', 7, CONVERT(date, '15/08/97', 3), CONVERT(date, '18/08/97', 3), 2389.50);
INSERT INTO ORDERS VALUES (10634, 'FOLIG', 4, CONVERT(date, '15/08/97', 3), CONVERT(date, '21/08/97', 3), 2436.90);
INSERT INTO ORDERS VALUES (10635, 'MAGAA', 8, CONVERT(date, '18/08/97', 3), CONVERT(date, '21/08/97', 3), 237.30);
INSERT INTO ORDERS VALUES (10636, 'WARTH', 4, CONVERT(date, '19/08/97', 3), CONVERT(date, '26/08/97', 3), 5.75);
INSERT INTO ORDERS VALUES (10637, 'QUEEN', 6, CONVERT(date, '19/08/97', 3), CONVERT(date, '26/08/97', 3), 1006.45);
INSERT INTO ORDERS VALUES (10638, 'LINOD', 3, CONVERT(date, '20/08/97', 3), CONVERT(date, '01/09/97', 3), 792.20);
INSERT INTO ORDERS VALUES (10639, 'SANTG', 7, CONVERT(date, '20/08/97', 3), CONVERT(date, '27/08/97', 3), 193.20);
INSERT INTO ORDERS VALUES (10640, 'WANDK', 4, CONVERT(date, '21/08/97', 3), CONVERT(date, '28/08/97', 3), 117.75);
INSERT INTO ORDERS VALUES (10641, 'HILAA', 4, CONVERT(date, '22/08/97', 3), CONVERT(date, '26/08/97', 3), 898.05);
INSERT INTO ORDERS VALUES (10642, 'SIMOB', 7, CONVERT(date, '22/08/97', 3), CONVERT(date, '05/09/97', 3), 209.45);
INSERT INTO ORDERS VALUES (10643, 'AROUT', 6, CONVERT(date, '25/08/97', 3), CONVERT(date, '02/09/97', 3), 147.30);
INSERT INTO ORDERS VALUES (10644, 'WELLI', 3, CONVERT(date, '25/08/97', 3), CONVERT(date, '01/09/97', 3), 0.70);
INSERT INTO ORDERS VALUES (10645, 'HANAR', 4, CONVERT(date, '26/08/97', 3), CONVERT(date, '02/09/97', 3), 62.05);
INSERT INTO ORDERS VALUES (10646, 'HUNGO', 9, CONVERT(date, '27/08/97', 3), CONVERT(date, '03/09/97', 3), 711.65);
INSERT INTO ORDERS VALUES (10647, 'QUEDE', 4, CONVERT(date, '27/08/97', 3), CONVERT(date, '03/09/97', 3), 227.70);
INSERT INTO ORDERS VALUES (10648, 'RICAR', 5, CONVERT(date, '28/08/97', 3), CONVERT(date, '09/09/97', 3), 71.25);
INSERT INTO ORDERS VALUES (10650, 'FAMIA', 5, CONVERT(date, '29/08/97', 3), CONVERT(date, '03/09/97', 3), 884.05);
INSERT INTO ORDERS VALUES (10652, 'GOURL', 4, CONVERT(date, '01/09/97', 3), CONVERT(date, '08/09/97', 3), 35.70);
INSERT INTO ORDERS VALUES (10653, 'FRANK', 1, CONVERT(date, '02/09/97', 3), CONVERT(date, '19/09/97', 3), 466.25);
INSERT INTO ORDERS VALUES (10654, 'BERGS', 5, CONVERT(date, '02/09/97', 3), CONVERT(date, '11/09/97', 3), 276.30);
INSERT INTO ORDERS VALUES (10655, 'REGGC', 1, CONVERT(date, '03/09/97', 3), CONVERT(date, '11/09/97', 3), 22.05);
INSERT INTO ORDERS VALUES (10656, 'GREAL', 6, CONVERT(date, '04/09/97', 3), CONVERT(date, '10/09/97', 3), 285.75);
INSERT INTO ORDERS VALUES (10657, 'SAVEA', 2, CONVERT(date, '04/09/97', 3), CONVERT(date, '15/09/97', 3), 1763.45);
INSERT INTO ORDERS VALUES (10658, 'QUICK', 4, CONVERT(date, '05/09/97', 3), CONVERT(date, '08/09/97', 3), 1820.75);
INSERT INTO ORDERS VALUES (10659, 'QUEEN', 7, CONVERT(date, '05/09/97', 3), CONVERT(date, '10/09/97', 3), 529.05);
INSERT INTO ORDERS VALUES (10660, 'HUNGC', 8, CONVERT(date, '08/09/97', 3), CONVERT(date, '15/10/97', 3), 556.45);
INSERT INTO ORDERS VALUES (10661, 'HUNGO', 7, CONVERT(date, '09/09/97', 3), CONVERT(date, '15/09/97', 3), 87.75);
INSERT INTO ORDERS VALUES (10662, 'LONEP', 3, CONVERT(date, '09/09/97', 3), CONVERT(date, '18/09/97', 3), 6.40);
INSERT INTO ORDERS VALUES (10663, 'BONAP', 2, CONVERT(date, '10/09/97', 3), CONVERT(date, '03/10/97', 3), 565.75);
INSERT INTO ORDERS VALUES (10664, 'FURIB', 1, CONVERT(date, '10/09/97', 3), CONVERT(date, '19/09/97', 3), 6.35);
INSERT INTO ORDERS VALUES (10665, 'LONEP', 1, CONVERT(date, '11/09/97', 3), CONVERT(date, '17/09/97', 3), 131.55);
INSERT INTO ORDERS VALUES (10666, 'RICSU', 7, CONVERT(date, '12/09/97', 3), CONVERT(date, '22/09/97', 3), 1162.10);
INSERT INTO ORDERS VALUES (10667, 'ERNSH', 7, CONVERT(date, '12/09/97', 3), CONVERT(date, '19/09/97', 3), 390.45);
INSERT INTO ORDERS VALUES (10668, 'WANDK', 1, CONVERT(date, '15/09/97', 3), CONVERT(date, '23/09/97', 3), 236.10);
INSERT INTO ORDERS VALUES (10669, 'SIMOB', 2, CONVERT(date, '15/09/97', 3), CONVERT(date, '22/09/97', 3), 121.95);
INSERT INTO ORDERS VALUES (10670, 'FRANK', 4, CONVERT(date, '16/09/97', 3), CONVERT(date, '18/09/97', 3), 1017.40);
INSERT INTO ORDERS VALUES (10671, 'FRANR', 1, CONVERT(date, '17/09/97', 3), CONVERT(date, '24/09/97', 3), 151.70);
INSERT INTO ORDERS VALUES (10672, 'BERGS', 9, CONVERT(date, '17/09/97', 3), CONVERT(date, '26/09/97', 3), 478.75);
INSERT INTO ORDERS VALUES (10673, 'WILMK', 2, CONVERT(date, '18/09/97', 3), CONVERT(date, '19/09/97', 3), 113.80);
INSERT INTO ORDERS VALUES (10674, 'ISLAT', 4, CONVERT(date, '18/09/97', 3), CONVERT(date, '30/09/97', 3), 4.50);
INSERT INTO ORDERS VALUES (10675, 'FRANK', 5, CONVERT(date, '19/09/97', 3), CONVERT(date, '23/09/97', 3), 159.25);
INSERT INTO ORDERS VALUES (10676, 'TORTU', 2, CONVERT(date, '22/09/97', 3), CONVERT(date, '29/09/97', 3), 10.05);
INSERT INTO ORDERS VALUES (10677, 'ANTON', 1, CONVERT(date, '22/09/97', 3), CONVERT(date, '26/09/97', 3), 20.15);
INSERT INTO ORDERS VALUES (10678, 'SAVEA', 7, CONVERT(date, '23/09/97', 3), CONVERT(date, '16/10/97', 3), 1944.90);
INSERT INTO ORDERS VALUES (10679, 'BLONP', 8, CONVERT(date, '23/09/97', 3), CONVERT(date, '30/09/97', 3), 139.70);
INSERT INTO ORDERS VALUES (10680, 'OLDWO', 1, CONVERT(date, '24/09/97', 3), CONVERT(date, '26/09/97', 3), 133.05);
INSERT INTO ORDERS VALUES (10681, 'GREAL', 3, CONVERT(date, '25/09/97', 3), CONVERT(date, '30/09/97', 3), 380.65);
INSERT INTO ORDERS VALUES (10682, 'ANTON', 3, CONVERT(date, '25/09/97', 3), CONVERT(date, '01/10/97', 3), 180.65);
INSERT INTO ORDERS VALUES (10684, 'OTTIK', 3, CONVERT(date, '26/09/97', 3), CONVERT(date, '30/09/97', 3), 728.15);
INSERT INTO ORDERS VALUES (10685, 'GOURL', 4, CONVERT(date, '29/09/97', 3), CONVERT(date, '03/10/97', 3), 168.75);
INSERT INTO ORDERS VALUES (10686, 'PICCO', 2, CONVERT(date, '30/09/97', 3), CONVERT(date, '08/10/97', 3), 482.50);
INSERT INTO ORDERS VALUES (10687, 'HUNGO', 9, CONVERT(date, '30/09/97', 3), CONVERT(date, '30/10/97', 3), 1482.15);
INSERT INTO ORDERS VALUES (10688, 'VAFFE', 4, CONVERT(date, '01/10/97', 3), CONVERT(date, '07/10/97', 3), 1495.45);
INSERT INTO ORDERS VALUES (10689, 'BERGS', 1, CONVERT(date, '01/10/97', 3), CONVERT(date, '07/10/97', 3), 67.10);
INSERT INTO ORDERS VALUES (10691, 'QUICK', 2, CONVERT(date, '03/10/97', 3), CONVERT(date, '22/10/97', 3), 4050.25);
INSERT INTO ORDERS VALUES (10692, 'BSBEV', 4, CONVERT(date, '03/10/97', 3), CONVERT(date, '13/10/97', 3), 305.10);
INSERT INTO ORDERS VALUES (10693, 'WHITC', 3, CONVERT(date, '06/10/97', 3), CONVERT(date, '10/10/97', 3), 696.70);
INSERT INTO ORDERS VALUES (10694, 'QUICK', 8, CONVERT(date, '06/10/97', 3), CONVERT(date, '09/10/97', 3), 1991.80);
INSERT INTO ORDERS VALUES (10695, 'WILMK', 7, CONVERT(date, '07/10/97', 3), CONVERT(date, '14/10/97', 3), 83.60);
INSERT INTO ORDERS VALUES (10696, 'WHITC', 8, CONVERT(date, '08/10/97', 3), CONVERT(date, '14/10/97', 3), 512.75);
INSERT INTO ORDERS VALUES (10697, 'LINOD', 3, CONVERT(date, '08/10/97', 3), CONVERT(date, '14/10/97', 3), 227.60);
INSERT INTO ORDERS VALUES (10698, 'ERNSH', 4, CONVERT(date, '09/10/97', 3), CONVERT(date, '17/10/97', 3), 1362.35);
INSERT INTO ORDERS VALUES (10699, 'MORGK', 3, CONVERT(date, '09/10/97', 3), CONVERT(date, '13/10/97', 3), 2.90);
INSERT INTO ORDERS VALUES (10700, 'SAVEA', 3, CONVERT(date, '10/10/97', 3), CONVERT(date, '16/10/97', 3), 325.50);
INSERT INTO ORDERS VALUES (10701, 'HUNGO', 6, CONVERT(date, '13/10/97', 3), CONVERT(date, '15/10/97', 3), 1101.55);
INSERT INTO ORDERS VALUES (10702, 'ALFKI', 4, CONVERT(date, '13/10/97', 3), CONVERT(date, '21/10/97', 3), 119.70);
INSERT INTO ORDERS VALUES (10703, 'FOLKO', 6, CONVERT(date, '14/10/97', 3), CONVERT(date, '20/10/97', 3), 761.50);
INSERT INTO ORDERS VALUES (10704, 'QUEEN', 6, CONVERT(date, '14/10/97', 3), CONVERT(date, '07/11/97', 3), 23.90);
INSERT INTO ORDERS VALUES (10705, 'HILAA', 9, CONVERT(date, '15/10/97', 3), CONVERT(date, '18/11/97', 3), 17.60);
INSERT INTO ORDERS VALUES (10706, 'OLDWO', 8, CONVERT(date, '16/10/97', 3), CONVERT(date, '21/10/97', 3), 678.15);
INSERT INTO ORDERS VALUES (10707, 'AROUT', 4, CONVERT(date, '16/10/97', 3), CONVERT(date, '23/10/97', 3), 108.70);
INSERT INTO ORDERS VALUES (10708, 'THEBI', 6, CONVERT(date, '17/10/97', 3), CONVERT(date, '05/11/97', 3), 14.80);
INSERT INTO ORDERS VALUES (10710, 'FRANS', 1, CONVERT(date, '20/10/97', 3), CONVERT(date, '23/10/97', 3), 24.90);
INSERT INTO ORDERS VALUES (10711, 'SAVEA', 5, CONVERT(date, '21/10/97', 3), CONVERT(date, '29/10/97', 3), 262.05);
INSERT INTO ORDERS VALUES (10712, 'HUNGO', 3, CONVERT(date, '21/10/97', 3), CONVERT(date, '31/10/97', 3), 449.65);
INSERT INTO ORDERS VALUES (10713, 'SAVEA', 1, CONVERT(date, '22/10/97', 3), CONVERT(date, '24/10/97', 3), 835.25);
INSERT INTO ORDERS VALUES (10714, 'SAVEA', 5, CONVERT(date, '22/10/97', 3), CONVERT(date, '27/10/97', 3), 122.45);
INSERT INTO ORDERS VALUES (10716, 'RANCH', 4, CONVERT(date, '24/10/97', 3), CONVERT(date, '27/10/97', 3), 112.85);
INSERT INTO ORDERS VALUES (10717, 'FRANK', 1, CONVERT(date, '24/10/97', 3), CONVERT(date, '29/10/97', 3), 296.25);
INSERT INTO ORDERS VALUES (10718, 'KOENE', 1, CONVERT(date, '27/10/97', 3), CONVERT(date, '29/10/97', 3), 854.40);
INSERT INTO ORDERS VALUES (10719, 'LETSS', 8, CONVERT(date, '27/10/97', 3), CONVERT(date, '05/11/97', 3), 257.20);
INSERT INTO ORDERS VALUES (10720, 'QUEDE', 8, CONVERT(date, '28/10/97', 3), CONVERT(date, '05/11/97', 3), 47.65);
INSERT INTO ORDERS VALUES (10721, 'QUICK', 5, CONVERT(date, '29/10/97', 3), CONVERT(date, '31/10/97', 3), 244.60);
INSERT INTO ORDERS VALUES (10722, 'SAVEA', 8, CONVERT(date, '29/10/97', 3), CONVERT(date, '04/11/97', 3), 372.90);
INSERT INTO ORDERS VALUES (10723, 'WHITC', 3, CONVERT(date, '30/10/97', 3), CONVERT(date, '25/11/97', 3), 108.60);
INSERT INTO ORDERS VALUES (10724, 'MEREP', 8, CONVERT(date, '30/10/97', 3), CONVERT(date, '05/11/97', 3), 288.75);
INSERT INTO ORDERS VALUES (10725, 'FAMIA', 4, CONVERT(date, '31/10/97', 3), CONVERT(date, '05/11/97', 3), 54.15);
INSERT INTO ORDERS VALUES (10726, 'EASTC', 4, CONVERT(date, '03/11/97', 3), CONVERT(date, '05/12/97', 3), 82.80);
INSERT INTO ORDERS VALUES (10727, 'REGGC', 2, CONVERT(date, '03/11/97', 3), CONVERT(date, '05/12/97', 3), 449.50);
INSERT INTO ORDERS VALUES (10728, 'QUEEN', 4, CONVERT(date, '04/11/97', 3), CONVERT(date, '11/11/97', 3), 291.65);
INSERT INTO ORDERS VALUES (10729, 'LINOD', 8, CONVERT(date, '04/11/97', 3), CONVERT(date, '14/11/97', 3), 705.30);
INSERT INTO ORDERS VALUES (10730, 'BONAP', 5, CONVERT(date, '05/11/97', 3), CONVERT(date, '14/11/97', 3), 100.60);
INSERT INTO ORDERS VALUES (10731, 'CHOPS', 7, CONVERT(date, '06/11/97', 3), CONVERT(date, '14/11/97', 3), 483.25);
INSERT INTO ORDERS VALUES (10732, 'BONAP', 3, CONVERT(date, '06/11/97', 3), CONVERT(date, '07/11/97', 3), 84.85);
INSERT INTO ORDERS VALUES (10733, 'BERGS', 1, CONVERT(date, '07/11/97', 3), CONVERT(date, '10/11/97', 3), 550.55);
INSERT INTO ORDERS VALUES (10734, 'GOURL', 2, CONVERT(date, '07/11/97', 3), CONVERT(date, '12/11/97', 3), 8.15);
INSERT INTO ORDERS VALUES (10735, 'LETSS', 6, CONVERT(date, '10/11/97', 3), CONVERT(date, '21/11/97', 3), 229.85);
INSERT INTO ORDERS VALUES (10736, 'HUNGO', 9, CONVERT(date, '11/11/97', 3), CONVERT(date, '21/11/97', 3), 220.50);
INSERT INTO ORDERS VALUES (10737, 'VINET', 2, CONVERT(date, '11/11/97', 3), CONVERT(date, '18/11/97', 3), 38.95);
INSERT INTO ORDERS VALUES (10738, 'SPECD', 2, CONVERT(date, '12/11/97', 3), CONVERT(date, '18/11/97', 3), 14.55);
INSERT INTO ORDERS VALUES (10739, 'BONAP', 3, CONVERT(date, '12/11/97', 3), CONVERT(date, '18/11/97', 3), 95.00);
INSERT INTO ORDERS VALUES (10740, 'QUICK', 2, CONVERT(date, '13/11/97', 3), CONVERT(date, '25/11/97', 3), 155.50);
INSERT INTO ORDERS VALUES (10741, 'FRANK', 5, CONVERT(date, '13/11/97', 3), CONVERT(date, '18/11/97', 3), 61.90);
INSERT INTO ORDERS VALUES (10742, 'RANCH', 2, CONVERT(date, '14/11/97', 3), CONVERT(date, '20/11/97', 3), 207.20);
INSERT INTO ORDERS VALUES (10743, 'BERGS', 4, CONVERT(date, '14/11/97', 3), CONVERT(date, '25/11/97', 3), 38.00);
INSERT INTO ORDERS VALUES (10744, 'SPECD', 7, CONVERT(date, '17/11/97', 3), CONVERT(date, '23/11/97', 3), 70.20);
INSERT INTO ORDERS VALUES (10745, 'FOLKO', 7, CONVERT(date, '18/11/97', 3), CONVERT(date, '24/11/97', 3), 1045.50);
INSERT INTO ORDERS VALUES (10746, 'FOLKO', 4, CONVERT(date, '19/11/97', 3), CONVERT(date, '24/11/97', 3), 92.90);
INSERT INTO ORDERS VALUES (10747, 'FAMIA', 1, CONVERT(date, '20/11/97', 3), CONVERT(date, '28/11/97', 3), 73.40);
INSERT INTO ORDERS VALUES (10748, 'HUNGO', 1, CONVERT(date, '21/11/97', 3), CONVERT(date, '24/11/97', 3), 203.50);
INSERT INTO ORDERS VALUES (10749, 'HUNGO', 4, CONVERT(date, '21/11/97', 3), CONVERT(date, '28/11/97', 3), 43.30);
INSERT INTO ORDERS VALUES (10750, 'MEREP', 6, CONVERT(date, '21/11/97', 3), CONVERT(date, '24/11/97', 3), 97.60);
INSERT INTO ORDERS VALUES (10751, 'MORGK', 6, CONVERT(date, '24/11/97', 3), CONVERT(date, '30/11/97', 3), 15.45);
INSERT INTO ORDERS VALUES (10752, 'REGGC', 1, CONVERT(date, '24/11/97', 3), CONVERT(date, '05/12/97', 3), 74.40);
INSERT INTO ORDERS VALUES (10753, 'RANCH', 3, CONVERT(date, '25/11/97', 3), CONVERT(date, '02/12/97', 3), 37.90);
INSERT INTO ORDERS VALUES (10754, 'SPECD', 6, CONVERT(date, '26/11/97', 3), CONVERT(date, '03/12/97', 3), 215.35);
INSERT INTO ORDERS VALUES (10755, 'ALFKI', 3, CONVERT(date, '26/11/97', 3), CONVERT(date, '28/11/97', 3), 185.55);
INSERT INTO ORDERS VALUES (10756, 'SPECD', 1, CONVERT(date, '27/11/97', 3), CONVERT(date, '09/12/97', 3), 337.75);
INSERT INTO ORDERS VALUES (10757, 'TOMSP', 2, CONVERT(date, '27/11/97', 3), CONVERT(date, '03/12/97', 3), 76.20);
INSERT INTO ORDERS VALUES (10758, 'OLDWO', 4, CONVERT(date, '01/12/97', 3), CONVERT(date, '05/12/97', 3), 12.90);
INSERT INTO ORDERS VALUES (10759, 'FRANK', 2, CONVERT(date, '02/12/97', 3), CONVERT(date, '07/12/97', 3), 58.10);
INSERT INTO ORDERS VALUES (10760, 'HUNGO', 6, CONVERT(date, '03/12/97', 3), CONVERT(date, '07/12/97', 3), 304.90);
INSERT INTO ORDERS VALUES (10761, 'FOLKO', 1, CONVERT(date, '05/12/97', 3), CONVERT(date, '12/12/97', 3), 11.10);
INSERT INTO ORDERS VALUES (10762, 'FOLKO', 6, CONVERT(date, '09/12/97', 3), CONVERT(date, '12/12/97', 3), 203.75);
INSERT INTO ORDERS VALUES (10763, 'WELLI', 5, CONVERT(date, '11/12/97', 3), CONVERT(date, '19/12/97', 3), 198.20);
INSERT INTO ORDERS VALUES (10764, 'THEBI', 1, CONVERT(date, '11/12/97', 3), CONVERT(date, '19/12/97', 3), 60.15);
INSERT INTO ORDERS VALUES (10765, 'PERIC', 5, CONVERT(date, '11/12/97', 3), CONVERT(date, '14/12/97', 3), 418.85);
INSERT INTO ORDERS VALUES (10766, 'TOMSP', 2, CONVERT(date, '12/12/97', 3), CONVERT(date, '16/12/97', 3), 122.60);
INSERT INTO ORDERS VALUES (10767, 'AROUT', 3, CONVERT(date, '15/12/97', 3), CONVERT(date, '18/12/97', 3), 342.40);
INSERT INTO ORDERS VALUES (10768, 'FRANK', 2, CONVERT(date, '16/12/97', 3), CONVERT(date, '18/12/97', 3), 204.00);
INSERT INTO ORDERS VALUES (10769, 'HUNGO', 1, CONVERT(date, '17/12/97', 3), CONVERT(date, '22/12/97', 3), 54.90);
INSERT INTO ORDERS VALUES (10770, 'FOLKO', 4, CONVERT(date, '19/12/97', 3), CONVERT(date, '22/12/97', 3), 51.75);
INSERT INTO ORDERS VALUES (10771, 'AROUT', 5, CONVERT(date, '22/12/97', 3), CONVERT(date, '28/12/97', 3), 180.60);
INSERT INTO ORDERS VALUES (10815, 'SAVEA', 2, CONVERT(date, '05/01/98', 3), CONVERT(date, '14/01/98', 3), 73.10);
INSERT INTO ORDERS VALUES (10816, 'GREAL', 4, CONVERT(date, '06/01/98', 3), CONVERT(date, '04/02/98', 3), 3598.90);
INSERT INTO ORDERS VALUES (10817, 'KOENE', 3, CONVERT(date, '06/01/98', 3), CONVERT(date, '13/01/98', 3), 1530.35);
INSERT INTO ORDERS VALUES (10818, 'MAGAA', 7, CONVERT(date, '07/01/98', 3), CONVERT(date, '12/01/98', 3), 327.40);
INSERT INTO ORDERS VALUES (10819, 'CACTU', 2, CONVERT(date, '07/01/98', 3), CONVERT(date, '16/01/98', 3), 98.80);
INSERT INTO ORDERS VALUES (10820, 'RATTC', 3, CONVERT(date, '07/01/98', 3), CONVERT(date, '13/01/98', 3), 187.60);
INSERT INTO ORDERS VALUES (10821, 'SPLIR', 1, CONVERT(date, '08/01/98', 3), CONVERT(date, '15/01/98', 3), 183.40);
INSERT INTO ORDERS VALUES (10823, 'LILAS', 5, CONVERT(date, '09/01/98', 3), CONVERT(date, '13/01/98', 3), 819.85);
INSERT INTO ORDERS VALUES (10824, 'FOLKO', 8, CONVERT(date, '09/01/98', 3), CONVERT(date, '30/01/98', 3), 6.15);
INSERT INTO ORDERS VALUES (10825, 'DRACD', 1, CONVERT(date, '09/01/98', 3), CONVERT(date, '14/01/98', 3), 396.25);
INSERT INTO ORDERS VALUES (10826, 'BLONP', 6, CONVERT(date, '12/01/98', 3), CONVERT(date, '06/02/98', 3), 35.45);
INSERT INTO ORDERS VALUES (10827, 'BONAP', 1, CONVERT(date, '12/01/98', 3), CONVERT(date, '06/02/98', 3), 317.70);
INSERT INTO ORDERS VALUES (10828, 'RANCH', 9, CONVERT(date, '13/01/98', 3), CONVERT(date, '04/02/98', 3), 454.25);
INSERT INTO ORDERS VALUES (10829, 'ISLAT', 9, CONVERT(date, '13/01/98', 3), CONVERT(date, '23/01/98', 3), 773.60);
INSERT INTO ORDERS VALUES (10830, 'TRADH', 4, CONVERT(date, '13/01/98', 3), CONVERT(date, '21/01/98', 3), 409.15);
INSERT INTO ORDERS VALUES (10831, 'SANTG', 3, CONVERT(date, '14/01/98', 3), CONVERT(date, '23/01/98', 3), 360.95);
INSERT INTO ORDERS VALUES (10832, 'LAMAI', 2, CONVERT(date, '14/01/98', 3), CONVERT(date, '19/01/98', 3), 216.30);
INSERT INTO ORDERS VALUES (10833, 'OTTIK', 6, CONVERT(date, '15/01/98', 3), CONVERT(date, '23/01/98', 3), 357.45);
INSERT INTO ORDERS VALUES (10834, 'TRADH', 1, CONVERT(date, '15/01/98', 3), CONVERT(date, '19/01/98', 3), 148.90);
INSERT INTO ORDERS VALUES (10835, 'ALFKI', 1, CONVERT(date, '15/01/98', 3), CONVERT(date, '21/01/98', 3), 347.65);
INSERT INTO ORDERS VALUES (10836, 'ERNSH', 7, CONVERT(date, '16/01/98', 3), CONVERT(date, '21/01/98', 3), 2059.40);
INSERT INTO ORDERS VALUES (10837, 'BERGS', 9, CONVERT(date, '16/01/98', 3), CONVERT(date, '23/01/98', 3), 66.60);
INSERT INTO ORDERS VALUES (10838, 'LINOD', 3, CONVERT(date, '19/01/98', 3), CONVERT(date, '23/01/98', 3), 296.40);
INSERT INTO ORDERS VALUES (10839, 'TRADH', 3, CONVERT(date, '19/01/98', 3), CONVERT(date, '22/01/98', 3), 177.15);
INSERT INTO ORDERS VALUES (10840, 'LINOD', 4, CONVERT(date, '19/01/98', 3), CONVERT(date, '16/02/98', 3), 13.55);
INSERT INTO ORDERS VALUES (10841, 'SUPRD', 5, CONVERT(date, '20/01/98', 3), CONVERT(date, '29/01/98', 3), 2121.50);
INSERT INTO ORDERS VALUES (10842, 'TORTU', 1, CONVERT(date, '20/01/98', 3), CONVERT(date, '29/01/98', 3), 272.10);
INSERT INTO ORDERS VALUES (10843, 'VICTE', 4, CONVERT(date, '21/01/98', 3), CONVERT(date, '26/01/98', 3), 46.30);
INSERT INTO ORDERS VALUES (10844, 'PICCO', 8, CONVERT(date, '21/01/98', 3), CONVERT(date, '26/01/98', 3), 126.10);
INSERT INTO ORDERS VALUES (10845, 'QUICK', 8, CONVERT(date, '21/01/98', 3), CONVERT(date, '30/01/98', 3), 1064.90);
INSERT INTO ORDERS VALUES (10846, 'SUPRD', 2, CONVERT(date, '22/01/98', 3), CONVERT(date, '23/01/98', 3), 282.30);
INSERT INTO ORDERS VALUES (10847, 'SAVEA', 4, CONVERT(date, '22/01/98', 3), CONVERT(date, '10/02/98', 3), 2437.85);
INSERT INTO ORDERS VALUES (10848, 'CONSH', 7, CONVERT(date, '23/01/98', 3), CONVERT(date, '29/01/98', 3), 191.20);
INSERT INTO ORDERS VALUES (10849, 'KOENE', 9, CONVERT(date, '23/01/98', 3), CONVERT(date, '30/01/98', 3), 2.80);
INSERT INTO ORDERS VALUES (10850, 'VICTE', 1, CONVERT(date, '23/01/98', 3), CONVERT(date, '30/01/98', 3), 245.95);
INSERT INTO ORDERS VALUES (10851, 'RICAR', 5, CONVERT(date, '26/01/98', 3), CONVERT(date, '02/02/98', 3), 802.75);
INSERT INTO ORDERS VALUES (10852, 'RATTC', 8, CONVERT(date, '26/01/98', 3), CONVERT(date, '30/01/98', 3), 870.25);
INSERT INTO ORDERS VALUES (10853, 'BLAUS', 9, CONVERT(date, '27/01/98', 3), CONVERT(date, '03/02/98', 3), 269.15);
INSERT INTO ORDERS VALUES (10854, 'ERNSH', 3, CONVERT(date, '27/01/98', 3), CONVERT(date, '05/02/98', 3), 501.10);
INSERT INTO ORDERS VALUES (10855, 'OLDWO', 3, CONVERT(date, '27/01/98', 3), CONVERT(date, '04/02/98', 3), 854.85);
INSERT INTO ORDERS VALUES (10856, 'ANTON', 3, CONVERT(date, '28/01/98', 3), CONVERT(date, '10/02/98', 3), 646.35);
INSERT INTO ORDERS VALUES (10857, 'MAGAA', 6, CONVERT(date, '28/01/98', 3), CONVERT(date, '02/02/98', 3), 247.70);
INSERT INTO ORDERS VALUES (10858, 'MORGK', 4, CONVERT(date, '29/01/98', 3), CONVERT(date, '10/02/98', 3), 485.50);
INSERT INTO ORDERS VALUES (10859, 'QUICK', 4, CONVERT(date, '29/01/98', 3), CONVERT(date, '05/02/98', 3), 526.80);
INSERT INTO ORDERS VALUES (10860, 'CHOPS', 6, CONVERT(date, '30/01/98', 3), CONVERT(date, '05/02/98', 3), 485.00);
INSERT INTO ORDERS VALUES (10861, 'MAISD', 3, CONVERT(date, '30/01/98', 3), CONVERT(date, '04/02/98', 3), 57.35);
INSERT INTO ORDERS VALUES (10862, 'QUICK', 3, CONVERT(date, '30/01/98', 3), CONVERT(date, '04/02/98', 3), 128.75);
INSERT INTO ORDERS VALUES (10863, 'ERNSH', 4, CONVERT(date, '01/02/98', 3), CONVERT(date, '12/02/98', 3), 431.85);
INSERT INTO ORDERS VALUES (10864, 'QUICK', 5, CONVERT(date, '01/02/98', 3), CONVERT(date, '10/02/98', 3), 316.35);
INSERT INTO ORDERS VALUES (10865, 'ERNSH', 3, CONVERT(date, '02/02/98', 3), CONVERT(date, '10/02/98', 3), 115.85);
INSERT INTO ORDERS VALUES (10866, 'FRANK', 7, CONVERT(date, '02/02/98', 3), CONVERT(date, '06/02/98', 3), 1820.10);
INSERT INTO ORDERS VALUES (10867, 'PRINI', 2, CONVERT(date, '03/02/98', 3), CONVERT(date, '10/02/98', 3), 508.00);
INSERT INTO ORDERS VALUES (10868, 'SANTG', 7, CONVERT(date, '03/02/98', 3), CONVERT(date, '11/02/98', 3), 638.40);
INSERT INTO ORDERS VALUES (10869, 'BONAP', 1, CONVERT(date, '03/02/98', 3), CONVERT(date, '11/02/98', 3), 256.25);
INSERT INTO ORDERS VALUES (10870, 'HILAA', 3, CONVERT(date, '04/02/98', 3), CONVERT(date, '10/02/98', 3), 267.00);
INSERT INTO ORDERS VALUES (10871, 'RICAR', 6, CONVERT(date, '05/02/98', 3), CONVERT(date, '10/02/98', 3), 218.50);
INSERT INTO ORDERS VALUES (10872, 'ALFKI', 5, CONVERT(date, '05/02/98', 3), CONVERT(date, '13/02/98', 3), 113.85);
INSERT INTO ORDERS VALUES (10873, 'MAISD', 2, CONVERT(date, '05/02/98', 3), CONVERT(date, '13/02/98', 3), 229.70);
INSERT INTO ORDERS VALUES (10874, 'SANTG', 7, CONVERT(date, '09/02/98', 3), CONVERT(date, '17/02/98', 3), 1035.30);
INSERT INTO ORDERS VALUES (10875, 'ANTON', 5, CONVERT(date, '09/02/98', 3), CONVERT(date, '13/02/98', 3), 163.60);
INSERT INTO ORDERS VALUES (10876, 'FRANK', 6, CONVERT(date, '09/02/98', 3), CONVERT(date, '16/02/98', 3), 223.80);
INSERT INTO ORDERS VALUES (10877, 'FOLKO', 2, CONVERT(date, '10/02/98', 3), CONVERT(date, '16/02/98', 3), 1044.75);
INSERT INTO ORDERS VALUES (10878, 'KOENE', 5, CONVERT(date, '11/02/98', 3), CONVERT(date, '16/02/98', 3), 184.00);
INSERT INTO ORDERS VALUES (10879, 'GREAL', 4, CONVERT(date, '12/02/98', 3), CONVERT(date, '18/02/98', 3), 960.90);
INSERT INTO ORDERS VALUES (10880, 'FOLKO', 8, CONVERT(date, '13/02/98', 3), CONVERT(date, '20/02/98', 3), 274.40);
INSERT INTO ORDERS VALUES (10881, 'ALFKI', 1, CONVERT(date, '16/02/98', 3), CONVERT(date, '19/02/98', 3), 254.90);
INSERT INTO ORDERS VALUES (10882, 'ERNSH', 1, CONVERT(date, '17/02/98', 3), CONVERT(date, '23/02/98', 3), 292.90);
INSERT INTO ORDERS VALUES (10883, 'LILAS', 5, CONVERT(date, '18/02/98', 3), CONVERT(date, '26/02/98', 3), 311.70);
INSERT INTO ORDERS VALUES (10884, 'MAGAA', 1, CONVERT(date, '18/02/98', 3), CONVERT(date, '23/02/98', 3), 49.90);
INSERT INTO ORDERS VALUES (10885, 'LILAS', 5, CONVERT(date, '19/02/98', 3), CONVERT(date, '24/02/98', 3), 44.90);
INSERT INTO ORDERS VALUES (10886, 'ANTON', 2, CONVERT(date, '20/02/98', 3), CONVERT(date, '23/02/98', 3), 559.00);
INSERT INTO ORDERS VALUES (10887, 'TORTU', 2, CONVERT(date, '23/02/98', 3), CONVERT(date, '04/03/98', 3), 125.40);
INSERT INTO ORDERS VALUES (10888, 'ANTON', 5, CONVERT(date, '23/02/98', 3), CONVERT(date, '04/03/98', 3), 126.75);
INSERT INTO ORDERS VALUES (10889, 'QUICK', 3, CONVERT(date, '24/02/98', 3), CONVERT(date, '04/03/98', 3), 62.70);
INSERT INTO ORDERS VALUES (10890, 'ALFKI', 3, CONVERT(date, '24/02/98', 3), CONVERT(date, '02/03/98', 3), 136.65);
INSERT INTO ORDERS VALUES (10891, 'HILAA', 5, CONVERT(date, '25/02/98', 3), CONVERT(date, '03/03/98', 3), 287.90);
INSERT INTO ORDERS VALUES (10892, 'ANTON', 1, CONVERT(date, '25/02/98', 3), CONVERT(date, '04/03/98', 3), 72.10);
INSERT INTO ORDERS VALUES (10893, 'HILAA', 7, CONVERT(date, '26/02/98', 3), CONVERT(date, '05/03/98', 3), 510.90);
INSERT INTO ORDERS VALUES (10894, 'ANTON', 5, CONVERT(date, '27/02/98', 3), CONVERT(date, '06/03/98', 3), 616.50);
INSERT INTO ORDERS VALUES (10895, 'RANCH', 6, CONVERT(date, '27/02/98', 3), CONVERT(date, '05/03/98', 3), 748.65);
INSERT INTO ORDERS VALUES (10896, 'RATTC', 2, CONVERT(date, '27/02/98', 3), CONVERT(date, '05/03/98', 3), 332.90);
INSERT INTO ORDERS VALUES (10897, 'RATTC', 1, CONVERT(date, '02/03/98', 3), CONVERT(date, '05/03/98', 3), 46.65);
INSERT INTO ORDERS VALUES (10898, 'RATTC', 3, CONVERT(date, '04/03/98', 3), CONVERT(date, '11/03/98', 3), 352.40);
INSERT INTO ORDERS VALUES (10899, 'ANTON', 3, CONVERT(date, '04/03/98', 3), CONVERT(date, '13/03/98', 3), 186.00);
INSERT INTO ORDERS VALUES (10900, 'ANTON', 5, CONVERT(date, '05/03/98', 3), CONVERT(date, '13/03/98', 3), 668.40);
INSERT INTO ORDERS VALUES (10901, 'SANTG', 4, CONVERT(date, '09/03/98', 3), CONVERT(date, '18/03/98', 3), 455.10);
INSERT INTO ORDERS VALUES (10902, 'ANTON', 1, CONVERT(date, '10/03/98', 3), CONVERT(date, '13/03/98', 3), 75.50);
INSERT INTO ORDERS VALUES (10903, 'ANTON', 5, CONVERT(date, '11/03/98', 3), CONVERT(date, '18/03/98', 3), 336.25);
INSERT INTO ORDERS VALUES (10904, 'MAGAA', 5, CONVERT(date, '12/03/98', 3), CONVERT(date, '19/03/98', 3), 513.00);
INSERT INTO ORDERS VALUES (10905, 'ANTON', 7, CONVERT(date, '12/03/98', 3), CONVERT(date, '18/03/98', 3), 243.70);
INSERT INTO ORDERS VALUES (10906, 'ERNSH', 2, CONVERT(date, '13/03/98', 3), CONVERT(date, '20/03/98', 3), 225.75);
INSERT INTO ORDERS VALUES (10907, 'MAGAA', 3, CONVERT(date, '16/03/98', 3), CONVERT(date, '23/03/98', 3), 338.50);
INSERT INTO ORDERS VALUES (10908, 'QUICK', 3, CONVERT(date, '16/03/98', 3), CONVERT(date, '25/03/98', 3), 115.90);
INSERT INTO ORDERS VALUES (10909, 'ANTON', 5, CONVERT(date, '17/03/98', 3), CONVERT(date, '25/03/98', 3), 217.30);
INSERT INTO ORDERS VALUES (10910, 'FOLKO', 2, CONVERT(date, '18/03/98', 3), CONVERT(date, '25/03/98', 3), 117.30);
INSERT INTO ORDERS VALUES (10911, 'ANTON', 1, CONVERT(date, '19/03/98', 3), CONVERT(date, '26/03/98', 3), 207.25);
INSERT INTO ORDERS VALUES (10912, 'ANTON', 2, CONVERT(date, '20/03/98', 3), CONVERT(date, '26/03/98', 3), 314.55);
INSERT INTO ORDERS VALUES (10913, 'FOLKO', 2, CONVERT(date, '23/03/98', 3), CONVERT(date, '30/03/98', 3), 484.95);
INSERT INTO ORDERS VALUES (10914, 'ANTON', 2, CONVERT(date, '24/03/98', 3), CONVERT(date, '31/03/98', 3), 442.10);
INSERT INTO ORDERS VALUES (10915, 'ANTON', 7, CONVERT(date, '25/03/98', 3), CONVERT(date, '01/04/98', 3), 716.60);
INSERT INTO ORDERS VALUES (10916, 'ALFKI', 1, CONVERT(date, '27/03/98', 3), CONVERT(date, '03/04/98', 3), 219.70);
INSERT INTO ORDERS VALUES (10917, 'ANTON', 5, CONVERT(date, '27/03/98', 3), CONVERT(date, '03/04/98', 3), 408.75);
INSERT INTO ORDERS VALUES (10918, 'ANTON', 5, CONVERT(date, '30/03/98', 3), CONVERT(date, '06/04/98', 3), 115.50);
INSERT INTO ORDERS VALUES (10919, 'ANTON', 4, CONVERT(date, '31/03/98', 3), CONVERT(date, '06/04/98', 3), 389.75);
INSERT INTO ORDERS VALUES (10920, 'ANTON', 6, CONVERT(date, '01/04/98', 3), CONVERT(date, '06/04/98', 3), 404.85);
INSERT INTO ORDERS VALUES (10921, 'ANTON', 5, CONVERT(date, '03/04/98', 3), CONVERT(date, '10/04/98', 3), 184.10);
INSERT INTO ORDERS VALUES (10922, 'ANTON', 1, CONVERT(date, '04/04/98', 3), CONVERT(date, '10/04/98', 3), 314.25);
INSERT INTO ORDERS VALUES (10923, 'MAGAA', 6, CONVERT(date, '05/04/98', 3), CONVERT(date, '12/04/98', 3), 487.80);
INSERT INTO ORDERS VALUES (10924, 'ANTON', 5, CONVERT(date, '07/04/98', 3), CONVERT(date, '14/04/98', 3), 209.90);
INSERT INTO ORDERS VALUES (10925, 'ANTON', 5, CONVERT(date, '08/04/98', 3), CONVERT(date, '14/04/98', 3), 202.70);
INSERT INTO ORDERS VALUES (10926, 'ANTON', 3, CONVERT(date, '10/04/98', 3), CONVERT(date, '15/04/98', 3), 227.40);
INSERT INTO ORDERS VALUES (10927, 'ANTON', 5, CONVERT(date, '13/04/98', 3), CONVERT(date, '20/04/98', 3), 280.90);
INSERT INTO ORDERS VALUES (10928, 'ANTON', 7, CONVERT(date, '14/04/98', 3), CONVERT(date, '21/04/98', 3), 358.20);
INSERT INTO ORDERS VALUES (10929, 'MAGAA', 4, CONVERT(date, '15/04/98', 3), CONVERT(date, '22/04/98', 3), 265.00);
INSERT INTO ORDERS VALUES (10930, 'ANTON', 5, CONVERT(date, '15/04/98', 3), CONVERT(date, '22/04/98', 3), 147.80);
INSERT INTO ORDERS VALUES (10931, 'ANTON', 6, CONVERT(date, '16/04/98', 3), CONVERT(date, '22/04/98', 3), 274.80);
INSERT INTO ORDERS VALUES (10932, 'ANTON', 1, CONVERT(date, '17/04/98', 3), CONVERT(date, '23/04/98', 3), 398.70);
INSERT INTO ORDERS VALUES (10933, 'ANTON', 2, CONVERT(date, '20/04/98', 3), CONVERT(date, '27/04/98', 3), 314.55);
INSERT INTO ORDERS VALUES (10934, 'ANTON', 4, CONVERT(date, '21/04/98', 3), CONVERT(date, '28/04/98', 3), 405.50);
INSERT INTO ORDERS VALUES (10935, 'ANTON', 4, CONVERT(date, '22/04/98', 3), CONVERT(date, '29/04/98', 3), 467.80);
INSERT INTO ORDERS VALUES (10936, 'ANTON', 1, CONVERT(date, '23/04/98', 3), CONVERT(date, '29/04/98', 3), 318.00);
INSERT INTO ORDERS VALUES (10937, 'ANTON', 4, CONVERT(date, '24/04/98', 3), CONVERT(date, '30/04/98', 3), 348.75);
INSERT INTO ORDERS VALUES (10938, 'ANTON', 1, CONVERT(date, '27/04/98', 3), CONVERT(date, '03/05/98', 3), 199.90);
INSERT INTO ORDERS VALUES (10939, 'ANTON', 5, CONVERT(date, '28/04/98', 3), CONVERT(date, '06/05/98', 3), 196.80);
INSERT INTO ORDERS VALUES (10940, 'ANTON', 6, CONVERT(date, '29/04/98', 3), CONVERT(date, '06/05/98', 3), 228.10);
INSERT INTO ORDERS VALUES (10941, 'ANTON', 5, CONVERT(date, '01/05/98', 3), CONVERT(date, '08/05/98', 3), 326.90);
INSERT INTO ORDERS VALUES (10942, 'ANTON', 6, CONVERT(date, '04/05/98', 3), CONVERT(date, '11/05/98', 3), 421.50);
INSERT INTO ORDERS VALUES (10943, 'ANTON', 7, CONVERT(date, '06/05/98', 3), CONVERT(date, '13/05/98', 3), 572.00);
INSERT INTO ORDERS VALUES (10944, 'ANTON', 1, CONVERT(date, '08/05/98', 3), CONVERT(date, '13/05/98', 3), 344.50);
INSERT INTO ORDERS VALUES (10945, 'ANTON', 5, CONVERT(date, '11/05/98', 3), CONVERT(date, '18/05/98', 3), 291.20);
INSERT INTO ORDERS VALUES (10946, 'ANTON', 1, CONVERT(date, '13/05/98', 3), CONVERT(date, '19/05/98', 3), 303.70);
INSERT INTO ORDERS VALUES (10947, 'ANTON', 2, CONVERT(date, '14/05/98', 3), CONVERT(date, '19/05/98', 3), 340.60);
INSERT INTO ORDERS VALUES (10948, 'ANTON', 5, CONVERT(date, '15/05/98', 3), CONVERT(date, '22/05/98', 3), 470.20);
INSERT INTO ORDERS VALUES (10949, 'ANTON', 4, CONVERT(date, '18/05/98', 3), CONVERT(date, '25/05/98', 3), 134.70);
INSERT INTO ORDERS VALUES (10950, 'ANTON', 2, CONVERT(date, '20/05/98', 3), CONVERT(date, '27/05/98', 3), 287.70);
INSERT INTO ORDERS VALUES (10951, 'ANTON', 6, CONVERT(date, '22/05/98', 3), CONVERT(date, '27/05/98', 3), 217.00);
INSERT INTO ORDERS VALUES (10952, 'ANTON', 1, CONVERT(date, '25/05/98', 3), CONVERT(date, '01/06/98', 3), 401.80);
INSERT INTO ORDERS VALUES (10953, 'ANTON', 7, CONVERT(date, '27/05/98', 3), CONVERT(date, '04/06/98', 3), 320.90);
INSERT INTO ORDERS VALUES (10954, 'ANTON', 4, CONVERT(date, '29/05/98', 3), CONVERT(date, '05/06/98', 3), 411.90);
INSERT INTO ORDERS VALUES (10955, 'ANTON', 6, CONVERT(date, '01/06/98', 3), CONVERT(date, '08/06/98', 3), 232.90);
INSERT INTO ORDERS VALUES (10956, 'ANTON', 7, CONVERT(date, '03/06/98', 3), CONVERT(date, '10/06/98', 3), 414.30);
INSERT INTO ORDERS VALUES (10957, 'ANTON', 1, CONVERT(date, '06/06/98', 3), CONVERT(date, '10/06/98', 3), 239.80);
INSERT INTO ORDERS VALUES (10958, 'ANTON', 5, CONVERT(date, '08/06/98', 3), CONVERT(date, '15/06/98', 3), 474.50);
INSERT INTO ORDERS VALUES (10959, 'ANTON', 6, CONVERT(date, '09/06/98', 3), CONVERT(date, '16/06/98', 3), 413.00);
INSERT INTO ORDERS VALUES (10960, 'ANTON', 4, CONVERT(date, '10/06/98', 3), CONVERT(date, '15/06/98', 3), 158.60);
INSERT INTO ORDERS VALUES (10961, 'ANTON', 2, CONVERT(date, '12/06/98', 3), CONVERT(date, '19/06/98', 3), 191.00);
INSERT INTO ORDERS VALUES (10962, 'ANTON', 7, CONVERT(date, '15/06/98', 3), CONVERT(date, '22/06/98', 3), 313.00);
INSERT INTO ORDERS VALUES (10963, 'ANTON', 5, CONVERT(date, '17/06/98', 3), CONVERT(date, '24/06/98', 3), 458.20);
INSERT INTO ORDERS VALUES (10964, 'ANTON', 3, CONVERT(date, '18/06/98', 3), CONVERT(date, '25/06/98', 3), 282.80);
INSERT INTO ORDERS VALUES (10965, 'ANTON', 4, CONVERT(date, '19/06/98', 3), CONVERT(date, '26/06/98', 3), 287.80);
INSERT INTO ORDERS VALUES (10966, 'ANTON', 4, CONVERT(date, '22/06/98', 3), CONVERT(date, '29/06/98', 3), 171.60);
INSERT INTO ORDERS VALUES (10967, 'ANTON', 2, CONVERT(date, '23/06/98', 3), CONVERT(date, '30/06/98', 3), 317.90);
INSERT INTO ORDERS VALUES (10968, 'ANTON', 7, CONVERT(date, '25/06/98', 3), CONVERT(date, '02/07/98', 3), 249.30);
INSERT INTO ORDERS VALUES (10969, 'ANTON', 6, CONVERT(date, '26/06/98', 3), CONVERT(date, '03/07/98', 3), 484.50);
INSERT INTO ORDERS VALUES (10970, 'ANTON', 5, CONVERT(date, '29/06/98', 3), CONVERT(date, '06/07/98', 3), 431.70);
INSERT INTO ORDERS VALUES (10971, 'ANTON', 7, CONVERT(date, '01/07/98', 3), CONVERT(date, '08/07/98', 3), 581.10);
INSERT INTO ORDERS VALUES (10972, 'ANTON', 1, CONVERT(date, '02/07/98', 3), CONVERT(date, '08/07/98', 3), 207.70);
INSERT INTO ORDERS VALUES (10973, 'ANTON', 2, CONVERT(date, '03/07/98', 3), CONVERT(date, '10/07/98', 3), 203.20);
INSERT INTO ORDERS VALUES (10974, 'ANTON', 5, CONVERT(date, '07/07/98', 3), CONVERT(date, '14/07/98', 3), 378.40);
INSERT INTO ORDERS VALUES (10975, 'ANTON', 1, CONVERT(date, '08/07/98', 3), CONVERT(date, '15/07/98', 3), 178.70);
INSERT INTO ORDERS VALUES (10976, 'ANTON', 4, CONVERT(date, '09/07/98', 3), CONVERT(date, '15/07/98', 3), 401.50);
INSERT INTO ORDERS VALUES (10977, 'ANTON', 7, CONVERT(date, '10/07/98', 3), CONVERT(date, '17/07/98', 3), 506.60);
INSERT INTO ORDERS VALUES (10978, 'ANTON', 4, CONVERT(date, '13/07/98', 3), CONVERT(date, '20/07/98', 3), 309.00);
INSERT INTO ORDERS VALUES (10979, 'ANTON', 6, CONVERT(date, '15/07/98', 3), CONVERT(date, '22/07/98', 3), 332.20);
INSERT INTO ORDERS VALUES (10980, 'ANTON', 7, CONVERT(date, '17/07/98', 3), CONVERT(date, '24/07/98', 3), 455.50);
INSERT INTO ORDERS VALUES (10981, 'ANTON', 2, CONVERT(date, '18/07/98', 3), CONVERT(date, '25/07/98', 3), 334.60);
INSERT INTO ORDERS VALUES (10982, 'ANTON', 1, CONVERT(date, '21/07/98', 3), CONVERT(date, '28/07/98', 3), 291.70);
INSERT INTO ORDERS VALUES (10983, 'ANTON', 5, CONVERT(date, '23/07/98', 3), CONVERT(date, '30/07/98', 3), 232.50);
INSERT INTO ORDERS VALUES (10984, 'ANTON', 2, CONVERT(date, '24/07/98', 3), CONVERT(date, '31/07/98', 3), 278.80);
INSERT INTO ORDERS VALUES (10985, 'ANTON', 6, CONVERT(date, '27/07/98', 3), CONVERT(date, '03/08/98', 3), 354.90);
INSERT INTO ORDERS VALUES (10986, 'ANTON', 7, CONVERT(date, '29/07/98', 3), CONVERT(date, '05/08/98', 3), 485.80);
INSERT INTO ORDERS VALUES (10987, 'ANTON', 4, CONVERT(date, '01/08/98', 3), CONVERT(date, '08/08/98', 3), 264.10);
INSERT INTO ORDERS VALUES (10988, 'ANTON', 6, CONVERT(date, '03/08/98', 3), CONVERT(date, '10/08/98', 3), 467.60);
INSERT INTO ORDERS VALUES (10989, 'ANTON', 5, CONVERT(date, '05/08/98', 3), CONVERT(date, '12/08/98', 3), 218.90);
INSERT INTO ORDERS VALUES (10990, 'ANTON', 1, CONVERT(date, '06/08/98', 3), CONVERT(date, '12/08/98', 3), 340.00);
INSERT INTO ORDERS VALUES (10991, 'ANTON', 5, CONVERT(date, '08/08/98', 3), CONVERT(date, '15/08/98', 3), 273.20);
INSERT INTO ORDERS VALUES (10992, 'ANTON', 6, CONVERT(date, '10/08/98', 3), CONVERT(date, '17/08/98', 3), 406.20);
INSERT INTO ORDERS VALUES (10993, 'ANTON', 5, CONVERT(date, '12/08/98', 3), CONVERT(date, '19/08/98', 3), 341.30);
INSERT INTO ORDERS VALUES (10994, 'ANTON', 1, CONVERT(date, '13/08/98', 3), CONVERT(date, '20/08/98', 3), 249.70);
INSERT INTO ORDERS VALUES (10995, 'ANTON', 7, CONVERT(date, '17/08/98', 3), CONVERT(date, '24/08/98', 3), 346.50);
INSERT INTO ORDERS VALUES (10996, 'ANTON', 1, CONVERT(date, '20/08/98', 3), CONVERT(date, '27/08/98', 3), 207.50);
INSERT INTO ORDERS VALUES (10997, 'ANTON', 4, CONVERT(date, '21/08/98', 3), CONVERT(date, '28/08/98', 3), 196.10);
INSERT INTO ORDERS VALUES (10998, 'ANTON', 7, CONVERT(date, '25/08/98', 3), CONVERT(date, '01/09/98', 3), 239.80);
INSERT INTO ORDERS VALUES (10999, 'ANTON', 6, CONVERT(date, '26/08/98', 3), CONVERT(date, '02/09/98', 3), 335.20);
INSERT INTO ORDERS VALUES (11000, 'ANTON', 2, CONVERT(date, '28/08/98', 3), CONVERT(date, '04/09/98', 3), 283.10);
INSERT INTO ORDERS VALUES (11001, 'ANTON', 5, CONVERT(date, '01/09/98', 3), CONVERT(date, '08/09/98', 3), 307.50);
INSERT INTO ORDERS VALUES (11002, 'ANTON', 5, CONVERT(date, '03/09/98', 3), CONVERT(date, '10/09/98', 3), 183.90);
INSERT INTO ORDERS VALUES (11003, 'ANTON', 5, CONVERT(date, '05/09/98', 3), CONVERT(date, '12/09/98', 3), 266.00);
INSERT INTO ORDERS VALUES (11004, 'ANTON', 1, CONVERT(date, '07/09/98', 3), CONVERT(date, '14/09/98', 3), 358.70);
INSERT INTO ORDERS VALUES (11005, 'ANTON', 1, CONVERT(date, '09/09/98', 3), CONVERT(date, '16/09/98', 3), 159.90);
INSERT INTO ORDERS VALUES (11006, 'ANTON', 5, CONVERT(date, '12/09/98', 3), CONVERT(date, '19/09/98', 3), 429.10);
INSERT INTO ORDERS VALUES (11007, 'ANTON', 6, CONVERT(date, '14/09/98', 3), CONVERT(date, '21/09/98', 3), 262.10);
INSERT INTO ORDERS VALUES (11008, 'ANTON', 5, CONVERT(date, '16/09/98', 3), CONVERT(date, '23/09/98', 3), 233.90);
INSERT INTO ORDERS VALUES (11009, 'ANTON', 1, CONVERT(date, '17/09/98', 3), CONVERT(date, '24/09/98', 3), 347.00);
INSERT INTO ORDERS VALUES (11010, 'ANTON', 2, CONVERT(date, '18/09/98', 3), CONVERT(date, '25/09/98', 3), 281.70);
INSERT INTO ORDERS VALUES (11011, 'ANTON', 1, CONVERT(date, '21/09/98', 3), CONVERT(date, '28/09/98', 3), 295.80);
INSERT INTO ORDERS VALUES (11012, 'ANTON', 6, CONVERT(date, '23/09/98', 3), CONVERT(date, '30/09/98', 3), 381.00);
INSERT INTO ORDERS VALUES (11013, 'ANTON', 7, CONVERT(date, '26/09/98', 3), CONVERT(date, '03/10/98', 3), 533.90);
INSERT INTO ORDERS VALUES (11014, 'ANTON', 1, CONVERT(date, '29/09/98', 3), CONVERT(date, '06/10/98', 3), 253.80);
INSERT INTO ORDERS VALUES (11015, 'ANTON', 5, CONVERT(date, '01/10/98', 3), CONVERT(date, '08/10/98', 3), 273.00);
INSERT INTO ORDERS VALUES (11016, 'ANTON', 1, CONVERT(date, '03/10/98', 3), CONVERT(date, '10/10/98', 3), 163.90);
INSERT INTO ORDERS VALUES (11017, 'ANTON', 5, CONVERT(date, '07/10/98', 3), CONVERT(date, '14/10/98', 3), 307.10);
INSERT INTO ORDERS VALUES (11018, 'ANTON', 2, CONVERT(date, '08/10/98', 3), CONVERT(date, '15/10/98', 3), 333.60);
INSERT INTO ORDERS VALUES (11019, 'ANTON', 5, CONVERT(date, '10/10/98', 3), CONVERT(date, '17/10/98', 3), 239.00);
INSERT INTO ORDERS VALUES (11020, 'ANTON', 2, CONVERT(date, '13/10/98', 3), CONVERT(date, '20/10/98', 3), 211.90);
INSERT INTO ORDERS VALUES (11021, 'ANTON', 7, CONVERT(date, '15/10/98', 3), CONVERT(date, '22/10/98', 3), 349.70);
INSERT INTO ORDERS VALUES (11022, 'ANTON', 5, CONVERT(date, '18/10/98', 3), CONVERT(date, '25/10/98', 3), 375.90);
INSERT INTO ORDERS VALUES (11023, 'ANTON', 6, CONVERT(date, '21/10/98', 3), CONVERT(date, '28/10/98', 3), 326.90);
INSERT INTO ORDERS VALUES (11024, 'ANTON', 2, CONVERT(date, '22/10/98', 3), CONVERT(date, '29/10/98', 3), 252.50);
INSERT INTO ORDERS VALUES (11025, 'ANTON', 4, CONVERT(date, '25/10/98', 3), CONVERT(date, '01/11/98', 3), 186.70);
INSERT INTO ORDERS VALUES (11026, 'ANTON', 6, CONVERT(date, '27/10/98', 3), CONVERT(date, '03/11/98', 3), 225.40);
INSERT INTO ORDERS VALUES (11027, 'ANTON', 1, CONVERT(date, '29/10/98', 3), CONVERT(date, '05/11/98', 3), 303.40);
INSERT INTO ORDERS VALUES (11028, 'ANTON', 7, CONVERT(date, '01/11/98', 3), CONVERT(date, '08/11/98', 3), 507.80);
INSERT INTO ORDERS VALUES (11029, 'ANTON', 2, CONVERT(date, '03/11/98', 3), CONVERT(date, '10/11/98', 3), 357.80);
INSERT INTO ORDERS VALUES (11030, 'ANTON', 5, CONVERT(date, '06/11/98', 3), CONVERT(date, '13/11/98', 3), 327.10);
INSERT INTO ORDERS VALUES (11031, 'ANTON', 6, CONVERT(date, '10/11/98', 3), CONVERT(date, '17/11/98', 3), 342.20);
INSERT INTO ORDERS VALUES (11032, 'ANTON', 5, CONVERT(date, '13/11/98', 3), CONVERT(date, '20/11/98', 3), 439.40);
INSERT INTO ORDERS VALUES (11033, 'ANTON', 2, CONVERT(date, '15/11/98', 3), CONVERT(date, '22/11/98', 3), 252.60);
INSERT INTO ORDERS VALUES (11034, 'ANTON', 6, CONVERT(date, '17/11/98', 3), CONVERT(date, '24/11/98', 3), 403.80);
INSERT INTO ORDERS VALUES (11035, 'ANTON', 1, CONVERT(date, '20/11/98', 3), CONVERT(date, '27/11/98', 3), 237.00);
INSERT INTO ORDERS VALUES (11036, 'ANTON', 2, CONVERT(date, '23/11/98', 3), CONVERT(date, '30/11/98', 3), 244.20);
INSERT INTO ORDERS VALUES (11037, 'ANTON', 5, CONVERT(date, '26/11/98', 3), CONVERT(date, '03/12/98', 3), 453.50);
INSERT INTO ORDERS VALUES (11038, 'ANTON', 7, CONVERT(date, '29/11/98', 3), CONVERT(date, '06/12/98', 3), 229.90);
INSERT INTO ORDERS VALUES (11039, 'ANTON', 6, CONVERT(date, '01/12/98', 3), CONVERT(date, '08/12/98', 3), 371.70);
INSERT INTO ORDERS VALUES (11040, 'ANTON', 2, CONVERT(date, '03/12/98', 3), CONVERT(date, '10/12/98', 3), 346.10);
INSERT INTO ORDERS VALUES (11041, 'ANTON', 1, CONVERT(date, '05/12/98', 3), CONVERT(date, '12/12/98', 3), 310.20);
INSERT INTO ORDERS VALUES (11042, 'ANTON', 4, CONVERT(date, '08/12/98', 3), CONVERT(date, '15/12/98', 3), 306.30);
INSERT INTO ORDERS VALUES (11043, 'ANTON', 7, CONVERT(date, '09/12/98', 3), CONVERT(date, '16/12/98', 3), 252.10);
INSERT INTO ORDERS VALUES (11044, 'ANTON', 5, CONVERT(date, '12/12/98', 3), CONVERT(date, '19/12/98', 3), 284.20);
INSERT INTO ORDERS VALUES (11045, 'ANTON', 6, CONVERT(date, '15/12/98', 3), CONVERT(date, '22/12/98', 3), 320.30);
INSERT INTO ORDERS VALUES (11046, 'ANTON', 2, CONVERT(date, '18/12/98', 3), CONVERT(date, '25/12/98', 3), 373.60);
INSERT INTO ORDERS VALUES (11047, 'ANTON', 7, CONVERT(date, '21/12/98', 3), CONVERT(date, '28/12/98', 3), 476.20);
INSERT INTO ORDERS VALUES (11009, 'GODOS', 2, CONVERT(date, '08/04/98', 3), CONVERT(date, '10/04/98', 3), 295.55);
INSERT INTO ORDERS VALUES (11010, 'REGGC', 2, CONVERT(date, '09/04/98', 3), CONVERT(date, '21/04/98', 3), 143.55);
INSERT INTO ORDERS VALUES (11011, 'ALFKI', 3, CONVERT(date, '09/04/98', 3), CONVERT(date, '13/04/98', 3), 6.05);
INSERT INTO ORDERS VALUES (11012, 'FRANK', 1, CONVERT(date, '09/04/98', 3), CONVERT(date, '17/04/98', 3), 1214.75);
INSERT INTO ORDERS VALUES (11013, 'ROMEY', 2, CONVERT(date, '09/04/98', 3), CONVERT(date, '10/04/98', 3), 164.95);
INSERT INTO ORDERS VALUES (11015, 'SANTG', 2, CONVERT(date, '10/04/98', 3), CONVERT(date, '20/04/98', 3), 23.10);
INSERT INTO ORDERS VALUES (11017, 'ERNSH', 9, CONVERT(date, '13/04/98', 3), CONVERT(date, '20/04/98', 3), 3771.30);
INSERT INTO ORDERS VALUES (11018, 'LONEP', 4, CONVERT(date, '13/04/98', 3), CONVERT(date, '16/04/98', 3), 58.25);
INSERT INTO ORDERS VALUES (11019, 'RANCH', 6, CONVERT(date, '13/04/98', 3), NULL, 15.85);
INSERT INTO ORDERS VALUES (11020, 'OTTIK', 2, CONVERT(date, '14/04/98', 3), CONVERT(date, '16/04/98', 3), 216.50);
INSERT INTO ORDERS VALUES (11021, 'QUICK', 3, CONVERT(date, '14/04/98', 3), CONVERT(date, '21/04/98', 3), 1485.90);
INSERT INTO ORDERS VALUES (11022, 'HANAR', 9, CONVERT(date, '14/04/98', 3), CONVERT(date, '04/05/98', 3), 31.35);
INSERT INTO ORDERS VALUES (11023, 'BSBEV', 1, CONVERT(date, '14/04/98', 3), CONVERT(date, '24/04/98', 3), 619.15);
INSERT INTO ORDERS VALUES (11024, 'EASTC', 4, CONVERT(date, '15/04/98', 3), CONVERT(date, '20/04/98', 3), 371.80);
INSERT INTO ORDERS VALUES (11025, 'WARTH', 6, CONVERT(date, '15/04/98', 3), CONVERT(date, '24/04/98', 3), 145.85);
INSERT INTO ORDERS VALUES (11026, 'FRANS', 4, CONVERT(date, '15/04/98', 3), CONVERT(date, '28/04/98', 3), 235.45);
INSERT INTO ORDERS VALUES (11027, 'BOTTM', 1, CONVERT(date, '16/04/98', 3), CONVERT(date, '20/04/98', 3), 262.60);
INSERT INTO ORDERS VALUES (11028, 'KOENE', 2, CONVERT(date, '16/04/98', 3), CONVERT(date, '22/04/98', 3), 147.95);
INSERT INTO ORDERS VALUES (11029, 'CHOPS', 4, CONVERT(date, '16/04/98', 3), CONVERT(date, '27/04/98', 3), 239.20);
INSERT INTO ORDERS VALUES (11030, 'SAVEA', 7, CONVERT(date, '17/04/98', 3), CONVERT(date, '27/04/98', 3), 4153.75);
INSERT INTO ORDERS VALUES (11031, 'SAVEA', 6, CONVERT(date, '17/04/98', 3), CONVERT(date, '24/04/98', 3), 1136.10);
INSERT INTO ORDERS VALUES (11032, 'WHITC', 2, CONVERT(date, '17/04/98', 3), CONVERT(date, '23/04/98', 3), 3030.95);
INSERT INTO ORDERS VALUES (11033, 'RICSU', 7, CONVERT(date, '17/04/98', 3), CONVERT(date, '23/04/98', 3), 423.70);
INSERT INTO ORDERS VALUES (11034, 'OLDWO', 8, CONVERT(date, '20/04/98', 3), CONVERT(date, '27/04/98', 3), 201.60);
INSERT INTO ORDERS VALUES (11035, 'SUPRD', 2, CONVERT(date, '20/04/98', 3), CONVERT(date, '24/04/98', 3), 0.85);
INSERT INTO ORDERS VALUES (11036, 'DRACD', 8, CONVERT(date, '20/04/98', 3), CONVERT(date, '22/04/98', 3), 747.35);
INSERT INTO ORDERS VALUES (11038, 'SUPRD', 1, CONVERT(date, '21/04/98', 3), CONVERT(date, '30/04/98', 3), 147.95);
INSERT INTO ORDERS VALUES (11040, 'GREAL', 4, CONVERT(date, '22/04/98', 3), NULL, 94.20);
INSERT INTO ORDERS VALUES (11041, 'CHOPS', 3, CONVERT(date, '19/04/98', 3), CONVERT(date, '28/09/98', 3), 241.10);
INSERT INTO ORDERS VALUES (11042, 'COMMI', 2, CONVERT(date, '22/04/98', 3), CONVERT(date, '02/05/98', 3), 149.95);
INSERT INTO ORDERS VALUES (11044, 'WOLZA', 4, CONVERT(date, '23/04/98', 3), CONVERT(date, '01/05/98', 3), 43.60);
INSERT INTO ORDERS VALUES (11045, 'BOTTM', 6, CONVERT(date, '23/05/98', 3), NULL, 352.90);
INSERT INTO ORDERS VALUES (11046, 'WANDK', 8, CONVERT(date, '23/03/98', 3), CONVERT(date, '24/04/98', 3), 358.20);
INSERT INTO ORDERS VALUES (11047, 'EASTC', 7, CONVERT(date, '24/01/98', 3), CONVERT(date, '01/05/98', 3), 233.10);
INSERT INTO ORDERS VALUES (11048, 'BOTTM', 7, CONVERT(date, '24/03/98', 3), CONVERT(date, '30/04/98', 3), 120.60);
INSERT INTO ORDERS VALUES (11049, 'GOURL', 3, CONVERT(date, '24/04/98', 3), CONVERT(date, '04/05/98', 3), 41.70);
INSERT INTO ORDERS VALUES (11050, 'FOLKO', 8, CONVERT(date, '27/04/98', 3), CONVERT(date, '05/05/98', 3), 297.05);
INSERT INTO ORDERS VALUES (11051, 'LAMAI', 7, CONVERT(date, '27/04/98', 3), NULL, 13.95);
INSERT INTO ORDERS VALUES (11052, 'HANAR', 3, CONVERT(date, '27/04/98', 3), CONVERT(date, '01/05/98', 3), 336.30);
INSERT INTO ORDERS VALUES (11053, 'PICCO', 2, CONVERT(date, '27/04/98', 3), CONVERT(date, '29/04/98', 3), 265.25);
INSERT INTO ORDERS VALUES (11054, 'CACTU', 8, CONVERT(date, '28/04/98', 3), NULL, 1.65);
INSERT INTO ORDERS VALUES (11055, 'HILAA', 7, CONVERT(date, '28/04/98', 3), CONVERT(date, '05/05/98', 3), 604.60);
INSERT INTO ORDERS VALUES (11056, 'EASTC', 8, CONVERT(date, '28/04/98', 3), CONVERT(date, '01/05/98', 3), 1394.80);
INSERT INTO ORDERS VALUES (11057, 'NORTS', 3, CONVERT(date, '29/04/98', 3), CONVERT(date, '01/05/98', 3), 20.65);
INSERT INTO ORDERS VALUES (11058, 'BLAUS', 9, CONVERT(date, '29/04/98', 3), NULL, 155.70);
INSERT INTO ORDERS VALUES (11060, 'FRANS', 2, CONVERT(date, '30/04/98', 3), CONVERT(date, '04/05/98', 3), 54.90);
INSERT INTO ORDERS VALUES (11061, 'GREAL', 4, CONVERT(date, '30/04/98', 3), NULL, 70.05);
INSERT INTO ORDERS VALUES (11062, 'REGGC', 4, CONVERT(date, '30/04/98', 3), NULL, 149.65);
INSERT INTO ORDERS VALUES (11063, 'HUNGO', 3, CONVERT(date, '30/04/98', 3), CONVERT(date, '06/05/98', 3), 408.65);
INSERT INTO ORDERS VALUES (11064, 'SAVEA', 1, CONVERT(date, '01/05/98', 3), CONVERT(date, '04/05/98', 3), 150.45);
INSERT INTO ORDERS VALUES (11065, 'LILAS', 8, CONVERT(date, '01/05/98', 3), NULL, 64.55);
INSERT INTO ORDERS VALUES (11066, 'WHITC', 7, CONVERT(date, '01/05/98', 3), CONVERT(date, '04/05/98', 3), 223.60);
INSERT INTO ORDERS VALUES (11067, 'DRACD', 1, CONVERT(date, '04/05/98', 3), CONVERT(date, '06/05/98', 3), 39.90);
INSERT INTO ORDERS VALUES (11068, 'QUEEN', 8, CONVERT(date, '04/05/98', 3), NULL, 408.75);
INSERT INTO ORDERS VALUES (11069, 'TORTU', 1, CONVERT(date, '04/05/98', 3), CONVERT(date, '06/05/98', 3), 78.35);
INSERT INTO ORDERS VALUES (11071, 'LILAS', 1, CONVERT(date, '05/05/98', 3), NULL, 4.65);
INSERT INTO ORDERS VALUES (11072, 'ERNSH', 4, CONVERT(date, '05/05/98', 3), NULL, 1293.20);
INSERT INTO ORDERS VALUES (11073, 'PERIC', 2, CONVERT(date, '05/05/98', 3), NULL, 124.75);
INSERT INTO ORDERS VALUES (11074, 'SIMOB', 7, CONVERT(date, '06/05/98', 3), NULL, 92.20);
INSERT INTO ORDERS VALUES (11075, 'RICSU', 8, CONVERT(date, '06/05/98', 3), NULL, 30.95);
INSERT INTO ORDERS VALUES (11076, 'BONAP', 4, CONVERT(date, '06/05/98', 3), NULL, 191.40);
INSERT INTO ORDERS VALUES (11077, 'RATTC', 1, CONVERT(date, '06/05/98', 3), NULL, 42.65);
INSERT INTO ORDERS VALUES (11078, 'RATTC', 1, CONVERT(date, '07/05/98', 3), NULL, 30.01);

 


/*==============================================================*/


INSERT INTO ORDER_DETAILS  VALUES ( 10248,1, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,2, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,3, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,4, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,5, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,6, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,7, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,8, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,9, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,10, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,11, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,12, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,13, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,14, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,15, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,16, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,17, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,18, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,19, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,20, 49.00,10, .00 );

INSERT INTO ORDER_DETAILS  VALUES ( 10248,21, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,22, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,23, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,24, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,25, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,26, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,27, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,28, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,29, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,30, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,31, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,32, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,33, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,34, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,35, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,36, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,37, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,38, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,39, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,40, 49.00,10, .00 );

INSERT INTO ORDER_DETAILS  VALUES ( 10248,41, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,42, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,43, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,44, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,45, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,46, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,47, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,48, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,49, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,50, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,51, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,52, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,53, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,54, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,55, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,56, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,57, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,58, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,59, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,60, 49.00,10, .00 );

INSERT INTO ORDER_DETAILS  VALUES ( 10248,61, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,62, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,63, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,64, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,65, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,66, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,67, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,68, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,69, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,70, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,71, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,72, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,73, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,74, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,75, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,76, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,77, 49.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,90, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,91, 70.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10248,92, 49.00,10, .00 );



INSERT INTO ORDER_DETAILS  VALUES ( 10249,14, 93.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10249,51, 212.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10250,41, 38.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10250,51, 212.00,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10250,65, 84.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10251,22, 84.00,6, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10251,57, 78.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10251,65, 84.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10252,20, 324.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10252,33, 10.00,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10252,60, 136.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10253,31, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10253,39, 72.00,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10253,49, 80.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10254,24, 18.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10254,55, 96.00,21, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10254,74, 40.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10255,2, 76.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10255,16, 69.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10255,36, 76.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10255,59, 220.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10256,53, 131.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10256,77, 52.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10257,27, 175.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10257,39, 72.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10257,77, 52.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10258,2, 76.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10258,5, 85.00,65, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10258,32, 128.00,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10259,21, 40.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10259,37, 104.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10260,41, 38.50,16, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10260,57, 78.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10260,62, 197.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10260,70, 60.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10261,21, 40.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10261,35, 72.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10262,5, 85.00,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10262,7, 120.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10262,56, 152.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10263,16, 69.50,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10263,24, 18.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10263,30, 103.50,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10263,74, 40.00,36, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10264,2, 76.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10264,41, 38.50,25, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10265,17, 156.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10265,70, 60.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10266,12, 152.00,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10267,40, 73.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10267,59, 220.00,70, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10267,76, 72.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10268,29, 495.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10268,72, 139.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10269,33, 10.00,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10269,72, 139.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10270,36, 76.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10270,43, 184.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10271,33, 10.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10272,20, 324.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10272,31, 50.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10272,72, 139.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10273,10, 124.00,24, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10273,31, 50.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10273,33, 10.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10273,40, 73.50,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10273,76, 72.00,33, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10274,71, 86.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10274,72, 139.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10275,24, 18.00,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10275,59, 220.00,6, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10276,10, 124.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10276,13, 24.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10277,28, 182.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10277,62, 197.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10278,44, 77.50,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10278,59, 220.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10278,63, 175.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10278,73, 60.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10279,17, 156.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10280,24, 18.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10280,55, 96.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10280,75, 31.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10281,19, 36.50,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10281,24, 18.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10281,35, 72.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10282,30, 103.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10282,57, 78.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10283,15, 62.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10283,19, 36.50,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10283,60, 136.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10283,72, 139.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10284,27, 175.50,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10284,44, 77.50,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10284,60, 136.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10284,67, 56.00,5, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10285,1, 72.00,45, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10285,40, 73.50,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10285,53, 131.00,36, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10286,35, 72.00,100, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10286,62, 197.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10287,16, 69.50,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10287,34, 56.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10287,46, 48.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10288,54, 29.50,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10288,68, 50.00,3, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10289,3, 40.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10289,64, 133.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10290,5, 85.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10290,29, 495.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10290,49, 80.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10290,77, 52.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10291,13, 24.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10291,44, 77.50,24, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10291,51, 212.00,2, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10292,20, 324.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10293,18, 250.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10293,24, 18.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10293,63, 175.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10293,75, 31.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10294,1, 72.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10294,17, 156.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10294,43, 184.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10294,60, 136.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10294,75, 31.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10295,56, 152.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10296,11, 84.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10296,16, 69.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10296,69, 144.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10297,39, 72.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10297,72, 139.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10298,2, 76.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10298,36, 76.00,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10298,59, 220.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10298,62, 197.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10299,19, 36.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10299,70, 60.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10300,66, 68.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10300,68, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10301,40, 73.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10301,56, 152.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10302,17, 156.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10302,28, 182.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10302,43, 184.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10303,40, 73.50,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10303,65, 84.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10303,68, 50.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10304,49, 80.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10304,59, 220.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10304,71, 86.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10305,18, 250.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10305,29, 495.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10305,39, 72.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10306,30, 103.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10306,53, 131.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10306,54, 29.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10307,62, 197.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10307,68, 50.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10308,69, 144.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10308,70, 60.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10309,4, 88.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10309,6, 100.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10309,42, 56.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10309,43, 184.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10309,71, 86.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10310,16, 69.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10310,62, 197.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10311,42, 56.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10311,69, 144.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10312,28, 182.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10312,43, 184.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10312,53, 131.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10312,75, 31.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10313,36, 76.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10314,32, 128.00,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10314,58, 53.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10314,62, 197.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10315,34, 56.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10315,70, 60.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10316,41, 38.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10316,62, 197.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10317,1, 72.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10318,41, 38.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10318,76, 72.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10319,17, 156.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10319,28, 182.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10319,76, 72.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10320,71, 86.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10321,35, 72.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10322,52, 28.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10323,15, 62.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10323,25, 56.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10323,39, 72.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10324,16, 69.50,21, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10324,35, 72.00,70, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10324,46, 48.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10324,59, 220.00,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10324,63, 175.50,80, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10325,6, 100.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10325,13, 24.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10325,14, 93.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10325,31, 50.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10325,72, 139.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10326,4, 88.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10326,57, 78.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10326,75, 31.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10327,2, 76.00,25, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10327,11, 84.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10327,30, 103.50,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10327,58, 53.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10328,59, 220.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10328,65, 84.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10328,68, 50.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10329,19, 36.50,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10329,30, 103.50,8, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10329,38, 1054.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10329,56, 152.00,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10330,26, 124.50,50, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10330,72, 139.00,25, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10331,54, 29.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10332,18, 250.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10332,42, 56.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10332,47, 38.00,16, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10333,14, 93.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10333,21, 40.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10333,71, 86.00,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10334,52, 28.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10334,68, 50.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10335,2, 76.00,7, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10335,31, 50.00,25, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10335,32, 128.00,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10335,51, 212.00,48, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10336,4, 88.00,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10337,23, 36.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10337,26, 124.50,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10337,36, 76.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10337,37, 104.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10337,72, 139.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10338,17, 156.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10338,30, 103.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10339,4, 88.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10339,17, 156.00,70, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10339,62, 197.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10340,18, 250.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10340,41, 38.50,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10340,43, 184.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10341,33, 10.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10341,59, 220.00,9, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10342,2, 76.00,24, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10342,31, 50.00,56, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10342,36, 76.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10342,55, 96.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10343,64, 133.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10343,68, 50.00,4, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10343,76, 72.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10344,4, 88.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10344,8, 160.00,70, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10345,8, 160.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10345,19, 36.50,80, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10345,42, 56.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10346,17, 156.00,36, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10346,56, 152.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10347,25, 56.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10347,39, 72.00,50, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10347,40, 73.50,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10347,75, 31.00,6, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10348,1, 72.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10348,23, 36.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10349,54, 29.50,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10350,50, 65.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10350,69, 144.00,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10351,38, 1054.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10351,41, 38.50,13, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10351,44, 77.50,77, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10351,65, 84.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10352,24, 18.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10352,54, 29.50,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10353,11, 84.00,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10353,38, 1054.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10354,1, 72.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10354,29, 495.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10355,24, 18.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10355,57, 78.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10356,31, 50.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10356,55, 96.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10356,69, 144.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10357,10, 124.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10357,26, 124.50,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10357,60, 136.00,8, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10358,24, 18.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10358,34, 56.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10358,36, 76.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10359,16, 69.50,56, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10359,31, 50.00,70, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10359,60, 136.00,80, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10360,28, 182.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10360,29, 495.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10360,38, 1054.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10360,49, 80.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10360,54, 29.50,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10361,39, 72.00,54, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10361,60, 136.00,55, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10362,25, 56.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10362,51, 212.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10362,54, 29.50,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10363,31, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10363,75, 31.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10363,76, 72.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10364,69, 144.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10364,71, 86.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10365,11, 84.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10366,65, 84.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10366,77, 52.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10367,34, 56.00,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10367,54, 29.50,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10367,65, 84.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10367,77, 52.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10368,21, 40.00,5, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10368,28, 182.00,13, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10368,57, 78.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10368,64, 133.00,35, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10369,29, 495.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10369,56, 152.00,18, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10370,1, 72.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10370,64, 133.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10370,74, 40.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10371,36, 76.00,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10372,20, 324.00,12, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10372,38, 1054.00,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10372,60, 136.00,70, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10372,72, 139.00,42, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10373,58, 53.00,80, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10373,71, 86.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10374,31, 50.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10374,58, 53.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10375,14, 93.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10375,54, 29.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10376,31, 50.00,42, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10377,28, 182.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10377,39, 72.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10378,71, 86.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10379,41, 38.50,8, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10379,63, 175.50,16, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10379,65, 84.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10380,30, 103.50,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10380,53, 131.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10380,60, 136.00,6, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10380,70, 60.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10381,74, 40.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10382,5, 85.00,32, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10382,18, 250.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10382,29, 495.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10382,33, 10.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10382,74, 40.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10383,13, 24.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10383,50, 65.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10383,56, 152.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10384,20, 324.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10384,60, 136.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10385,7, 120.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10385,60, 136.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10385,68, 50.00,8, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10386,24, 18.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10386,34, 56.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10387,24, 18.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10387,28, 182.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10387,59, 220.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10387,71, 86.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10388,45, 38.00,15, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10388,52, 28.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10388,53, 131.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10389,10, 124.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10389,55, 96.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10389,62, 197.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10389,70, 60.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10390,31, 50.00,60, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10390,35, 72.00,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10390,46, 48.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10390,72, 139.00,24, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10391,13, 24.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10392,69, 144.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10393,2, 76.00,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10393,14, 93.00,42, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10393,25, 56.00,7, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10393,26, 124.50,70, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10393,31, 50.00,32, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10394,13, 24.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10394,62, 197.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10395,46, 48.00,28, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10395,53, 131.00,70, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10395,69, 144.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10396,23, 36.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10396,71, 86.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10396,72, 139.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10397,21, 40.00,10, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10397,51, 212.00,18, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10398,35, 72.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10398,55, 96.00,120, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10399,68, 50.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10399,71, 86.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10399,76, 72.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10399,77, 52.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10400,29, 495.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10400,35, 72.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10400,49, 80.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10401,30, 103.50,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10401,56, 152.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10401,65, 84.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10401,71, 86.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10402,23, 36.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10402,63, 175.50,65, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10403,16, 69.50,21, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10403,48, 51.00,70, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10404,26, 124.50,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10404,42, 56.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10404,49, 80.00,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10405,3, 40.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10406,1, 72.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10406,21, 40.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10406,28, 182.00,42, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10406,36, 76.00,5, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10406,40, 73.50,2, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10407,11, 84.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10407,69, 144.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10407,71, 86.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10408,37, 104.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10408,54, 29.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10408,62, 197.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10409,14, 93.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10409,21, 40.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10410,33, 10.00,49, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10410,59, 220.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10411,41, 38.50,25, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10411,44, 77.50,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10411,59, 220.00,9, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10412,14, 93.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10413,1, 72.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10413,62, 197.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10413,76, 72.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10414,19, 36.50,18, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10414,33, 10.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10415,17, 156.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10415,33, 10.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10416,19, 36.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10416,53, 131.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10416,57, 78.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10417,38, 1054.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10417,46, 48.00,2, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10417,68, 50.00,36, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10417,77, 52.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10418,2, 76.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10418,47, 38.00,55, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10418,61, 114.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10418,74, 40.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10419,60, 136.00,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10419,69, 144.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10420,9, 388.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10420,13, 24.00,2, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10420,70, 60.00,8, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10420,73, 60.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10421,19, 36.50,4, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10421,26, 124.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10421,53, 131.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10421,77, 52.00,10, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10422,26, 124.50,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10423,31, 50.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10423,59, 220.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10424,35, 72.00,60, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10424,38, 1054.00,49, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10424,68, 50.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10425,55, 96.00,10, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10425,76, 72.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10426,56, 152.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10426,64, 133.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10427,14, 93.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10428,46, 48.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10429,50, 65.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10429,63, 175.50,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10430,17, 156.00,45, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10430,21, 40.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10430,56, 152.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10430,59, 220.00,70, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10431,17, 156.00,50, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10431,40, 73.50,50, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10431,47, 38.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10432,26, 124.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10432,54, 29.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10433,56, 152.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10434,11, 84.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10434,76, 72.00,18, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10435,2, 76.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10435,22, 84.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10435,72, 139.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10436,46, 48.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10436,56, 152.00,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10436,64, 133.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10436,75, 31.00,24, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10437,53, 131.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10438,19, 36.50,15, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10438,34, 56.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10438,57, 78.00,15, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10439,12, 152.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10439,16, 69.50,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10439,64, 133.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10439,74, 40.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10440,2, 76.00,45, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10440,16, 69.50,49, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10440,29, 495.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10440,61, 114.00,90, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10441,27, 175.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10442,11, 84.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10442,54, 29.50,80, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10442,66, 68.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10443,11, 84.00,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10443,28, 182.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10444,17, 156.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10444,26, 124.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10444,35, 72.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10444,41, 38.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10445,39, 72.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10445,54, 29.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10446,19, 36.50,12, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10446,24, 18.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10446,31, 50.00,3, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10446,52, 28.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10447,19, 36.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10447,65, 84.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10447,71, 86.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10448,26, 124.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10448,40, 73.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10449,10, 124.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10449,52, 28.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10449,62, 197.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10450,10, 124.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10450,54, 29.50,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10451,55, 96.00,120, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10451,64, 133.00,35, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10451,65, 84.00,28, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10451,77, 52.00,55, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10452,28, 182.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10452,44, 77.50,100, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10453,48, 51.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10453,70, 60.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10454,16, 69.50,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10454,33, 10.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10454,46, 48.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10455,39, 72.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10455,53, 131.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10455,61, 114.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10455,71, 86.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10456,21, 40.00,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10456,49, 80.00,21, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10457,59, 220.00,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10458,26, 124.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10458,28, 182.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10458,43, 184.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10458,56, 152.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10458,71, 86.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10459,7, 120.00,16, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10459,46, 48.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10459,72, 139.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10460,68, 50.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10460,75, 31.00,4, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10461,21, 40.00,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10461,30, 103.50,28, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10461,55, 96.00,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10462,13, 24.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10462,23, 36.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10463,19, 36.50,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10463,42, 56.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10464,4, 88.00,16, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10464,43, 184.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10464,56, 152.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10464,60, 136.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10465,24, 18.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10465,29, 495.00,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10465,40, 73.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10465,45, 38.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10465,50, 65.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10466,11, 84.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10466,46, 48.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10467,24, 18.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10467,25, 56.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10468,30, 103.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10468,43, 184.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10469,2, 76.00,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10469,16, 69.50,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10469,44, 77.50,2, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10470,18, 250.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10470,23, 36.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10470,64, 133.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10471,7, 120.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10471,56, 152.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10472,24, 18.00,80, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10472,51, 212.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10473,33, 10.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10473,71, 86.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10474,14, 93.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10474,28, 182.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10474,40, 73.50,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10474,75, 31.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10475,31, 50.00,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10475,66, 68.00,60, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10475,76, 72.00,42, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10476,55, 96.00,2, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10476,70, 60.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10477,1, 72.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10477,21, 40.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10477,39, 72.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10478,10, 124.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10479,38, 1054.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10479,53, 131.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10479,59, 220.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10479,64, 133.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10480,47, 38.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10480,59, 220.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10481,49, 80.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10481,60, 136.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10482,40, 73.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10483,34, 56.00,35, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10483,77, 52.00,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10484,21, 40.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10484,40, 73.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10484,51, 212.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10485,2, 76.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10485,3, 40.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10485,55, 96.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10485,70, 60.00,60, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10486,11, 84.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10486,51, 212.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10486,74, 40.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10487,19, 36.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10487,26, 124.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10487,54, 29.50,24, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10488,59, 220.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10488,73, 60.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10489,11, 84.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10489,16, 69.50,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10490,59, 220.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10490,68, 50.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10490,75, 31.00,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10491,44, 77.50,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10491,77, 52.00,7, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10492,25, 56.00,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10492,42, 56.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10493,65, 84.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10493,66, 68.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10493,69, 144.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10494,56, 152.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10495,23, 36.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10495,41, 38.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10495,77, 52.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10496,31, 50.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10497,56, 152.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10497,72, 139.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10497,77, 52.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10498,24, 22.50,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10498,40, 92.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10498,42, 70.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10499,28, 228.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10499,49, 100.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10500,15, 77.50,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10500,28, 228.00,8, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10501,54, 37.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10502,45, 47.50,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10502,53, 164.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10502,67, 70.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10503,14, 116.25,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10503,65, 105.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10504,2, 95.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10504,21, 50.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10504,53, 164.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10504,61, 142.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10505,62, 246.50,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10506,25, 70.00,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10506,70, 75.00,14, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10507,43, 230.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10507,48, 63.75,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10508,13, 30.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10508,39, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10509,28, 228.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10510,29, 618.95,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10510,75, 38.75,36, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10511,4, 110.00,50, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10511,7, 150.00,50, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10511,8, 200.00,10, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10512,24, 22.50,10, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10512,46, 60.00,9, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10512,47, 47.50,6, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10512,60, 170.00,12, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10513,21, 50.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10513,32, 160.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10513,61, 142.50,15, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10514,20, 405.00,39, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10514,28, 228.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10514,56, 190.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10514,65, 105.25,39, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10514,75, 38.75,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10515,9, 485.00,16, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10515,16, 87.25,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10515,27, 219.50,120, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10515,33, 12.50,16, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10515,60, 170.00,84, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10516,18, 312.50,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10516,41, 48.25,80, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10516,42, 70.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10517,52, 35.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10517,59, 275.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10517,70, 75.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10518,24, 22.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10518,38, 1317.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10518,44, 97.25,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10519,10, 155.00,16, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10519,56, 190.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10519,60, 170.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10520,24, 22.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10520,53, 164.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10521,35, 90.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10521,41, 48.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10521,68, 62.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10522,1, 90.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10522,8, 200.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10522,30, 129.45,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10522,40, 92.00,25, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10523,17, 195.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10523,20, 405.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10523,37, 130.00,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10523,41, 48.25,6, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10524,10, 155.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10524,30, 129.45,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10524,43, 230.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10524,54, 37.25,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10525,36, 95.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10525,40, 92.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10526,1, 90.00,8, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10526,13, 30.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10526,56, 190.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10527,4, 110.00,50, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10527,36, 95.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10528,11, 105.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10528,33, 12.50,8, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10528,72, 174.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10529,55, 120.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10529,68, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10529,69, 180.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10530,17, 195.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10530,43, 230.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10530,61, 142.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10530,76, 90.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10531,59, 275.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10532,30, 129.45,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10532,66, 85.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10533,4, 110.00,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10533,72, 174.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10533,73, 75.00,24, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10534,30, 129.45,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10534,40, 92.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10534,54, 37.25,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10535,11, 105.00,50, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10535,40, 92.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10535,57, 97.50,5, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10535,59, 275.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10536,12, 190.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10536,31, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10536,33, 12.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10536,60, 170.00,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10537,31, 62.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10537,51, 265.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10537,58, 66.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10537,72, 174.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10537,73, 75.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10538,70, 75.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10538,72, 174.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10539,13, 30.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10539,21, 50.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10539,33, 12.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10539,49, 100.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10540,3, 50.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10540,26, 156.15,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10540,38, 1317.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10540,68, 62.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10541,24, 22.50,35, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10541,38, 1317.50,4, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10541,65, 105.25,36, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10541,71, 107.50,9, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10542,11, 105.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10542,54, 37.25,24, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10543,12, 190.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10543,23, 45.00,70, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10544,28, 228.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10544,67, 70.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10545,11, 105.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10546,7, 150.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10546,35, 90.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10546,62, 246.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10547,32, 160.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10547,36, 95.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10548,34, 70.00,10, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10548,41, 48.25,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10549,31, 62.50,55, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10549,45, 47.50,100, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10549,51, 265.00,48, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10550,17, 195.00,8, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10550,19, 46.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10550,21, 50.00,6, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10550,61, 142.50,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10551,16, 87.25,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10551,35, 90.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10551,44, 97.25,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10552,69, 180.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10552,75, 38.75,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10553,11, 105.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10553,16, 87.25,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10553,22, 105.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10553,31, 62.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10553,35, 90.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10554,16, 87.25,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10554,23, 45.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10554,62, 246.50,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10554,77, 65.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10555,14, 116.25,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10555,19, 46.00,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10555,24, 22.50,18, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10555,51, 265.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10555,56, 190.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10556,72, 174.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10557,64, 166.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10557,75, 38.75,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10558,47, 47.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10558,51, 265.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10558,52, 35.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10558,53, 164.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10558,73, 75.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10559,41, 48.25,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10559,55, 120.00,18, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10560,30, 129.45,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10560,62, 246.50,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10561,44, 97.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10561,51, 265.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10562,33, 12.50,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10562,62, 246.50,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10563,36, 95.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10563,52, 35.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10564,17, 195.00,16, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10564,31, 62.50,6, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10564,55, 120.00,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10565,24, 22.50,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10565,64, 166.25,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10566,11, 105.00,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10566,18, 312.50,18, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10566,76, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10567,31, 62.50,60, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10567,51, 265.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10567,59, 275.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10568,10, 155.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10569,31, 62.50,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10569,76, 90.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10570,11, 105.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10570,56, 190.00,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10571,14, 116.25,11, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10571,42, 70.00,28, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10572,16, 87.25,12, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10572,32, 160.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10572,40, 92.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10572,75, 38.75,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10573,17, 195.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10573,34, 70.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10573,53, 164.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10574,33, 12.50,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10574,40, 92.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10574,62, 246.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10574,64, 166.25,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10575,59, 275.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10575,63, 219.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10575,72, 174.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10575,76, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10576,1, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10576,31, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10576,44, 97.25,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10577,39, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10577,75, 38.75,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10577,77, 65.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10578,35, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10578,57, 97.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10579,15, 77.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10579,75, 38.75,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10580,14, 116.25,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10580,41, 48.25,9, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10580,65, 105.25,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10581,75, 38.75,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10582,57, 97.50,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10582,76, 90.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10583,29, 618.95,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10583,60, 170.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10583,69, 180.00,10, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10584,31, 62.50,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10585,47, 47.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10586,52, 35.00,4, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10587,26, 156.15,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10587,35, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10587,77, 65.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10588,18, 312.50,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10588,42, 70.00,100, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10589,35, 90.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10590,1, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10590,77, 65.00,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10591,3, 50.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10591,7, 150.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10591,54, 37.25,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10592,15, 77.50,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10592,26, 156.15,5, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10593,20, 405.00,21, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10593,69, 180.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10593,76, 90.00,4, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10594,52, 35.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10594,58, 66.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10595,35, 90.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10595,61, 142.50,120, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10595,69, 180.00,65, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10596,56, 190.00,5, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10596,63, 219.50,24, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10596,75, 38.75,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10597,24, 22.50,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10597,57, 97.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10597,65, 105.25,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10598,27, 219.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10598,71, 107.50,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10599,62, 246.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10600,54, 37.25,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10600,73, 75.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10601,13, 30.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10601,59, 275.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10602,77, 65.00,5, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10603,22, 105.00,48, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10603,49, 100.00,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10604,48, 63.75,6, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10604,76, 90.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10605,16, 87.25,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10605,59, 275.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10605,60, 170.00,70, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10605,71, 107.50,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10606,4, 110.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10606,55, 120.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10606,62, 246.50,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10607,7, 150.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10607,17, 195.00,100, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10607,33, 12.50,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10607,40, 92.00,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10607,72, 174.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10608,56, 190.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10609,1, 90.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10609,10, 155.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10609,21, 50.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10610,36, 95.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10611,1, 90.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10611,2, 95.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10611,60, 170.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10612,10, 155.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10612,36, 95.00,55, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10612,49, 100.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10612,60, 170.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10612,76, 90.00,80, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10613,13, 30.00,8, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10613,75, 38.75,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10614,11, 105.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10614,21, 50.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10614,39, 90.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10615,55, 120.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10616,38, 1317.50,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10616,56, 190.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10616,70, 75.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10616,71, 107.50,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10617,59, 275.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10618,6, 125.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10618,56, 190.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10618,68, 62.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10619,21, 50.00,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10619,22, 105.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10620,24, 22.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10620,52, 35.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10621,19, 46.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10621,23, 45.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10621,70, 75.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10621,71, 107.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10622,2, 95.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10622,68, 62.50,18, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10623,14, 116.25,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10623,19, 46.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10623,21, 50.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10623,24, 22.50,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10623,35, 90.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10624,28, 228.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10624,29, 618.95,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10624,44, 97.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10625,14, 116.25,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10625,42, 70.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10625,60, 170.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10626,53, 164.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10626,60, 170.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10626,71, 107.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10627,62, 246.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10627,73, 75.00,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10628,1, 90.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10629,29, 618.95,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10629,64, 166.25,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10630,55, 120.00,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10630,76, 90.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10631,75, 38.75,8, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10632,2, 95.00,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10632,33, 12.50,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10633,12, 190.00,36, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10633,13, 30.00,13, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10633,26, 156.15,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10633,62, 246.50,80, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10634,7, 150.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10634,18, 312.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10634,51, 265.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10634,75, 38.75,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10635,4, 110.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10635,5, 106.75,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10635,22, 105.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10636,4, 110.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10636,58, 66.25,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10637,11, 105.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10637,50, 81.25,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10637,56, 190.00,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10638,45, 47.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10638,65, 105.25,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10638,72, 174.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10639,18, 312.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10640,69, 180.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10640,70, 75.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10641,2, 95.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10641,40, 92.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10642,21, 50.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10642,61, 142.50,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10643,28, 228.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10643,39, 90.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10643,46, 60.00,2, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10644,18, 312.50,4, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10644,43, 230.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10644,46, 60.00,21, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10645,18, 312.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10645,36, 95.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10646,1, 90.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10646,10, 155.00,18, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10646,71, 107.50,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10646,77, 65.00,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10647,19, 46.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10647,39, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10648,22, 105.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10648,24, 22.50,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10649,28, 228.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10649,72, 174.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10650,30, 129.45,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10650,53, 164.00,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10650,54, 37.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10651,19, 46.00,12, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10651,22, 105.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10652,30, 129.45,2, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10652,42, 70.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10653,16, 87.25,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10653,60, 170.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10654,4, 110.00,12, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10654,39, 90.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10654,54, 37.25,6, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10655,41, 48.25,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10656,14, 116.25,3, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10656,44, 97.25,28, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10656,47, 47.50,6, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10657,15, 77.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10657,41, 48.25,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10657,46, 60.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10657,47, 47.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10657,56, 190.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10657,60, 170.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10658,21, 50.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10658,40, 92.00,70, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10658,60, 170.00,55, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10658,77, 65.00,70, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10659,31, 62.50,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10659,40, 92.00,24, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10659,70, 75.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10660,20, 405.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10661,39, 90.00,3, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10661,58, 66.25,49, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10662,68, 62.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10663,40, 92.00,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10663,42, 70.00,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10663,51, 265.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10664,10, 155.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10664,56, 190.00,12, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10664,65, 105.25,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10665,51, 265.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10665,59, 275.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10665,76, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10666,29, 618.95,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10666,65, 105.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10667,69, 180.00,45, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10667,71, 107.50,14, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10668,31, 62.50,8, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10668,55, 120.00,4, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10668,64, 166.25,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10669,36, 95.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10670,23, 45.00,32, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10670,46, 60.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10670,67, 70.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10670,73, 75.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10670,75, 38.75,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10671,16, 87.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10671,62, 246.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10671,65, 105.25,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10672,38, 1317.50,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10672,71, 107.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10673,16, 87.25,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10673,42, 70.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10673,43, 230.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10674,23, 45.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10675,14, 116.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10675,53, 164.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10675,58, 66.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10676,10, 155.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10676,19, 46.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10676,44, 97.25,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10677,26, 156.15,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10677,33, 12.50,8, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10678,12, 190.00,100, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10678,33, 12.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10678,41, 48.25,120, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10678,54, 37.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10679,59, 275.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10680,16, 87.25,50, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10680,31, 62.50,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10680,42, 70.00,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10681,19, 46.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10681,21, 50.00,12, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10681,64, 166.25,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10682,33, 12.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10682,66, 85.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10682,75, 38.75,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10683,52, 35.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10684,40, 92.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10684,47, 47.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10684,60, 170.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10685,10, 155.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10685,41, 48.25,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10685,47, 47.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10686,17, 195.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10686,26, 156.15,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10687,9, 485.00,50, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10687,29, 618.95,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10687,36, 95.00,6, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10688,10, 155.00,18, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10688,28, 228.00,60, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10688,34, 70.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10689,1, 90.00,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10690,56, 190.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10690,77, 65.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10691,1, 90.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10691,29, 618.95,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10691,43, 230.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10691,44, 97.25,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10691,62, 246.50,48, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10692,63, 219.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10693,9, 485.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10693,54, 37.25,60, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10693,69, 180.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10693,73, 75.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10694,7, 150.00,90, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10694,59, 275.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10694,70, 75.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10695,8, 200.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10695,12, 190.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10695,24, 22.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10696,17, 195.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10696,46, 60.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10697,19, 46.00,7, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10697,35, 90.00,9, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10697,58, 66.25,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10697,70, 75.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10698,11, 105.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10698,17, 195.00,8, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10698,29, 618.95,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10698,65, 105.25,65, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10698,70, 75.00,8, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10699,47, 47.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10700,1, 90.00,5, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10700,34, 70.00,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10700,68, 62.50,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10700,71, 107.50,60, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10701,59, 275.00,42, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10701,71, 107.50,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10701,76, 90.00,35, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10702,3, 50.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10702,76, 90.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10703,2, 95.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10703,59, 275.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10703,73, 75.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10704,4, 110.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10704,24, 22.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10704,48, 63.75,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10705,31, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10705,32, 160.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10706,16, 87.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10706,43, 230.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10706,59, 275.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10707,55, 120.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10707,57, 97.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10707,70, 75.00,28, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10708,5, 106.75,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10708,36, 95.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10709,8, 200.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10709,51, 265.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10709,60, 170.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10710,19, 46.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10710,47, 47.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10711,19, 46.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10711,41, 48.25,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10711,53, 164.00,120, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10712,53, 164.00,3, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10712,56, 190.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10713,10, 155.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10713,26, 156.15,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10713,45, 47.50,110, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10713,46, 60.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10714,2, 95.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10714,17, 195.00,27, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10714,47, 47.50,50, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10714,56, 190.00,18, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10714,58, 66.25,12, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10715,10, 155.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10715,71, 107.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10716,21, 50.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10716,51, 265.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10716,61, 142.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10717,21, 50.00,32, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10717,54, 37.25,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10717,69, 180.00,25, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10718,12, 190.00,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10718,16, 87.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10718,36, 95.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10718,62, 246.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10719,18, 312.50,12, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10719,30, 129.45,3, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10719,54, 37.25,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10720,35, 90.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10720,71, 107.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10721,44, 97.25,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10722,2, 95.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10722,31, 62.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10722,68, 62.50,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10722,75, 38.75,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10723,26, 156.15,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10724,10, 155.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10724,61, 142.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10725,41, 48.25,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10725,52, 35.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10725,55, 120.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10726,4, 110.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10726,11, 105.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10727,17, 195.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10727,56, 190.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10727,59, 275.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10728,30, 129.45,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10728,40, 92.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10728,55, 120.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10728,60, 170.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10729,1, 90.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10729,21, 50.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10729,50, 81.25,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10730,16, 87.25,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10730,31, 62.50,3, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10730,65, 105.25,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10731,21, 50.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10731,51, 265.00,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10732,76, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10733,14, 116.25,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10733,28, 228.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10733,52, 35.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10734,6, 125.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10734,30, 129.45,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10734,76, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10735,61, 142.50,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10735,77, 65.00,2, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10736,65, 105.25,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10736,75, 38.75,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10737,13, 30.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10737,41, 48.25,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10738,16, 87.25,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10739,36, 95.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10739,52, 35.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10740,28, 228.00,5, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10740,35, 90.00,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10740,45, 47.50,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10740,56, 190.00,14, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10741,2, 95.00,15, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10742,3, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10742,60, 170.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10742,72, 174.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10743,46, 60.00,28, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10744,40, 92.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10745,18, 312.50,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10745,44, 97.25,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10745,59, 275.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10745,72, 174.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10746,13, 30.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10746,42, 70.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10746,62, 246.50,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10746,69, 180.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10747,31, 62.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10747,41, 48.25,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10747,63, 219.50,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10747,69, 180.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10748,23, 45.00,44, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10748,40, 92.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10748,56, 190.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10749,56, 190.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10749,59, 275.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10749,76, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10750,14, 116.25,5, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10750,45, 47.50,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10750,59, 275.00,25, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10751,26, 156.15,12, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10751,30, 129.45,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10751,50, 81.25,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10751,73, 75.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10752,1, 90.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10752,69, 180.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10753,45, 47.50,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10753,74, 50.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10754,40, 92.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10755,47, 47.50,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10755,56, 190.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10755,57, 97.50,14, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10755,69, 180.00,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10756,18, 312.50,21, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10756,36, 95.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10756,68, 62.50,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10756,69, 180.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10757,34, 70.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10757,59, 275.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10757,62, 246.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10757,64, 166.25,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10758,26, 156.15,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10758,52, 35.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10758,70, 75.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10759,32, 160.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10760,25, 70.00,12, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10760,27, 219.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10760,43, 230.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10761,25, 70.00,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10761,75, 38.75,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10762,39, 90.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10762,47, 47.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10762,51, 265.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10762,56, 190.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10763,21, 50.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10763,22, 105.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10763,24, 22.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10764,3, 50.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10764,39, 90.00,130, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10765,65, 105.25,80, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10766,2, 95.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10766,7, 150.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10766,68, 62.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10767,42, 70.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10768,22, 105.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10768,31, 62.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10768,60, 170.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10768,71, 107.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10769,41, 48.25,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10769,52, 35.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10769,61, 142.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10769,62, 246.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10770,11, 105.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10771,71, 107.50,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10772,29, 618.95,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10772,59, 275.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10773,17, 195.00,33, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10773,31, 62.50,70, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10773,75, 38.75,7, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10774,31, 62.50,2, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10774,66, 85.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10775,10, 155.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10775,67, 70.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10776,31, 62.50,16, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10776,42, 70.00,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10776,45, 47.50,27, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10776,51, 265.00,120, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10777,42, 70.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10778,41, 48.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10779,16, 87.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10779,62, 246.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10780,70, 75.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10780,77, 65.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10781,54, 37.25,3, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10781,56, 190.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10781,74, 50.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10782,31, 62.50,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10783,31, 62.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10783,38, 1317.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10784,36, 95.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10784,39, 90.00,2, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10784,72, 174.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10785,10, 155.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10785,75, 38.75,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10786,8, 200.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10786,30, 129.45,15, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10786,75, 38.75,42, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10787,2, 95.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10787,29, 618.95,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10788,19, 46.00,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10788,75, 38.75,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10789,18, 312.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10789,35, 90.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10789,63, 219.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10789,68, 62.50,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10790,7, 150.00,3, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10790,56, 190.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10791,29, 618.95,14, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10791,41, 48.25,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10792,2, 95.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10792,54, 37.25,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10792,68, 62.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10793,41, 48.25,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10793,52, 35.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10794,14, 116.25,15, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10794,54, 37.25,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10795,16, 87.25,65, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10795,17, 195.00,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10796,26, 156.15,21, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10796,44, 97.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10796,64, 166.25,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10796,69, 180.00,24, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10797,11, 105.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10798,62, 246.50,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10798,72, 174.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10799,13, 30.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10799,24, 22.50,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10799,59, 275.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10800,11, 105.00,50, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10800,51, 265.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10800,54, 37.25,7, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10801,17, 195.00,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10801,29, 618.95,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10802,30, 129.45,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10802,51, 265.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10802,55, 120.00,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10802,62, 246.50,5, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10803,19, 46.00,24, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10803,25, 70.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10803,59, 275.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10804,10, 155.00,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10804,28, 228.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10804,49, 100.00,4, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10805,34, 70.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10805,38, 1317.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10806,2, 95.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10806,65, 105.25,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10806,74, 50.00,15, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10807,40, 92.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10808,56, 190.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10808,76, 90.00,50, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10809,52, 35.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10810,13, 30.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10810,25, 70.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10810,70, 75.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10811,19, 46.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10811,23, 45.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10811,40, 92.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10812,31, 62.50,16, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10812,72, 174.00,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10812,77, 65.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10813,2, 95.00,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10813,46, 60.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10814,41, 48.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10814,43, 230.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10814,48, 63.75,8, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10814,61, 142.50,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10815,33, 12.50,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10816,38, 1317.50,30, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10816,62, 246.50,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10817,26, 156.15,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10817,38, 1317.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10817,40, 92.00,60, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10817,62, 246.50,25, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10818,32, 160.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10818,41, 48.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10819,43, 230.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10819,75, 38.75,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10820,56, 190.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10821,35, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10821,51, 265.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10822,62, 246.50,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10822,70, 75.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10823,11, 105.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10823,57, 97.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10823,59, 275.00,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10823,77, 65.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10824,41, 48.25,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10824,70, 75.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10825,26, 156.15,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10825,53, 164.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10826,31, 62.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10826,57, 97.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10827,10, 155.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10827,39, 90.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10828,20, 405.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10828,38, 1317.50,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10829,2, 95.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10829,8, 200.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10829,13, 30.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10829,60, 170.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10830,6, 125.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10830,39, 90.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10830,60, 170.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10830,68, 62.50,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10831,19, 46.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10831,35, 90.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10831,38, 1317.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10831,43, 230.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10832,13, 30.00,3, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10832,25, 70.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10832,44, 97.25,16, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10832,64, 166.25,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10833,7, 150.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10833,31, 62.50,9, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10833,53, 164.00,9, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10834,29, 618.95,8, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10834,30, 129.45,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10835,59, 275.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10835,77, 65.00,2, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10836,22, 105.00,52, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10836,35, 90.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10836,57, 97.50,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10836,60, 170.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10836,64, 166.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10837,13, 30.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10837,40, 92.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10837,47, 47.50,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10837,76, 90.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10838,1, 90.00,4, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10838,18, 312.50,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10838,36, 95.00,50, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10839,58, 66.25,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10839,72, 174.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10840,25, 70.00,6, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10840,39, 90.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10841,10, 155.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10841,56, 190.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10841,59, 275.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10841,77, 65.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10842,11, 105.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10842,43, 230.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10842,68, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10842,70, 75.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10843,51, 265.00,4, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10844,22, 105.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10845,23, 45.00,70, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10845,35, 90.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10845,42, 70.00,42, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10845,58, 66.25,60, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10845,64, 166.25,48, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10846,4, 110.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10846,70, 75.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10846,74, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10847,1, 90.00,80, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10847,19, 46.00,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10847,37, 130.00,60, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10847,45, 47.50,36, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10847,60, 170.00,45, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10847,71, 107.50,55, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10848,5, 106.75,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10848,9, 485.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10849,3, 50.00,49, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10849,26, 156.15,18, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10850,25, 70.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10850,33, 12.50,4, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10850,70, 75.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10851,2, 95.00,5, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10851,25, 70.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10851,57, 97.50,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10851,59, 275.00,42, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10852,2, 95.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10852,17, 195.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10852,62, 246.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10853,18, 312.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10854,10, 155.00,100, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10854,13, 30.00,65, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10855,16, 87.25,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10855,31, 62.50,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10855,56, 190.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10855,65, 105.25,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10856,2, 95.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10856,42, 70.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10857,3, 50.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10857,26, 156.15,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10857,29, 618.95,10, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10858,7, 150.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10858,27, 219.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10858,70, 75.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10859,24, 22.50,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10859,54, 37.25,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10859,64, 166.25,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10860,51, 265.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10860,76, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10861,17, 195.00,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10861,18, 312.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10861,21, 50.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10861,33, 12.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10861,62, 246.50,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10862,11, 105.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10862,52, 35.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10863,1, 90.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10863,58, 66.25,12, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10864,35, 90.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10864,67, 70.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10865,38, 1317.50,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10865,39, 90.00,80, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10866,2, 95.00,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10866,24, 22.50,6, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10866,30, 129.45,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10867,53, 164.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10868,26, 156.15,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10868,35, 90.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10868,49, 100.00,42, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10869,1, 90.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10869,11, 105.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10869,23, 45.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10869,68, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10870,35, 90.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10870,51, 265.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10871,6, 125.00,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10871,16, 87.25,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10871,17, 195.00,16, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10872,55, 120.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10872,62, 246.50,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10872,64, 166.25,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10872,65, 105.25,21, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10873,21, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10873,28, 228.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10874,10, 155.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10875,19, 46.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10875,47, 47.50,21, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10875,49, 100.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10876,46, 60.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10876,64, 166.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10877,16, 87.25,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10877,18, 312.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10878,20, 405.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10879,40, 92.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10879,65, 105.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10879,76, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10880,23, 45.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10880,61, 142.50,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10880,70, 75.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10881,73, 75.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10882,42, 70.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10882,49, 100.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10882,54, 37.25,32, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10883,24, 22.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10884,21, 50.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10884,56, 190.00,21, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10884,65, 105.25,12, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10885,2, 95.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10885,24, 22.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10885,70, 75.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10885,77, 65.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10886,10, 155.00,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10886,31, 62.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10886,77, 65.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10887,25, 70.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10888,2, 95.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10888,68, 62.50,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10889,11, 105.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10889,38, 1317.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10890,17, 195.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10890,34, 70.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10890,41, 48.25,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10891,30, 129.45,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10892,59, 275.00,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10893,8, 200.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10893,24, 22.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10893,29, 618.95,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10893,30, 129.45,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10893,36, 95.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10894,13, 30.00,28, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10894,69, 180.00,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10894,75, 38.75,120, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10895,24, 22.50,110, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10895,39, 90.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10895,40, 92.00,91, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10895,60, 170.00,100, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10896,45, 47.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10896,56, 190.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10897,29, 618.95,80, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10897,30, 129.45,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10898,13, 30.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10899,39, 90.00,8, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10900,70, 75.00,3, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10901,41, 48.25,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10901,71, 107.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10902,55, 120.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10902,62, 246.50,6, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10903,13, 30.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10903,65, 105.25,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10903,68, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10904,58, 66.25,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10904,62, 246.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10905,1, 90.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10906,61, 142.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10907,75, 38.75,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10908,7, 150.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10908,52, 35.00,14, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10909,7, 150.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10909,16, 87.25,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10909,41, 48.25,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10910,19, 46.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10910,49, 100.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10910,61, 142.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10911,1, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10911,17, 195.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10911,67, 70.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10912,11, 105.00,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10912,29, 618.95,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10913,4, 110.00,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10913,33, 12.50,40, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10913,58, 66.25,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10914,71, 107.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10915,17, 195.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10915,33, 12.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10915,54, 37.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10916,16, 87.25,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10916,32, 160.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10916,57, 97.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10917,30, 129.45,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10917,60, 170.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10918,1, 90.00,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10918,60, 170.00,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10919,16, 87.25,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10919,25, 70.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10919,40, 92.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10920,50, 81.25,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10921,35, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10921,63, 219.50,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10922,17, 195.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10922,24, 22.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10923,42, 70.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10923,43, 230.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10923,67, 70.00,24, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10924,10, 155.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10924,28, 228.00,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10924,75, 38.75,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10925,36, 95.00,25, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10925,52, 35.00,12, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10926,11, 105.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10926,13, 30.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10926,19, 46.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10926,72, 174.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10927,20, 405.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10927,52, 35.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10927,76, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10928,47, 47.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10928,76, 90.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10929,21, 50.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10929,75, 38.75,49, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10929,77, 65.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10930,21, 50.00,36, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10930,27, 219.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10930,55, 120.00,25, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10930,58, 66.25,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10931,13, 30.00,42, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10931,57, 97.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10932,16, 87.25,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10932,62, 246.50,14, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10932,72, 174.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10932,75, 38.75,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10933,53, 164.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10933,61, 142.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10934,6, 125.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10935,1, 90.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10935,18, 312.50,4, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10935,23, 45.00,8, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10936,36, 95.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10937,28, 228.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10937,34, 70.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10938,13, 30.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10938,43, 230.00,24, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10938,60, 170.00,49, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10938,71, 107.50,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10939,2, 95.00,10, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10939,67, 70.00,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10940,7, 150.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10940,13, 30.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10941,31, 62.50,44, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10941,62, 246.50,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10941,68, 62.50,80, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10941,72, 174.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10942,49, 100.00,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10943,13, 30.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10943,22, 105.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10943,46, 60.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10944,11, 105.00,5, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10944,44, 97.25,18, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10944,56, 190.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10945,13, 30.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10945,31, 62.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10946,10, 155.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10946,24, 22.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10946,77, 65.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10947,59, 275.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10948,50, 81.25,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10948,51, 265.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10948,55, 120.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10949,6, 125.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10949,10, 155.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10949,17, 195.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10949,62, 246.50,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10950,4, 110.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10951,33, 12.50,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10951,41, 48.25,6, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10951,75, 38.75,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10952,6, 125.00,16, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10952,28, 228.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10953,20, 405.00,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10953,31, 62.50,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10954,16, 87.25,28, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10954,31, 62.50,25, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10954,45, 47.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10954,60, 170.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10955,75, 38.75,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10956,21, 50.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10956,47, 47.50,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10956,51, 265.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10957,30, 129.45,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10957,35, 90.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10957,64, 166.25,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10958,5, 106.75,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10958,7, 150.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10958,72, 174.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10959,75, 38.75,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10960,24, 22.50,10, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10960,41, 48.25,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10961,52, 35.00,6, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10961,76, 90.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10962,7, 150.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10962,13, 30.00,77, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10962,53, 164.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10962,69, 180.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10962,76, 90.00,44, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10963,60, 170.00,2, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10964,18, 312.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10964,38, 1317.50,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10964,69, 180.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10965,51, 265.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10966,37, 130.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10966,56, 190.00,12, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10966,62, 246.50,12, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10967,19, 46.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10967,49, 100.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10968,12, 190.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10968,24, 22.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10968,64, 166.25,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10969,46, 60.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10970,52, 35.00,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10971,29, 618.95,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10972,17, 195.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10972,33, 12.50,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10973,26, 156.15,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10973,41, 48.25,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10973,75, 38.75,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10974,63, 219.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10975,8, 200.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10975,75, 38.75,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10976,28, 228.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10977,39, 90.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10977,47, 47.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10977,51, 265.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10977,63, 219.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10978,8, 200.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10978,21, 50.00,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10978,40, 92.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10978,44, 97.25,6, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10979,7, 150.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10979,12, 190.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10979,24, 22.50,80, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10979,27, 219.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10979,31, 62.50,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10979,63, 219.50,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10980,75, 38.75,40, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10981,38, 1317.50,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10982,7, 150.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10982,43, 230.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10983,13, 30.00,84, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10983,57, 97.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10984,16, 87.25,55, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10984,24, 22.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10984,36, 95.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10985,16, 87.25,36, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10985,18, 312.50,8, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10985,32, 160.00,35, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10986,11, 105.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10986,20, 405.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10986,76, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10986,77, 65.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10987,7, 150.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10987,43, 230.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10987,72, 174.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10988,7, 150.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10988,62, 246.50,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 10989,6, 125.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10989,11, 105.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10989,41, 48.25,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10990,21, 50.00,65, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10990,34, 70.00,60, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10990,55, 120.00,65, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10990,61, 142.50,66, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 10991,2, 95.00,50, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10991,70, 75.00,20, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10991,76, 90.00,90, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 10992,72, 174.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10993,29, 618.95,50, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10993,41, 48.25,35, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10994,59, 275.00,18, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10995,51, 265.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10995,60, 170.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10996,42, 70.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10997,32, 160.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10997,46, 60.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10997,52, 35.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 10998,24, 22.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10998,61, 142.50,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10998,74, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10998,75, 38.75,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 10999,41, 48.25,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10999,51, 265.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 10999,77, 65.00,21, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11000,4, 110.00,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11000,24, 22.50,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11000,77, 65.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11001,7, 150.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11001,22, 105.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11001,46, 60.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11001,55, 120.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11002,13, 30.00,56, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11002,35, 90.00,15, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11002,42, 70.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11002,55, 120.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11003,1, 90.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11003,40, 92.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11003,52, 35.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11004,26, 156.15,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11004,76, 90.00,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11005,1, 90.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11005,59, 275.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11006,1, 90.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11006,29, 618.95,2, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11007,8, 200.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11007,29, 618.95,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11007,42, 70.00,14, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11008,28, 228.00,70, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11008,34, 70.00,90, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11008,71, 107.50,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11009,24, 22.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11009,36, 95.00,18, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11009,60, 170.00,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11010,7, 150.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11010,24, 22.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11011,58, 66.25,40, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11011,71, 107.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11012,19, 46.00,50, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11012,60, 170.00,36, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11012,71, 107.50,60, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11013,23, 45.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11013,42, 70.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11013,45, 47.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11013,68, 62.50,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11014,41, 48.25,28, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11015,30, 129.45,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11015,77, 65.00,18, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11016,31, 62.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11016,36, 95.00,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11017,3, 50.00,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11017,59, 275.00,110, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11017,70, 75.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11018,12, 190.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11018,18, 312.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11018,56, 190.00,5, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11019,46, 60.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11019,49, 100.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11020,10, 155.00,24, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11021,2, 95.00,11, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11021,20, 405.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11021,26, 156.15,63, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11021,51, 265.00,44, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11021,72, 174.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11022,19, 46.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11022,69, 180.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11023,7, 150.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11023,43, 230.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11024,26, 156.15,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11024,33, 12.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11024,65, 105.25,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11024,71, 107.50,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11025,1, 90.00,10, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11025,13, 30.00,20, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11026,18, 312.50,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11026,51, 265.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11027,24, 22.50,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11027,62, 246.50,21, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11028,55, 120.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11028,59, 275.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11029,56, 190.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11029,63, 219.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11030,2, 95.00,100, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11030,5, 106.75,70, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11030,29, 618.95,60, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11030,59, 275.00,100, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11031,1, 90.00,45, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11031,13, 30.00,80, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11031,24, 22.50,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11031,64, 166.25,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11031,71, 107.50,16, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11032,36, 95.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11032,38, 1317.50,25, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11032,59, 275.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11033,53, 164.00,70, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11033,69, 180.00,36, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11034,21, 50.00,15, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11034,44, 97.25,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11034,61, 142.50,6, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11035,1, 90.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11035,35, 90.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11035,42, 70.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11035,54, 37.25,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11036,13, 30.00,7, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11036,59, 275.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11037,70, 75.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11038,40, 92.00,5, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11038,52, 35.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11038,71, 107.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11039,28, 228.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11039,35, 90.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11039,49, 100.00,60, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11039,57, 97.50,28, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11040,21, 50.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11041,2, 95.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11041,63, 219.50,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11042,44, 97.25,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11042,61, 142.50,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11043,11, 105.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11044,62, 246.50,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11045,33, 12.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11045,51, 265.00,24, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11046,12, 190.00,20, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11046,32, 160.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11046,35, 90.00,18, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11047,1, 90.00,25, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11047,5, 106.75,30, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11048,68, 62.50,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11049,2, 95.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11049,12, 190.00,4, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11050,76, 90.00,50, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11051,24, 22.50,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11052,43, 230.00,30, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11052,61, 142.50,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11053,18, 312.50,35, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11053,32, 160.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11053,64, 166.25,25, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11054,33, 12.50,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11054,67, 70.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11055,24, 22.50,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11055,25, 70.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11055,51, 265.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11055,57, 97.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11056,7, 150.00,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11056,55, 120.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11056,60, 170.00,50, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11057,70, 75.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11058,21, 50.00,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11058,60, 170.00,21, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11058,61, 142.50,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11059,13, 30.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11059,17, 195.00,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11059,60, 170.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11060,60, 170.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11060,77, 65.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11061,60, 170.00,15, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11062,53, 164.00,10, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11062,70, 75.00,12, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11063,34, 70.00,30, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11063,40, 92.00,40, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11063,41, 48.25,30, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11064,17, 195.00,77, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11064,41, 48.25,12, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11064,53, 164.00,25, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11064,55, 120.00,4, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11064,68, 62.50,55, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11065,30, 129.45,4, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11065,54, 37.25,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11066,16, 87.25,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11066,19, 46.00,42, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11066,34, 70.00,35, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11067,41, 48.25,9, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11068,28, 228.00,8, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11068,43, 230.00,36, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11068,77, 65.00,28, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11069,39, 90.00,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11070,1, 90.00,40, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11070,2, 95.00,20, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11070,16, 87.25,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11070,31, 62.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11071,7, 150.00,15, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11071,13, 30.00,10, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11072,2, 95.00,8, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11072,41, 48.25,40, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11072,50, 81.25,22, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11072,64, 166.25,130, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11073,11, 105.00,10, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11073,24, 22.50,20, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11074,16, 87.25,14, .05 );

INSERT INTO ORDER_DETAILS  VALUES ( 11075,2, 95.00,10, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11075,46, 60.00,30, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11075,76, 90.00,2, .15 );
INSERT INTO ORDER_DETAILS  VALUES ( 11075,90, 675,2, .15 );

INSERT INTO ORDER_DETAILS  VALUES ( 11076,6, 125.00,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11076,14, 116.25,20, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11076,19, 46.00,10, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11076,90, 645,10, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11076,91, 700,10, .25 );
INSERT INTO ORDER_DETAILS  VALUES ( 11076,92, 705,10, .25 );

INSERT INTO ORDER_DETAILS  VALUES ( 11077,2, 95.00,24, .20 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,3, 50.00,4, .00 );

INSERT INTO ORDER_DETAILS  VALUES ( 11077,4, 110.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,6, 125.00,1, .02 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,7, 150.00,1, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,8, 200.00,2, .10 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,10, 155.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,12, 190.00,2, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,13, 30.00,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,14, 116.25,1, .03 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,16, 87.25,2, .03 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,20, 405.00,1, .04 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,23, 45.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,32, 160.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,39, 90.00,2, .05 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,41, 48.25,3, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,46, 60.00,3, .02 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,52, 35.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,55, 120.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,60, 170.00,2, .06 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,64, 166.25,2, .03 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,66, 85.00,1, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,73, 75.00,2, .01 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,75, 38.75,4, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,77, 65.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11077,90, 644,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11078,91, 652.00,2, .00 );
INSERT INTO ORDER_DETAILS  VALUES ( 11078,92, 654.00,2, .00 ); 
/*==============================================================*/

update PRODUCTS  set UNITS_IN_STOCK = NULL
where UNAVAILABLE = -1;
 

update PRODUCTS  set UNITS_ON_ORDER = NULL
where UNITS_ON_ORDER = 0;


update ORDERS set EMPLOYEE_NUMBER=7
where EMPLOYEE_NUMBER=2;


update ORDERS  set EMPLOYEE_NUMBER=3
where EMPLOYEE_NUMBER =5;

update ORDERS set EMPLOYEE_NUMBER=1
where EMPLOYEE_NUMBER=8;

update PRODUCTS set SUPPLIER_NUMBER= 1 
where PRODUCT_REF in ( select PRODUCT_REF
from PRODUCTS 
where CATEGORY_CODE in (select CATEGORY_CODE
                        from CATEGORIES 
                        where upper(CATEGORY_NAME)='BOISSONS'));


ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_CUSTOMERS 
FOREIGN KEY (CUSTOMER_CODE) REFERENCES CUSTOMERS (CUSTOMER_CODE);

ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_EMPLOYEES  
FOREIGN KEY (EMPLOYEE_NUMBER) REFERENCES EMPLOYEES (EMPLOYEE_NUMBER);

-- Adding foreign key constraint to ORDER_DETAILS table referencing ORDERS table
ALTER TABLE ORDER_DETAILS 
ADD CONSTRAINT FK_ORDER_DETAILS_ORDERS 
FOREIGN KEY (ORDER_NUMBER) 
REFERENCES ORDERS (ORDER_NUMBER);

-- Adding foreign key constraint to ORDER_DETAILS table referencing PRODUCTS table
ALTER TABLE ORDER_DETAILS 
ADD CONSTRAINT FK_ORDER_DETAILS_PRODUCTS 
FOREIGN KEY (PRODUCT_REF) 
REFERENCES PRODUCTS (PRODUCT_REF);

-- Adding foreign key constraint to EMPLOYEES table referencing EMPLOYEES table
ALTER TABLE EMPLOYEES 
ADD CONSTRAINT FK_EMPLOYEES_EMPLOYEES 
FOREIGN KEY (REPORTS_TO) 
REFERENCES EMPLOYEES (EMPLOYEE_NUMBER);  -- Ensure the referenced table name is correct

-- Adding foreign key constraint to PRODUCTS table referencing CATEGORIES table
ALTER TABLE PRODUCTS 
ADD CONSTRAINT FK_PRODUCTS_CATEGORIES 
FOREIGN KEY (CATEGORY_CODE) 
REFERENCES CATEGORIES (CATEGORY_CODE);

-- Check for products in ORDER_DETAILS that do not exist in PRODUCTS
SELECT DISTINCT PRODUCT_REF
FROM ORDER_DETAILS
WHERE PRODUCT_REF NOT IN (SELECT PRODUCT_REF FROM PRODUCTS);
SELECT * FROM PRODUCTS;

ALTER TABLE PRODUCTS 
ADD CONSTRAINT FK_PRODUCTS_SUPPLIERS  
FOREIGN KEY (SUPPLIER_NUMBER) 
REFERENCES SUPPLIERS (SUPPLIER_NUMBER);


--Q3Display in descending order of seniority the male employees whose net salary (salary + commission) is greater than or equal to 8000. The resulting table should include the following columns: Employee Number, First Name and Last Name (using LPAD or RPAD for formatting), Age, and Seniority.


SELECT 
    EMPLOYEE_NUMBER,
    RIGHT('                              ' + FIRST_NAME, 30) AS FIRST_NAME,  
    RIGHT('                              ' + LAST_NAME, 40) AS LAST_NAME,   
    DATEDIFF(YEAR, BIRTH_DATE, GETDATE()) AS AGE,
    DATEDIFF(YEAR, HIRE_DATE, GETDATE()) AS SENIORITY
FROM 
    EMPLOYEES
WHERE 
    (SALARY + COALESCE(COMMISSION, 0)) >= 8000
ORDER BY 
    SENIORITY DESC;


	--Q4Display products that meet the following criteria: (C1) quantity is packaged in bottle(s), (C2) the third character in the product name is 't' or 'T', (C3) supplied by suppliers 1, 2, or 3, (C4) unit price ranges between 70 and 200, and (C5) units ordered are specified (not null). The resulting table should include the following columns: product number, product name, supplier number, units ordered, and unit price.

SELECT 
    PRODUCT_REF,
    PRODUCT_NAME,
    SUPPLIER_NUMBER,
    UNITS_ON_ORDER AS UNITS_ORDERED,  -- Renaming column for clarity
    UNIT_PRICE
FROM 
    PRODUCTS
WHERE 
    QUANTITY LIKE '%bottle%'  -- Checks if quantity is packaged in bottles
    AND SUBSTRING(PRODUCT_NAME, 3, 1) IN ('t', 'T')  -- Checks if the third character in the product name is 't' or 'T'
    AND SUPPLIER_NUMBER IN (1, 2, 3)  -- Filters by specific suppliers
    AND UNIT_PRICE BETWEEN 70 AND 200  -- Filters unit price range
    AND UNITS_ON_ORDER IS NOT NULL; 

	--Q5 Display customers who reside in the same region as supplier 1, meaning they share the same country, city, and the last three digits of the postal code. The query should utilize a single subquery. The resulting table should include all columns from the customer table.

	SELECT *
FROM CUSTOMERS
WHERE 
    COUNTRY = (SELECT COUNTRY 
               FROM SUPPLIERS 
               WHERE SUPPLIER_NUMBER = 1)
    AND CITY = (SELECT CITY 
                FROM SUPPLIERS 
                WHERE SUPPLIER_NUMBER = 1)
    AND RIGHT(POSTAL_CODE, 3) = (SELECT RIGHT(POSTAL_CODE, 3) 
                                 FROM SUPPLIERS 
                                 WHERE SUPPLIER_NUMBER = 1);

--Q6 For each order number between 10998 and 11003, do the following:  
--Display the new discount rate, which should be 0% if the total order amount before discount (unit price * quantity) is between 0 and 2000, 5% if between 2001 and 10000, 10% if between 10001 and 40000, 15% if between 40001 and 80000, and 20% otherwise.
--Display the message "apply old discount rate" if the order number is between 10000 and 10999, and "apply new discount rate" otherwise. The resulting table should display the columns: order number, new discount rate, and discount rate application note.

-- Create a temporary table to calculate total amount before discount for each order number
WITH OrderTotals AS (
    SELECT 
        ORDER_NUMBER,
        SUM(UNIT_PRICE * QUANTITY) AS TotalAmount
    FROM 
        ORDER_DETAILS
    WHERE
        ORDER_NUMBER BETWEEN 10998 AND 11003
    GROUP BY 
        ORDER_NUMBER
),

-- Calculate the new discount rate based on the total amount
DiscountRates AS (
    SELECT
        ORDER_NUMBER,
        CASE
            WHEN TotalAmount BETWEEN 0 AND 2000 THEN 0.00
            WHEN TotalAmount BETWEEN 2001 AND 10000 THEN 0.05
            WHEN TotalAmount BETWEEN 10001 AND 40000 THEN 0.10
            WHEN TotalAmount BETWEEN 40001 AND 80000 THEN 0.15
            ELSE 0.20
        END AS NewDiscountRate
    FROM
        OrderTotals
),

-- Determine the discount rate application note
DiscountApplication AS (
    SELECT
        ORDER_NUMBER,
        NewDiscountRate,
        CASE
            WHEN ORDER_NUMBER BETWEEN 10000 AND 10999 THEN 'apply old discount rate'
            ELSE 'apply new discount rate'
        END AS DiscountRateApplicationNote
    FROM
        DiscountRates
)

-- Final result with required columns
SELECT
    ORDER_NUMBER AS 'Order Number',
    NewDiscountRate AS 'New Discount Rate',
    DiscountRateApplicationNote AS 'Discount Rate Application Note'
FROM
    DiscountApplication;

--7 Display suppliers of beverage products. The resulting table should display the columns: supplier number, company, address, and phone number

SELECT 
    S.SUPPLIER_NUMBER, 
    S.COMPANY, 
    S.ADDRESS, 
    S.PHONE
FROM 
    SUPPLIERS S
JOIN 
    PRODUCTS P 
    ON S.SUPPLIER_NUMBER = P.SUPPLIER_NUMBER
WHERE 
    P.CATEGORY_CODE = 1;

SELECT * FROM CATEGORIES;	
-- 8 Display customers from Berlin who have ordered at most 1 (0 or 1) dessert product. The resulting table should display the column: customer code.


-- Query to get customers from Berlin who have ordered at most 1 dessert product

WITH DessertOrders AS (
    SELECT 
        O.CUSTOMER_CODE,
        COUNT(OD.PRODUCT_REF) AS DessertCount
    FROM 
        CUSTOMERS C
    JOIN 
        ORDERS O ON C.CUSTOMER_CODE = O.CUSTOMER_CODE
    JOIN 
        ORDER_DETAILS OD ON O.ORDER_NUMBER = OD.ORDER_NUMBER
    JOIN 
        PRODUCTS P ON OD.PRODUCT_REF = P.PRODUCT_REF
    WHERE 
        C.CITY = 'Berlin'
        AND P.CATEGORY_CODE = 3  -- Dessert category code
    GROUP BY 
        O.CUSTOMER_CODE
)
SELECT 
    CUSTOMER_CODE
FROM 
    DessertOrders
WHERE 
    DessertCount <= 1;


	SELECT * FROM ORDER_DETAILS;


-- 9 Display customers who reside in France and the total amount of orders they placed every Monday in April 1998 (considering customers who haven't placed any orders yet). The resulting table should display the columns: customer number, company name, phone number, total amount, and country.

WITH MondayOrders AS (
    SELECT 
        O.CUSTOMER_CODE,
        SUM(OD.QUANTITY * OD.UNIT_PRICE) AS TotalAmount
    FROM 
        ORDERS O
    JOIN 
        ORDER_DETAILS OD ON O.ORDER_NUMBER = OD.ORDER_NUMBER
    WHERE 
        O.ORDER_DATE BETWEEN '1998-04-01' AND '1998-04-30' -- Filter for April 1998
        AND DATEPART(WEEKDAY, O.ORDER_DATE) = 2 -- Filter for Mondays (assuming SQL Server default settings)
    GROUP BY 
        O.CUSTOMER_CODE
)
SELECT 
    C.CUSTOMER_CODE AS [Customer Number], 
    C.COMPANY AS [Company Name], 
    C.PHONE AS [Phone Number],
    COALESCE(MO.TotalAmount, 0) AS [Total Amount],
    C.COUNTRY AS [Country]
FROM 
    CUSTOMERS C
LEFT JOIN 
    MondayOrders MO ON C.CUSTOMER_CODE = MO.CUSTOMER_CODE
WHERE 
    C.COUNTRY = 'France';

-- 10 Display customers who have ordered all products. The resulting table should display the columns: customer code, company name, and telephone number.

WITH ProductCounts AS (
    SELECT
        COUNT(DISTINCT PRODUCT_REF) AS TotalProducts
    FROM
        PRODUCTS
),
CustomerOrders AS (
    SELECT
        O.CUSTOMER_CODE,
        COUNT(DISTINCT OD.PRODUCT_REF) AS OrderedProducts
    FROM
        ORDERS O
    JOIN
        ORDER_DETAILS OD ON O.ORDER_NUMBER = OD.ORDER_NUMBER
    GROUP BY
        O.CUSTOMER_CODE
),
CustomersWithAllProducts AS (
    SELECT
        CO.CUSTOMER_CODE
    FROM
        CustomerOrders CO
    JOIN
        ProductCounts PC ON CO.OrderedProducts = PC.TotalProducts
)
SELECT
    C.CUSTOMER_CODE AS [Customer Code],
    C.COMPANY AS [Company Name],
    C.PHONE AS [Telephone Number]
FROM
    CUSTOMERS C
JOIN
    CustomersWithAllProducts CAP ON C.CUSTOMER_CODE = CAP.CUSTOMER_CODE;


-- 11 Display for each customer from France the number of orders they have placed. The resulting table should display the columns: customer code and number of orders.

SELECT 
    C.CUSTOMER_CODE AS [Customer Code],
    COUNT(O.ORDER_NUMBER) AS [Number of Orders]
FROM 
    CUSTOMERS C
JOIN 
    ORDERS O ON C.CUSTOMER_CODE = O.CUSTOMER_CODE
WHERE 
    C.COUNTRY = 'France'
GROUP BY 
    C.CUSTOMER_CODE;

-- 12 Display the number of orders placed in 1996, the number of orders placed in 1997, and the difference between these two numbers. The resulting table should display the columns: orders in 1996, orders in 1997, and Difference.

SELECT 
    COUNT(CASE WHEN YEAR(O.ORDER_DATE) = 1996 THEN 1 END) AS [Orders in 1996],
    COUNT(CASE WHEN YEAR(O.ORDER_DATE) = 1997 THEN 1 END) AS [Orders in 1997],
    COUNT(CASE WHEN YEAR(O.ORDER_DATE) = 1997 THEN 1 END) - 
    COUNT(CASE WHEN YEAR(O.ORDER_DATE) = 1996 THEN 1 END) AS [Difference]
FROM 
    ORDERS O
WHERE 
    YEAR(O.ORDER_DATE) IN (1996, 1997);

























































