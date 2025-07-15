create database pizza_db;
use pizza_db;

select round(sum(total_price),2) as Total_Revenue from pizza_sales;

select sum(total_price) / count(distinct order_id) from pizza_sales as avg_order_value;

select sum(quantity) from pizza_sales;

select count(distinct order_id) from pizza_sales;

select sum(quantity)/count(distinct order_id) from pizza_sales as Average_pizza_per_order;

SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) as order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
WHERE DATE(STR_TO_DATE(order_date, '%d-%m-%Y')) BETWEEN '2015-01-01' AND '2015-07-31' AND order_date IS NOT NULL
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY FIELD(order_day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');


select monthname(str_to_date(order_date, '%d-%m-%Y')) as Months, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
WHERE DATE(STR_TO_DATE(order_date, '%d-%m-%Y')) BETWEEN '2015-01-01' AND '2015-12-31' AND order_date IS NOT NULL
GROUP BY monthname(STR_TO_DATE(order_date, '%d-%m-%Y'))
order by 1;


select pizza_category, sum(total_price) from pizza_sales
group by pizza_category; 

select pizza_size, sum(total_price) from pizza_sales
group by pizza_size; 

select pizza_name, count(distinct order_id)
from pizza_sales
group by pizza_name
order by count(distinct order_id) desc limit 5;
