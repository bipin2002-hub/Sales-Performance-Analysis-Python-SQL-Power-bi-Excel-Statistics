create database Sales;
use sales;

Select * from Sales_data;

-- count the Total_oders
select count(*) from sales_data; # We found  that total no. of order are 10018,

-- chech the null  value
SELECT 
    SUM(CASE WHEN `Row ID` IS NULL THEN 1 ELSE 0 END) AS row_id_nulls,
    SUM(CASE WHEN `Order ID` IS NULL THEN 1 ELSE 0 END) AS order_id_nulls,
    SUM(CASE WHEN `Order Date` IS NULL THEN 1 ELSE 0 END) AS order_date_nulls,
    SUM(CASE WHEN `Ship Date` IS NULL THEN 1 ELSE 0 END) AS ship_date_nulls,
    SUM(CASE WHEN `Ship Mode` IS NULL THEN 1 ELSE 0 END) AS ship_mode_nulls,
    SUM(CASE WHEN `Customer ID` IS NULL THEN 1 ELSE 0 END) AS customer_id_nulls,
    SUM(CASE WHEN `Customer Name` IS NULL THEN 1 ELSE 0 END) AS customer_name_nulls,
    SUM(CASE WHEN `Segment` IS NULL THEN 1 ELSE 0 END) AS segment_nulls,
    SUM(CASE WHEN `Country/Region` IS NULL THEN 1 ELSE 0 END) AS country_region_nulls,
    SUM(CASE WHEN `City` IS NULL THEN 1 ELSE 0 END) AS city_nulls,
    SUM(CASE WHEN `State/Province` IS NULL THEN 1 ELSE 0 END) AS state_province_nulls,
    SUM(CASE WHEN `Region` IS NULL THEN 1 ELSE 0 END) AS region_nulls,
    SUM(CASE WHEN `Product ID` IS NULL THEN 1 ELSE 0 END) AS product_id_nulls,
    SUM(CASE WHEN `Category` IS NULL THEN 1 ELSE 0 END) AS category_nulls,
    SUM(CASE WHEN `Sub-Category` IS NULL THEN 1 ELSE 0 END) AS sub_category_nulls,
    SUM(CASE WHEN `Product Name` IS NULL THEN 1 ELSE 0 END) AS product_name_nulls,
    SUM(CASE WHEN `Sales` IS NULL THEN 1 ELSE 0 END) AS sales_nulls,
    SUM(CASE WHEN `Quantity` IS NULL THEN 1 ELSE 0 END) AS quantity_nulls,
    SUM(CASE WHEN `Discount` IS NULL THEN 1 ELSE 0 END) AS discount_nulls,
    SUM(CASE WHEN `Profit` IS NULL THEN 1 ELSE 0 END) AS profit_nulls,
    SUM(CASE WHEN `Revenue` IS NULL THEN 1 ELSE 0 END) AS revenue_nulls,
    SUM(CASE WHEN `Ship Days` IS NULL THEN 1 ELSE 0 END) AS ship_days_nulls,
    SUM(CASE WHEN `Year` IS NULL THEN 1 ELSE 0 END) AS year_nulls,
    SUM(CASE WHEN `Month` IS NULL THEN 1 ELSE 0 END) AS month_nulls,
    SUM(CASE WHEN `Quarter` IS NULL THEN 1 ELSE 0 END) AS quarter_nulls,
    SUM(CASE WHEN `Weekday` IS NULL THEN 1 ELSE 0 END) AS weekday_nulls,
    SUM(CASE WHEN `Month Name` IS NULL THEN 1 ELSE 0 END) AS month_name_nulls
FROM sales_data;  # We obeserved that in this data have no any  null  value

--  convert all  the columns name as snaked based
CREATE TABLE sales AS
SELECT
    `Row ID` AS row_id,
    `Order ID` AS order_id,
    STR_TO_DATE(`Order Date`, '%d-%m-%Y') AS order_date,
    STR_TO_DATE(`Ship Date`, '%d-%m-%Y') AS ship_date,
    `Ship Mode` AS ship_mode,
    `Customer ID` AS customer_id,
    `Customer Name` AS customer_name,
    `Segment` AS segment,
    `Country/Region` AS country_region,
    `City` AS city,
    `State/Province` AS state_province,
    `Region` AS region,
    `Product ID` AS product_id,
    `Category` AS category,
    `Sub-Category` AS sub_category,
    `Product Name` AS product_name,
    `Sales` AS sales,
    `Quantity` AS quantity,
    `Discount` AS discount,
    `Profit` AS profit,
    `Revenue` AS revenue,
    `Ship Days` AS ship_days,
    `Year` AS year,
    `Month` AS month,
    `Quarter` AS quarter,
    `Weekday` AS weekday,
    `Month Name` AS month_name
FROM sales_data; 

Select * from sales;

#------------------ Business Insight -------------------

#--------------------- KPI------------------------
-- Financial KPIs
-- 1.Total Sales
Select round(sum(Sales)/1000000,2)  as  total_Sales_Mn from sales; # 2.3Mn
-- 2 Total Profit 
Select round(sum(Profit)/1000,2) as Total_Profit_K from Sales; #286.6K
-- 3 Total Revenue
select round(sum(Revenue)/1000000,2) as Total_revenue_Mn from sales; #$11.49Mn
-- 5 Total Order Quantity
select sum(Quantity) as  Total_Order_Quantity  from Sales; #  Total Order Quantity :37985
-- 6 Profit Margin 
select round(sum(profit)*100/sum(sales),2) as  Profit_Margin from Sales; # Profit Margin =12.47%
-- 7 Average Order value 
select round(sum(sales)/count(order_id),2)  as Avg_Order_value  from  sales; # Average Order value: $229.48
-- 8 Avg Profit per Order 
select round(sum(profit)/count(order_id),2) as Avg_Profit_Per_Order from Sales; #  Avg Profit per Order: $28.61
-- 9.  Return on Sales (ROS)
select round(sum(profit)*100/sum(sales),2) as  Profit_Margin from Sales; # Return on Sales (ROS)=12.47%  

-- Customer KPIs
-- Unique Customers  
select count(distinct(customer_id)) as Unique_customers from sales; # Unique Customers: 800
 -- Unique Orders
 select count(distinct(order_id)) from sales; # Unique Orders: 5026
 -- 1  Revenue per Customer (ARPU)
 select round(sum(sales)/count(distinct(customer_id)),2) as Revenue_per_Customer from sales; #  Revenue per Customer (ARPU): 2873.62
 -- 2  Orders per Customer 
 select round(count(distinct(order_id))/count(distinct(customer_id)),0) as Orders_per_Customer  from  sales; #  Orders per Customer:6
 
-- Product KPI's
 -- 1. Top Category by Sales 
 select Category,round(sum(Sales)/1000,2) as  Total_Sales from sales 
group by category order by total_Sales desc
limit 1; # Top Category by Sales : $836.15K

-- 2.  Top Subcategory 
 select sub_Category,round(sum(Sales)/1000,2) as  Total_Sales from sales 
group by Sub_category order by total_Sales desc
limit 1 ; # Top Subcategory :Phones:$330.01K

-- 3. Best Selling Product 
 select product_name ,round(sum(Sales)/1000,2) as  Total_Sales from sales 
group by product_name  order by total_Sales desc
limit 1; #  Best Selling Product: Canon imageCLASS 2200 Advanced Copier:$61.6K Total Sales

-- 4 Total Unique Products
 select count(distinct(Product_name)) as total_unique_Product from sales; # Total Unique Products:1849 
 

-- 5. Loss-making Products
SELECT 
    COUNT(DISTINCT Product_name) AS loss_sku_count,
    ROUND(
        COUNT(DISTINCT Product_name) / 
        (SELECT COUNT(DISTINCT Product_name) FROM sales) * 100, 
    2) AS pct_loss_making_product
FROM sales
WHERE Profit < 0; # Loss-making Products:765(41.37%)

-- -----------Operational KPIs---------------
 -- Avg Shipping Days 
 Select Avg(ship_days) as Avg_Ship_Days from sales; #  Avg Shipping Days: 3.9595 days
 
-- On-Time Delivery (≤5d) 
 SELECT 
    ROUND(
        SUM(CASE WHEN Ship_Days <= 5 THEN 1 ELSE 0 END) 
        / COUNT(*) * 100, 
    2) AS on_time_pct
FROM sales; # On-Time Delivery (≤5d): 81.75%
 
#  % Orders with Discount
 SELECT 
    ROUND(
        SUM(CASE WHEN discount > 0 THEN 1 ELSE 0 END) 
        / COUNT(*) * 100, 
    2) AS order_with_discount
FROM sales; # % Orders with Discount:52.07%


-- High-Disc Loss Orders 
select count(*) Count_High_Disc_Loss_Orders from sales
 where discount>=0.4 and profit<0 ; #  High-Disc Loss Orders:1121 Products 
 
 -- ---------- YoY Growth KPI------------
SELECT 
    Year,

    Yearly_sales,
    ROUND(
        (Yearly_sales - LAG(Yearly_sales) OVER (ORDER BY Year)) 
        / LAG(Yearly_sales) OVER (ORDER BY Year) * 100,
    2) AS yoy_sales,

    Yearly_profit,
    ROUND(
        (Yearly_profit - LAG(Yearly_profit) OVER (ORDER BY Year)) 
        / LAG(Yearly_profit) OVER (ORDER BY Year) * 100,
    2) AS yoy_profit,

    Yearly_orders,
    ROUND(
        (Yearly_orders - LAG(Yearly_orders) OVER (ORDER BY Year)) 
        / LAG(Yearly_orders) OVER (ORDER BY Year) * 100,
    2) AS yoy_orders

FROM (
    SELECT 
        YEAR(Order_Date) AS Year,
        SUM(Sales) AS Yearly_sales,
        SUM(Profit) AS Yearly_profit,
        COUNT(DISTINCT Order_id) AS Yearly_orders
    FROM sales
    GROUP BY YEAR(Order_Date)
) t
ORDER BY Year;

--  Regional KPIs 
SELECT 
    Region,
    round(SUM(Sales),2) AS Sales,
    round(SUM(Profit),2) AS Profit,
    COUNT(DISTINCT Order_id) AS Orders,
    COUNT(DISTINCT Customer_id) AS Customers,
    ROUND(SUM(Profit) * 100 / SUM(Sales), 2) AS Margin,
    ROUND(SUM(Sales) / COUNT(DISTINCT Order_id), 2) AS AOV
FROM sales
GROUP BY Region
ORDER BY Sales DESC;

-- --------Category KPIs--------
SELECT 
    Category,
    round(SUM(Sales),2) AS Sales,
    round(SUM(Profit),2) AS Profit,
    SUM(Quantity) AS Quantity,
    COUNT(DISTINCT Order_id) AS Orders,
    ROUND(SUM(Profit) * 100 / SUM(Sales), 2) AS Margin,
    ROUND(
        SUM(Sales) * 100 / 
        (SELECT SUM(Sales) FROM sales), 
    2) AS Sales_Share
FROM sales
GROUP BY Category
ORDER BY Sales DESC; 
 select * from sales;
 
-- ---------- Segment KPIs---------

SELECT 
    Segment,
    round(SUM(Sales),2) AS Sales,
    round(SUM(Profit),2) AS Profit,
    COUNT(DISTINCT Customer_id) AS Customers,
    COUNT(DISTINCT Order_id) AS Orders,
    ROUND(SUM(Profit) * 100 / SUM(Sales), 2) AS Margin,
    ROUND(
        SUM(Sales) * 100 / 
        (SELECT SUM(Sales) FROM sales),
    2) AS Revenue_Share,
    ROUND(
        SUM(Sales) / COUNT(DISTINCT Customer_id),
    2) AS CLV
FROM sales
GROUP BY Segment
ORDER BY Sales DESC;
-- ------------Sale Analysis.-----------
select * from sales;
-- Total Sales 
Select round(sum(sales)/1000000,2)  as Total_Sales_Mn from  sales;  # Total Sales: $2.3Mn

-- Avg Order Size
select round(avg(sales),2) as  Avg_Order_Size from sales; #  Avg Order Size:$229.48,

--  Sales by Region
select  region,round(sum(sales),2)  as Total_Sale_$ from sales
group by region
order by Total_Sale_$ desc;

-- ------PROFIT ANALYSIS ------
 -- Total Profit
 select round(sum(profit)/1000,2) as Total_Sales_K_$ from Sales;  #Total Profit: $286.6K
 
 -- Profit Margin 
  select round(sum(profit)*100/sum(sales),2) as Profit_Margin from Sales; #Profit Margin: 12.47%
  
  -- Profit by Sub-Category
  select sub_category,round(sum(profit),2) as Profit  from sales
  group by sub_category 
  order by profit desc;
  
-- --------- CUSTOMER ANALYSIS-----------
select segment,round(sum(sales),2)
 as Sales from sales
group by segment
order by sales desc;  

-- Top 10 customers
 select customer_name,round(sum(sales),2) as  Sales from Sales 
 group by customer_name 
 order by Sales desc
 limit 10;
 
 -- --------------- PRODUCT ANALYSIS ----------
 -- Top 10 products by sale-
 select product_name,round(sum(sales),2) as  Sales from Sales 
 group by Product_name
 order by Sales desc
 limit 10;
 
 -- Category + Sub-Category breakdown 
select Category,Sub_category,round(sum(sales),2) as  Sales from Sales 
 group by Category,Sub_category
 order by Sales desc;
 
 -- ---------- SHIPPING ANALYSIS-------------
--  Avg shipping days per mode
select  ship_mode,round(avg(ship_days),1) as Avg_Ship_Days from sales
group by ship_mode 
order by avg_ship_days asc; 

 -- Orders with unusually long shipping (> 7 days).
 select count(*) as  count  from sales 
 where ship_days >7; #  Orders with unusually long shipping (> 7 days):2 Orders
 
 -- ---------- DISCOUNT IMPACT----------------
 select customer_Name,product_name,
 case 
    when discount=0 then "No discount"
    when discount>0  and discount <= 0.2 then "low(0-20%)"
    when discount>0.2  and discount <= 0.4 then "Mid(20-40%)"
    when discount>0.4  and discount <= 1.0 then "High(>40%)"
    end as  disount_bin
    from sales;
 
SELECT 
    CASE 
        WHEN discount = 0 THEN 'No discount'
        WHEN discount > 0 AND discount <= 0.2 THEN 'Low (0-20%)'
        WHEN discount > 0.2 AND discount <= 0.4 THEN 'Mid (20-40%)'
        WHEN discount > 0.4 AND discount <= 1.0 THEN 'High (>40%)'
    END AS discount_bin, 
    ROUND(AVG(sales), 2) AS avg_sales,
    ROUND(AVG(profit), 2) AS avg_profit
FROM sales
GROUP BY discount_bin;

-- ----------------- TIME SERIES + YoY GROWTH--------------------------
select year,Month_name,round(sum(sales),2) as  Sales  from sales
group by year,month_name 
order by year ,month(month_name);

-- Monthly wise- Sales 
select Month_name ,round(sum(sales),2) as  Sales  from sales
group by month_name
order by Month(month_name) ;

 -- Monthly wise- profit 
select Month_name ,round(sum(profit),2) as  profit  from sales
group by month_name
order by Month(month_name);
 
 -- top  Yearly  wise order by customers
SELECT *
FROM (
    SELECT 
        YEAR(order_date) AS order_year,
        customer_name,
        COUNT(DISTINCT order_id) AS order_count,
        RANK() OVER (
            PARTITION BY YEAR(order_date) 
            ORDER BY COUNT(DISTINCT order_id) DESC
        ) AS rnk
    FROM sales
    GROUP BY YEAR(order_date), customer_name
) t
WHERE rnk <= 1;

-- Year-over-Year Growth (%):
select year,round(sum(sales) ,2) as Sales ,round(sum(profit),2) as  Profit  
from sales 
group by year
order by year; 
SELECT 
    year,
    ROUND(SUM(sales), 2) AS sales,
    ROUND(SUM(profit), 2) AS profit,

    -- YoY Sales Growth %
    ROUND(
        (SUM(sales) - LAG(SUM(sales)) OVER (ORDER BY year)) 
        / LAG(SUM(sales)) OVER (ORDER BY year) * 100, 
    2) AS yoy_sales_growth,

    -- YoY Profit Growth %
    ROUND(
        (SUM(profit) - LAG(SUM(profit)) OVER (ORDER BY year)) 
        / LAG(SUM(profit)) OVER (ORDER BY year) * 100, 
    2) AS yoy_profit_growth

FROM sales
GROUP BY year
ORDER BY year;

-------- DESCRIPTIVE STATISTICS---------
SELECT 
    'Sales' AS column_name,
    COUNT(Sales) AS count,
    ROUND(AVG(Sales), 3) AS mean,
    ROUND(STDDEV(Sales), 3) AS std_dev,
    ROUND(MIN(Sales), 3) AS min,
    ROUND(MAX(Sales), 3) AS max,
    ROUND((STDDEV(Sales) / AVG(Sales)) * 100, 2) AS cv_percent
FROM sales

UNION ALL

SELECT 
    'Quantity',
    COUNT(Quantity),
    ROUND(AVG(Quantity), 3),
    ROUND(STDDEV(Quantity), 3),
    ROUND(MIN(Quantity), 3),
    ROUND(MAX(Quantity), 3),
    ROUND((STDDEV(Quantity) / AVG(Quantity)) * 100, 2)
FROM sales

UNION ALL

SELECT 
    'Discount',
    COUNT(Discount),
    ROUND(AVG(Discount), 3),
    ROUND(STDDEV(Discount), 3),
    ROUND(MIN(Discount), 3),
    ROUND(MAX(Discount), 3),
    ROUND((STDDEV(Discount) / AVG(Discount)) * 100, 2)
FROM sales

UNION ALL

SELECT 
    'Profit',
    COUNT(Profit),
    ROUND(AVG(Profit), 3),
    ROUND(STDDEV(Profit), 3),
    ROUND(MIN(Profit), 3),
    ROUND(MAX(Profit), 3),
    ROUND((STDDEV(Profit) / AVG(Profit)) * 100, 2)
FROM sales;


--                                                       --------happy Learning---------------