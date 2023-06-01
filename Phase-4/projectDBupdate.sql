-- Team 3 
-- UTA IDs:1002117623, 1002057387, 1002117821, 1001924185
-- Name: Kushal Shah, Harsh Shah, Shivang Khatri, Alishbah Fahad

---------------------------------------------------------------UPDATE QUERIES---------------------------------------------------------

----------------------------------------------------- 1)
update SPRING23_S003_3_USER_ADDRESS set ZIP='89150' where  ZIP='89156';
update SPRING23_S003_3_USER_ADDRESS set ZIP='33110' where  ZIP='33113';

----------------------------------------------------- 2)
update Spring23_S003_3_USER set NAME='Raman' where NAME='Suman';
update Spring23_S003_3_USER set TYPE='INDIVIDUAL' where  USER_ID=3;
update Spring23_S003_3_USER set AGE=25 where  NAME='Rishi';
update Spring23_S003_3_USER set EMAIL='dev22@gmail.com' where EMAIL='dev45@gmail.com';

-----------------------------3)
update Spring23_S003_3_USER_PHONE SET USER_ID=5 WHERE PHONE='8987999823'; 
update Spring23_S003_3_USER_PHONE SET USER_ID=7 WHERE USER_ID=31; 

----------------------4)
UPDATE Spring23_S003_3_CARD_DETAILS SET CARD_HOLDER_NAME='Raman Shah' WHERE CARD_HOLDER_NAME='Suman Shah';
UPDATE Spring23_S003_3_CARD_DETAILS SET CARD_HOLDER_NAME='Malay Patel' WHERE CARD_NUMBER=7888239591000235;

-----------------------------5)
UPDATE Spring23_S003_3_FOOD_RECEIVER SET NAME='Smith' WHERE EMAIL='johnsmith@gmail.com';
UPDATE Spring23_S003_3_FOOD_RECEIVER SET EMAIL='taylor45@gmail.com' WHERE NAME='Taylor';
UPDATE Spring23_S003_3_FOOD_RECEIVER SET STREET='Brd St' WHERE STREET='Broadway';
UPDATE Spring23_S003_3_FOOD_RECEIVER SET CITY='Las Vegas' WHERE NAME='Jane';
UPDATE Spring23_S003_3_FOOD_RECEIVER SET ZIP='10020' WHERE NAME='Alice';

-----------6)
update Spring23_S003_3_FOOD_RECEIVER_PHONE set PHONE='8996458960' where FOOD_RECEIVER_ID=1;
update Spring23_S003_3_FOOD_RECEIVER_PHONE set PHONE='1239874595' where PHONE='1239874560';

-------7)
update Spring23_S003_3_DELIVERY_PERSON set DELIVERY_PERSON_NAME='Ajay Singh' where  DELIVERY_PERSON_NAME='Vijay Patel';
update Spring23_S003_3_DELIVERY_PERSON set DELIVERY_PERSON_ZIP='34524' where  DELIVERY_PERSON_NAME='Ankit Shah';
update Spring23_S003_3_DELIVERY_PERSON set DELIVERY_PERSON_PHONE='9876543222' where  DELIVERY_PERSON_NAME='Ravi Patel';

-------8)
update Spring23_S003_3_RATINGS set NUMBER_OF_RATINGS=2 where  RATING_ID=5;
update Spring23_S003_3_RATINGS set COMMENTS='Good Food' where  RATING_ID=13;

-------9)
update Spring23_S003_3_ORDER set DATE_OF_ORDER=TO_DATE('2023-01-20', 'yyyy-mm-dd') where  ORDER_ID=10;
update Spring23_S003_3_ORDER set TIME_OF_ORDER=TO_TIMESTAMP('2023-01-20 11:26:50', 'YYYY-MM-DD HH24:MI:SS') where  ORDER_ID=10;

---------10)
update Spring23_S003_3_FOOD_TO_BE_DONATED set QUANTITY_OF_ORDER='3 lb' where  FOOD_TO_BE_DONATED_ID=24;
update Spring23_S003_3_FOOD_TO_BE_DONATED set TYPE_OF_FOOD='Fruits' where  FOOD_TO_BE_DONATED_ID=22;

---------11)
update Spring23_S003_3_PAYMENT set CARD_NUMBER=9233003489364217 where  USER_ID=5;
update Spring23_S003_3_PAYMENT set EXPIRY_DATE=TO_DATE('2023-04-17', 'yyyy-mm-dd') where  CARD_NUMBER=1000023122355512;