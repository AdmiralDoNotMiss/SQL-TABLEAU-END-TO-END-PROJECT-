
-- KPI'S 
-- 1. TOTAL REVENUE 

SELECT SUM(total_price) as total_revenue 
FROM pizza_sales;


-- 2. AVERAGE ORDER VALUE

SELECT AVG(total_price) AS avg_order_value
FROM(
SELECT order_id, SUM(total_price) as total_price
FROM pizza_sales
GROUP BY order_id
) A;


-- 3. TOTAL PIZZA SOLD 

SELECT SUM(quantity) as total_quantity
FROM pizza_sales;


-- 4. TOTAL NO. OF ORDERS 

SELECT COUNT(DISTINCT order_id) as total_orders 
FROM pizza_sales ;


-- 5. AVERAGE PIZZAS PER ORDER 

SELECT SUM(quantity)/ COUNT(DISTINCT order_id) AS avg_pizzas_per_order
FROM pizza_sales ;

-- HOURLY TREND FOR TOTAL PIZZAS SOLD

SELECT HOUR(order_time) as order_hours, SUM(quantity) as total_pizzas_sold
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY order_hours ASC;


-- WEEKLY TREND FOR ORDERS

SELECT WEEK(order_date ) as WeekNumber ,
	   YEAR(order_date) as Year ,
       COUNT(DISTINCT order_id) as Total_orders
FROM pizza_sales
GROUP BY  WEEK(order_date),YEAR(order_date) ;

-- % OF SALES VY PIZZA'S CATEGORY

SELECT pizza_category,SUM(total_price) as total_revenue,
ROUND(100.0*SUM(total_price)/(SELECT SUM(total_price) FROM pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_category;


-- % OF SALES BY PIZZA'S SIZE

SELECT pizza_size, SUM(total_price) as total_revenue, 
ROUND(100.0*SUM(total_price)/(SELECT SUM(total_price) FROM pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC;


-- TOTAL PIZZAS SOLD BY PIZZA CATEGORY

SELECT pizza_category , SUM(quantity) as total_quantity_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_quantity_sold DESC;


-- TOP 5 PIZZAS BY REVENUE

SELECT pizza_name, SUM(total_price) as total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue DESC
LIMIT 5;


-- BOTTOM 5 PIZZAS BY REVENUE

SELECT pizza_name , SUM(total_price) as total_revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_revenue ASC 
LIMIT 5;

-- TOP 5 PIZZAS BY QUANTITY 

SELECT pizza_name , SUM(quantity) as total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity DESC
LIMIT 5;


-- BOTTOM 5 PIZZAS BY QUANTITY

SELECT pizza_name , SUM(quantity)as total_quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity ASC
LIMIT 5;


-- TOP 5 PIZZAS BY TOTAL ORDERS 


SELECT pizza_name , COUNT(DISTINCT order_id) as total_orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_orders DESC
LIMIT 5;


-- BOTTOM 5 PIZZAS BY TOTAL ORDERS 

SELECT pizza_name , COUNT(DISTINCT order_id) as total_orders
FROM pizza_sales
GROUP BY pizza_name 
ORDER BY total_orders asc
LIMIT 5;


