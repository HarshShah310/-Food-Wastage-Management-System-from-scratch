-- Team 3 
-- UTA IDs:1002117623, 1002057387, 1002117821, 1001924185
-- Name: Kushal Shah, Harsh Shah, Shivang Khatri, Alishbah Fahad

 ---------------Query to find the total number of orders placed by each user:-------------
SELECT u.USER_ID, u.NAME,u.TYPE ,COUNT(*) as TOTAL_ORDERS
FROM Spring23_S003_3_USER u
JOIN Spring23_S003_3_ORDER o ON u.USER_ID = o.USER_ID
GROUP BY u.USER_ID, u.NAME, u.TYPE
HAVING u.TYPE='INDIVIDUAL'
ORDER BY u.USER_ID;



--------------------- Query to find the average age of individual users who have placed at least 2 orders: --------------------------------------

SELECT i.USER_ID, u.NAME, AVG(u.AGE) as AVG_AGE
FROM Spring23_S003_3_USER u
JOIN Spring23_S003_3_INDIVIDUAL i ON u.USER_ID = i.USER_ID
JOIN Spring23_S003_3_ORDER o ON u.USER_ID = o.USER_ID
GROUP BY i.USER_ID, u.NAME
HAVING COUNT(*) >= 2;


--------------------- Find the total number of orders placed by each user for each city, ordered by the user ID and city: --------------------------------------


SELECT u.USER_ID, u.CITY, COUNT(*) AS TOTAL_ORDERS
FROM Spring23_S003_3_ORDER o
JOIN Spring23_S003_3_FOOD_RECEIVER f ON o.FOOD_RECEIVER_ID = f.FOOD_RECEIVER_ID
JOIN Spring23_S003_3_USER u ON o.USER_ID = u.USER_ID
GROUP BY u.USER_ID, u.CITY
ORDER BY u.USER_ID, u.CITY;

--------------------- Query to find the total number of ratings and the average rating received by each delivery person: --------------------------------------

SELECT d.DELIVERY_PERSON_ID, d.DELIVERY_PERSON_NAME, COUNT(*) as TOTAL_RATINGS, AVG(r.NUMBER_OF_RATINGS) as AVG_RATING
FROM Spring23_S003_3_DELIVERY_PERSON d
JOIN Spring23_S003_3_RATINGS r ON d.DELIVERY_PERSON_ID = r.DELIVERY_PERSON_ID
GROUP BY d.DELIVERY_PERSON_ID, d.DELIVERY_PERSON_NAME
ORDER BY d.DELIVERY_PERSON_ID;


---------------------Find the total number of orders made in each city --------------------------------------

SELECT u.CITY, COUNT(*) AS num_orders FROM Spring23_S003_3_ORDER o JOIN Spring23_S003_3_FOOD_RECEIVER f ON o.FOOD_RECEIVER_ID = f.FOOD_RECEIVER_ID JOIN Spring23_S003_3_USER u ON f.USER_ID = u.USER_ID GROUP BY 
u.CITY;


------------------Show the total number of orders placed by each user type and in each zip code in the system:---------------------------------

SELECT Spring23_S003_3_USER.TYPE, Spring23_S003_3_USER_ADDRESS.ZIP, COUNT(*) 
FROM Spring23_S003_3_ORDER 
INNER JOIN Spring23_S003_3_USER ON Spring23_S003_3_ORDER.USER_ID = Spring23_S003_3_USER.USER_ID 
INNER JOIN Spring23_S003_3_USER_ADDRESS ON Spring23_S003_3_USER.ADDRESS = Spring23_S003_3_USER_ADDRESS.ADDRESS 
GROUP BY CUBE(Spring23_S003_3_USER.TYPE, Spring23_S003_3_USER_ADDRESS.ZIP);


---------- total number of orders made by each combination of city and user type, including subtotals and grand totals-----------
SELECT CITY, TYPE, COUNT(*) as NUM_ORDERS
FROM Spring23_S003_3_ORDER O
JOIN Spring23_S003_3_USER U ON O.USER_ID = U.USER_ID
GROUP BY CUBE(CITY, TYPE)
ORDER BY CITY, TYPE;


------------------Find all the delivery persons who have delivered food to every food receiver in a specific ZIP code--------------------------
---------------DIVISION---------------------------------

SELECT DISTINCT DP.DELIVERY_PERSON_ID, DP.DELIVERY_PERSON_NAME, DP.DELIVERY_PERSON_ZIP, DP.DELIVERY_PERSON_PHONE
FROM Spring23_S003_3_DELIVERY_PERSON DP
WHERE NOT EXISTS (
    SELECT *
    FROM Spring23_S003_3_FOOD_RECEIVER FR
    WHERE FR.ZIP = '10001'
    AND NOT EXISTS (
        SELECT *
        FROM Spring23_S003_3_ORDER O
        WHERE O.FOOD_RECEIVER_ID = FR.FOOD_RECEIVER_ID
        AND O.DELIVERY_PERSON_ID = DP.DELIVERY_PERSON_ID
    )
);


-----------------Retrieve the user name and the count of orders made by each user----------------------------

SELECT U.NAME, COUNT(*) OVER(PARTITION BY O.USER_ID) AS ORDER_COUNT
FROM Spring23_S003_3_ORDER O, Spring23_S003_3_USER U 
WHERE O.USER_ID = U.USER_ID;

-----------------Retrieve all the orders, DATE OF ORDERS from a specific city Dallas-----------------------------------------

SELECT ORDER_ID, DATE_OF_ORDER, DELIVERY_PERSON_ID FROM Spring23_S003_3_ORDER
WHERE USER_ID IN (
  SELECT USER_ID FROM Spring23_S003_3_USER
  WHERE CITY LIKE '%Dallas%'
);

-----------------Retrieve the NAME, AGE, ADDRESS, and PHONE of Users and orders the results by NAME and AGE in ascending order. Skips the first 10 rows of the result set and fetches the next 5 rows only----------------------------

SELECT u.NAME, u.AGE, a.ADDRESS, p.PHONE
FROM Spring23_S003_3_USER u
JOIN Spring23_S003_3_USER_ADDRESS a ON u.ADDRESS = a.ADDRESS
JOIN Spring23_S003_3_USER_PHONE p ON u.USER_ID = p.USER_ID
ORDER BY u.NAME, u.AGE
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY;
