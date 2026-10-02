SELECT * FROM ecommerce_db.`cleaned  dataset project`;

SELECT COUNT(*) AS total_rows
FROM ecommerce_db.`cleaned  dataset project`;

RENAME TABLE `cleaned  dataset project` TO cds;

DESCRIBE cds;

SELECT *
FROM cds;

SELECT Net_Sales_NG
FROM cds
LIMIT 5;

SELECT REPLACE(Net_Sales_NG,',','')
FROM cds
LIMIT 5;

SELECT Customer,
   SUM(CAST(REPLACE(REPLACE(Net_Sales_NG, '$','' ),',','') AS DECIMAL(15,2))) AS Total_Net_Sales
   FROM cds
   GROUP BY Customer
   ORDER BY Total_Net_Sales DESC
   LIMIT 10;
   
   SELECT Product,
   SUM(CAST(REPLACE(REPLACE(Net_Sales_NG, '$','' ),',','') AS DECIMAL(15,2))) AS Total_Net_Sales
   FROM cds
   GROUP BY Product
   ORDER BY Total_Net_Sales DESC
   LIMIT 10;
   
   SELECT MONTHS,
   SUM(CAST(REPLACE(REPLACE(Net_Sales_NG, '$','' ),',','') AS DECIMAL(15,2))) AS Total_Net_Sales
   FROM cds
   GROUP BY MONTHS
   ORDER BY Total_Net_Sales ;
   
   SELECT QUARTER,
   SUM(CAST(REPLACE(REPLACE(Net_Sales_NG, '$','' ),',','') AS DECIMAL(15,2))) AS Total_Net_Sales
   FROM cds
   GROUP BY QUARTER
   ORDER BY Total_Net_Sales ;
   
   SELECT State,
      COUNT(*) AS Transaction_Count,
   SUM(CAST(REPLACE(REPLACE(Net_Sales_NG, '$','' ),',','') AS DECIMAL(15,2))) AS Total_Net_Sales
   FROM cds
   GROUP BY State
   ORDER BY Total_Net_Sales DESC;
   
    SELECT Salesperson,
      COUNT(*) AS Transaction_Count,
   SUM(CAST(REPLACE(REPLACE(Net_Sales_NG, '$','' ),',','') AS DECIMAL(15,2))) AS Total_Net_Sales
   FROM cds
   GROUP BY Salesperson
   ORDER BY Total_Net_Sales DESC;
   
   SELECT Customer,
      COUNT(*) AS Transaction_Count,
   SUM(CAST(REPLACE(REPLACE(Net_Sales_NG, '$','' ),',','') AS DECIMAL(15,2))) AS Total_Net_Sales
   FROM cds
   GROUP BY Customer
   HAVING COUNT(*) > 5
   ORDER BY Total_Net_Sales DESC;
   
   SELECT Product,
     SUM(Quantity) AS Total_Quantity
     FROM cds
     GROUP BY Product
     HAVING SUM(Quantity) > (SELECT AVG(Quantity) FROM cds)
     ORDER BY Total_Quantity DESC;
   
   
   SELECT customer_sector,
      AVG(CAST(REPLACE(REPLACE(Net_Sales_NG, '$','' ),',','') AS DECIMAL(11,2))) AS Total_Net_Sales
      FROM cds
GROUP BY customer_sector;
   
 WITH CategorySales AS (
 SELECT Category,
     SUM(CAST(REPLACE(REPLACE(Net_Sales_NG, '$','' ),',','') AS DECIMAL(15,2))) AS cat_sales
   FROM cds
   GROUP BY Category
   )
   SELECT category,
   cat_sales AS category_sales,
   (cat_sales * 100.0 / SUM(cat_sales) OVER ()) AS percentage_contribution
   FROM CategorySales;
   
   WITH MonthlySales AS (
   SELECT MONTHS,
   SUM(CAST(REPLACE(REPLACE(Net_Sales_NG, '$','' ),',','') AS DECIMAL(15,2))) AS total_sales
   FROM cds
   GROUP BY MONTHS
   )
   SELECT MONTHS AS sales_month,
   total_sales,
   LAG(total_sales,1) OVER(ORDER BY MONTHS) AS prev_month_sales,
   (total_sales - LAG(total_sales, 1) OVER(ORDER BY MONTHS)) AS mon_change_amount,
   ((total_sales - LAG(total_sales, 1) OVER(ORDER BY MONTHS)) * 100.0/
   NULLIF(LAG(total_sales,1) OVER (ORDER BY MONTHS), 0)) AS mon_percentege_change
   FROM MonthlySales;
   
   
WITH RankedProducts AS(
     SELECT category,
       product,
          SUM(CAST(REPLACE(REPLACE(Net_Sales_NG, '$','' ),',','') AS DECIMAL(15,2))) AS total_sales,
	    ROW_NUMBER() OVER (PARTITION BY category ORDER BY SUM(Net_Sales_NG) DESC) AS rn
	FROM cds
    GROUP BY Category, Product
)
SELECT category,
	   product,
       total_sales
FROM RankedProducts
WHERE rn=1;

SELECT ï»¿Transaction_ID,
   COUNT(*) AS transaction_count
   FROM cds
   GROUP BY ï»¿Transaction_ID
   HAVING COUNT(*) > 1;
   
SELECT 
   ï»¿Transaction_ID,
   Quantity,
   Discount_Rate,
   Net_Sales_NG,
   CASE
      WHEN Quantity > 10 THEN 'Flagged: Unusual'
      WHEN Discount_Rate > 0.5 THEN 'Flagged: Unusual'
      WHEN (CAST(REPLACE(REPLACE(Net_Sales_NG, '$','' ),',','')
            AS DECIMAL(15,2))) > 500000
		THEN 'Flagged: Unusual'
        ELSE 'Normal'
END AS transaction_flag
FROM cds;
   

   
   
   
   
   