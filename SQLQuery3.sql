USE [Project_DSA];
GO


------1. Which productcategory had the highest sales?

SELECT [Product_Category], SUM(Sales) AS Total_Sales
FROM [KMS Sql Case Study]
GROUP BY [Product_Category]
ORDER BY Total_Sales DESC


------2.What are the Top 3 and Bottom 3 regions in terms of sales?

	-- Top 3 Regions
SELECT TOP 3 Region, SUM(Sales) AS Total_Sales
FROM [KMS Sql Case Study]
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Bottom 3 Regions
SELECT TOP 3 Region, SUM(Sales) AS Total_Sales
FROM [KMS Sql Case Study]
GROUP BY Region
ORDER BY Total_Sales ASC;

------ 3.What were the total sales of appliances in Ontario?

SELECT SUM(Sales) AS Appliances_Sales
FROM [KMS Sql Case Study]
WHERE Region = 'Ontario' AND [Product_Sub_Category] = 'Appliances';

---4. Advise the management of KMS on what to do to increase the revenue from the bottom 10 customers

SELECT top 10 [Customer_Name], SUM(Sales) AS Total_Sales
FROM [KMS Sql Case Study]
GROUP BY [Customer_Name]
ORDER BY Total_Sales ASC;

-----5.KMS incurred the most shipping cost using which shipping method?

SELECT [Ship_Mode], SUM([Shipping_Cost]) AS Total_Shipping_Cost
FROM [KMS Sql Case Study]
GROUP BY [Ship_Mode]
ORDER BY Total_Shipping_Cost DESC;

------6. Who are the most valuable customers, and what products or services do they typically purchase?

SELECT TOP 10 [Customer_Name], [Product_Category], SUM(Sales) AS Total_Sales
FROM [KMS Sql Case Study]
GROUP BY [Customer_Name], [Product_Category]
ORDER BY Total_Sales DESC;

------7. Which small business customer had the highest sales?

SELECT TOP 1 [Customer_Name], SUM(Sales) AS Total_Sales
FROM [KMS Sql Case Study]
WHERE [Customer_Segment] = 'Small Business'
GROUP BY [Customer_Name]
ORDER BY Total_Sales DESC;

-----8. Which Corporate Customer placed the most number of orders in 2009 – 2012?


SELECT TOP 1 [Customer_Name], COUNT(*) AS Order_Count
FROM [KMS Sql Case Study]
WHERE [Customer_Segment] = 'Corporate'
  AND YEAR(CONVERT(date, [Order_Date], 103)) BETWEEN 2009 AND 2012
GROUP BY [Customer_Name]
ORDER BY Order_Count DESC;

------9. Which consumer customer was the most profitable one?

SELECT TOP 1 [Customer_Name], SUM(Profit) AS Total_Profit
FROM [KMS Sql Case Study]
WHERE [Customer_Segment] = 'Consumer'
GROUP BY [Customer_Name]
ORDER BY Total_Profit DESC;


ALTER TABLE [KMS Sql Case Study]
ADD Returned VARCHAR(10) 

UPDATE [KMS Sql Case Study]
SET Returned = 'Yes'
WHERE [Profit] < 0;

UPDATE [KMS Sql Case Study]
SET Returned = 'No'
WHERE Returned is Null

select* from  [KMS Sql Case Study]

------10. Which customer returned items, and what segment do they belong to?

SELECT DISTINCT [Customer_Name], [Customer_Segment]
FROM [KMS Sql Case Study]
WHERE returned = 'Yes';

-----11. 

SELECT [Order_Priority], [Ship_Mode], COUNT(*) AS Orders, 
AVG([Shipping_Cost]) AS Avg_Shipping_Cost
FROM [KMS Sql Case Study]
GROUP BY [Order_Priority], [Ship_Mode]
ORDER BY [Order_Priority], [Ship_Mode];