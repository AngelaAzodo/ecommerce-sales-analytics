📊 E-Commerce Sales Performance & Transaction Analytics

An end-to-end data analysis project transforming raw e-commerce transactional data into actionable business intelligence using Microsoft Excel and MySQL.


Project Overview
This project focuses on auditing, cleaning, standardzing, and analyzing an e-commerce dataset to uncover sales trends, evaluate product performance, and flag transactional anomalies. By combining advanced spreadsheet engineering with robust SQL querying, the project addresses key business questions around revenue growth, customer sectors, and category performance.


Tech Stack & Tools
*Microsoft Excel: Data preprocessing, text to number transformation, Pivot Tables, Pivot Charts, feature engineering (Monthly/Quarterly columns), and KPI dashboard design.
*MySQL Workbench: Database management, string casting (`CAST`, `REPLACE`), aggregations (`GROUP BY`, `HAVING`), Common Table Expressions (CTEs), and window functions (`LAG`, `ROW_NUMBER`).


Project Structure
*E-Commerce_Dataset_Cleaned.xlsx: The source workbook featuring cleaned data, custom time-series columns, Pivot Tables, and KPI summaries.
*E-Commerce_Project_Queries.sql: The complete, documented SQL script containing all analytical queries (Questions 37–42).
*Project_Report.pdf: The full exported project documentation and findings.


Key Technical Highlights
1.Data Cleaning & Type Casting: Handled monetary columns stored as formatted `VARCHAR` strings by utilizing nested `REPLACE` and `CAST` functions to enable accurate mathematical aggregation in MySQL also applied string manipulation functions including Trim, Proper, Replace, to eliminate unwanted spaces, standardize capitalization and fix formatting irregularities in category data.
2.Feature Engineering: Created dedicated `Month` and `Quarter` columns during the data preprocessing phase to streamline time-series analysis and demonstrate structured data pipeline habits.
3.Advanced SQL Window Functions:
   * Utilized `LAG()` within a CTE to compute Month over Month (MoM) percentage changes in sales revenue.
   * Leveraged `ROW_NUMBER() OVER (PARTITION BY ...)` to dynamically isolate and extract the top selling product in each category.
4.Data Quality & Anomaly Detection: Implemented query logic to flag transactions with unusual quantities, high discount rates, or extreme sales values for auditing.


Key Findings
*Category Dominance: Specific product categories drive the vast majority of net sales, indicating prime targets for inventory allocation.
*Revenue Trajectory: Time-series tracking highlights distinct peak sales months, revealing important seasonal trends.
*Transaction Concentration: A small tier of high value orders heavily influences overall revenue, while routine transactions make up the bulk of volume.


👤 Author
Angela Azodo Chinecherem 
Aspiring Data Analyst| [https://www.linkedin.com/in/angela-azodo-904351409?utm_source=share_via&utm_content=profile&utm_medium=member_ios]
