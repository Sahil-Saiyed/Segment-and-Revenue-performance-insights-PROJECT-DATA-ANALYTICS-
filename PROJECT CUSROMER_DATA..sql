CREATE DATABASE practice_db;

SELECT * from customer_data;

'CREATING NEW DATE COLUM AS DATE IS UNSORTED '
 
SELECT 
Order_Date, DATE_ADD('1899-12-30', INTERVAL CAST(Order_Date AS UNSIGNED) DAY) AS Converted_Date
FROM customer_data
LIMIT 10;
--
'CREATING NEW DATE COLUMN'

ALTER TABLE customer_data
ADD COLUMN Order_Date_Clean2 DATE;

'POPULATE DATE VALUES TO NEW DATE COLUMN'

UPDATE customer_data
SET Order_Date_Clean2 = DATE_ADD('1899-12-30',INTERVAL CAST(Order_Date AS UNSIGNED) DAY);


'-- 1. TOTAL REVENUE BY YEAR,MONTH'

SELECT 
    YEAR(Order_Date_Clean) AS year,
    MONTH(Order_Date_Clean) AS month,
    SUM(Revenue) AS total_revenue
FROM customer_data
GROUP BY YEAR(Order_Date_Clean), MONTH(Order_Date_Clean)
ORDER BY year, month;

'-- 2. TOP 5 CUSTOMERS BY REVENUE'

SELECT Customer_Name, SUM(Revenue) AS total_revenue
FROM customer_data
GROUP BY Customer_Name
ORDER BY total_revenue desc
limit 5;

'-- 3. REVENUE BY SEGMENT'

SELECT 
    Segment,
    SUM(Revenue) AS total_revenue
FROM customer_data
GROUP BY Segment
ORDER BY total_revenue DESC;

'--4 REVENUE BY REGION '

 SELECT Region, 
 SUM(Revenue) AS total_revenue
FROM customer_data
GROUP BY Region
ORDER BY total_revenue DESC;

'--5 Orders per Sales Rep '

SELECT 
    Sales_Rep,
    COUNT(Order_ID) AS total_orders
FROM customer_data
GROUP BY Sales_Rep
ORDER BY total_orders DESC;

'I HAVE NOT DROP THE ORIGNAL DATE COLUMN AS A PROOF THAT DATES FROM EXCEL WAS UNSORTED',
thankyou,
Sahil Saiyed


