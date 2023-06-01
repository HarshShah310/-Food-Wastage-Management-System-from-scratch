-- Team 3 
-- UTA IDs:1002117623, 1002057387, 1002117821, 1001924185
-- Name: Kushal Shah, Harsh Shah, Shivang Khatri, Alishbah Fahad

------------------1
CREATE TABLE Spring23_S003_3_USER_ADDRESS (ADDRESS varchar(50) not null, ZIP varchar(5)	not null, primary key(ADDRESS));

------------------2
CREATE TABLE Spring23_S003_3_USER (USER_ID INT not null, NAME varchar(10) not null,	TYPE varchar(15) not null, ADDRESS varchar(50) not null, AGE INT,GENDER char(1), EMAIL varchar(30) not null, CITY varchar(15) not null, primary key(USER_ID), foreign key(ADDRESS) references Spring23_S003_3_USER_ADDRESS(ADDRESS) on delete cascade, check( GENDER='F' OR GENDER='M'), check(TYPE='INDIVIDUAL' OR TYPE='RESTAURANT' OR TYPE='ADMIN'));

--------------3 

CREATE TABLE Spring23_S003_3_USER_PHONE (USER_ID INT not null, PHONE varchar(10) not null unique, PRIMARY KEY(USER_ID,PHONE), foreign key(USER_ID) references Spring23_S003_3_USER(USER_ID) on delete cascade);

----------------4

CREATE TABLE Spring23_S003_3_ADMIN (USER_ID	INT	NOT NULL, PRIMARY KEY(USER_ID),	foreign key(USER_ID) references Spring23_S003_3_USER(USER_ID) on delete cascade);

-----------------5

CREATE TABLE Spring23_S003_3_INDIVIDUAL (USER_ID INT NOT NULL, PRIMARY KEY(USER_ID), foreign key(USER_ID) references Spring23_S003_3_USER(USER_ID) on delete cascade);

-------------6 

CREATE TABLE Spring23_S003_3_RESTAURANT(USER_ID	INT	NOT NULL, PRIMARY KEY(USER_ID), foreign key(USER_ID) references Spring23_S003_3_USER(USER_ID) on delete cascade);

---------------7

CREATE TABLE Spring23_S003_3_CARD_DETAILS (CARD_NUMBER INT,	CVC INT, EXPIRY_DATE date, CARD_HOLDER_NAME VARCHAR(30), PRIMARY KEY(CARD_NUMBER, CVC, EXPIRY_DATE));

----------------8

CREATE TABLE Spring23_S003_3_FOOD_RECEIVER (FOOD_RECEIVER_ID INT NOT NULL, USER_ID INT, NAME VARCHAR(20), EMAIL VARCHAR(30), STREET VARCHAR(20), CITY VARCHAR(20), ZIP VARCHAR(5), STATE VARCHAR(20), PRIMARY KEY(FOOD_RECEIVER_ID), foreign key(USER_ID) references Spring23_S003_3_USER(USER_ID) on delete cascade);

-----------------9

CREATE TABLE Spring23_S003_3_FOOD_RECEIVER_PHONE (FOOD_RECEIVER_ID INT NOT NULL, PHONE VARCHAR(10), PRIMARY KEY(FOOD_RECEIVER_ID, PHONE), foreign key(FOOD_RECEIVER_ID) references Spring23_S003_3_FOOD_RECEIVER(FOOD_RECEIVER_ID) on delete cascade);

-----------------10

CREATE TABLE Spring23_S003_3_FOOD_RECEIVER_ZIP (NGO_ZIP_CODE VARCHAR(5), FOOD_RECEIVER_ID INT,PRIMARY KEY(NGO_ZIP_CODE));

-------------------11

CREATE TABLE Spring23_S003_3_DELIVERY_PERSON (DELIVERY_PERSON_ID	INT	NOT NULL, DELIVERY_PERSON_NAME VARCHAR(30) NOT NULL, DELIVERY_PERSON_ZIP varchar(5)	not null, DELIVERY_PERSON_PHONE	VARCHAR(10)	NOT NULL, PRIMARY KEY(DELIVERY_PERSON_ID));

--------------------12

CREATE TABLE Spring23_S003_3_RATINGS ( RATING_ID INT	not null, USER_ID INT, DELIVERY_PERSON_ID INT, NUMBER_OF_RATINGS INT, COMMENTS varchar(25), primary key(RATING_ID), foreign key(USER_ID) references Spring23_S003_3_USER(USER_ID) on delete cascade, foreign key(DELIVERY_PERSON_ID) references Spring23_S003_3_DELIVERY_PERSON(DELIVERY_PERSON_ID) on delete cascade);

--------------------13

CREATE TABLE Spring23_S003_3_ORDER (ORDER_ID INT NOT NULL,	USER_ID	INT	NOT NULL, DATE_OF_ORDER	date, FOOD_RECEIVER_ID INT, TIME_OF_ORDER timestamp, DELIVERY_PERSON_ID INT, INDIVIDUAL_ID INT, RESTAURANT_ID INT, PRIMARY KEY(ORDER_ID), foreign key(USER_ID) references Spring23_S003_3_USER(USER_ID) on delete cascade, foreign key(FOOD_RECEIVER_ID) references Spring23_S003_3_FOOD_RECEIVER(FOOD_RECEIVER_ID) on delete cascade, foreign key(RESTAURANT_ID) references Spring23_S003_3_RESTAURANT(USER_ID) on delete cascade,	foreign key(INDIVIDUAL_ID) references Spring23_S003_3_INDIVIDUAL(USER_ID) on delete cascade, foreign key(DELIVERY_PERSON_ID) references Spring23_S003_3_DELIVERY_PERSON(DELIVERY_PERSON_ID) on delete cascade);

--------------------14

CREATE TABLE Spring23_S003_3_FOOD_TO_BE_DONATED (FOOD_TO_BE_DONATED_ID INT NOT NULL, QUANTITY_OF_ORDER VARCHAR(20), TYPE_OF_FOOD VARCHAR(30), ORDER_ID INT, PRIMARY KEY(FOOD_TO_BE_DONATED_ID), foreign key(ORDER_ID) references Spring23_S003_3_ORDER(ORDER_ID) on delete cascade);

--------------------15

CREATE TABLE Spring23_S003_3_PAYMENT ( PAYMENT_ID INT NOT NULL, ORDER_ID INT NOT NULL, USER_ID INT NOT NULL, CARD_NUMBER INT, CVC INT, EXPIRY_DATE date, FOOD_RECEIVER_ID INT, PRIMARY KEY(PAYMENT_ID), foreign key(USER_ID) references Spring23_S003_3_USER(USER_ID) on delete cascade, foreign key(ORDER_ID) references Spring23_S003_3_ORDER(ORDER_ID) on delete cascade, foreign key(FOOD_RECEIVER_ID) references Spring23_S003_3_FOOD_RECEIVER(FOOD_RECEIVER_ID) on delete cascade);

--------------------16

CREATE TABLE Spring23_S003_3_DELIVERY (DELIVERY_ID INT NOT NULL, DELIVERY_PERSON_ID INT, ORDER_ID INT, USER_ID INT, FOOD_RECEIVER_ID INT, NGO_ZIP_CODE VARCHAR(5), PRIMARY KEY(DELIVERY_ID), foreign key(USER_ID) references Spring23_S003_3_USER(USER_ID) on delete cascade, foreign key(ORDER_ID) references Spring23_S003_3_ORDER(ORDER_ID) on delete cascade, foreign key(DELIVERY_PERSON_ID) references Spring23_S003_3_DELIVERY_PERSON(DELIVERY_PERSON_ID) on delete cascade, foreign key(FOOD_RECEIVER_ID) references Spring23_S003_3_FOOD_RECEIVER(FOOD_RECEIVER_ID) on delete cascade, foreign key(NGO_ZIP_CODE) references Spring23_S003_3_FOOD_RECEIVER_ZIP(NGO_ZIP_CODE) on delete cascade);

--------------------17

CREATE TABLE Spring23_S003_3_DONATES ( USER_ID INT NOT NULL, FOOD_TO_BE_DONATED_ID INT NOT NULL, PRIMARY KEY(USER_ID,FOOD_TO_BE_DONATED_ID), foreign key(USER_ID) references Spring23_S003_3_USER(USER_ID) on delete cascade, foreign key(FOOD_TO_BE_DONATED_ID) references Spring23_S003_3_FOOD_TO_BE_DONATED(FOOD_TO_BE_DONATED_ID) on delete cascade);


