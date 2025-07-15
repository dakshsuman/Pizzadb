# Pizza Sales Data Analysis Project
## Overview

This project analyzes pizza sales data to uncover insights into revenue, order patterns, and customer preferences. Using a dataset of pizza sales, this repository provides a comprehensive analysis with visualizations, SQL queries, and a detailed report to help understand sales performance, popular pizza categories, and trends over time.

### Project Structure
[pizza_sales.csv](https://github.com/dakshsuman/Pizzadb/blob/main/pizza_sales.csv): Contains detailed sales data, including pizza types, quantities, prices, and order dates.

[pizza_db.sql](https://github.com/dakshsuman/Pizzadb/blob/main/pizza_db.sql): SQL queries to calculate key metrics such as total revenue, average order value, and top-selling pizzas.

[pizzabd_report.pdf](https://github.com/dakshsuman/Pizzadb/blob/main/pizzabd_report.pdf): A summarized report of the analysis.

### Key Features

***Total Revenue Calculation***: Computes the total revenue generated from pizza sales.

***Average Order Value***: Analyzes the average spend per order.

***Pizza Popularity***: Identifies the top 5 most ordered pizzas.

***Sales by Category and Size***: Breaks down revenue by pizza category (e.g., Classic, Veggie) and size (e.g., Small, Medium, Large).

***Temporal Analysis***: Examines order trends by day of the week and month for 2015.

***Visualizations***: Includes charts for revenue distribution, order patterns, and pizza preferences (see report for details).

### Analysis Highlights

Revenue Insights: The dataset reveals significant revenue from high-demand pizzas like "The Italian Supreme Pizza" and "The Five Cheese Pizza."

Order Patterns: Fridays and Saturdays show peak order volumes, indicating higher demand on weekends.

Popular Pizzas: The top 5 pizzas by order count include a mix of Classic and Supreme categories, reflecting diverse customer tastes.

Interesting Fact: The "Brie Carre Pizza," despite its higher price point ($23.65 for a small), appears in orders, suggesting a niche demand for premium offerings.

## SQL Queries

```sql
select round(sum(total_price),2) as Total_Revenue from pizza_sales;
```
```sql
select sum(total_price) / count(distinct order_id) from pizza_sales as avg_order_value;
```
```sql
select sum(quantity) from pizza_sales;
```
```sql
select count(distinct order_id) from pizza_sales;
```
```sql
select sum(quantity)/count(distinct order_id) from pizza_sales as Average_pizza_per_order;
```
```sql
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) as order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
WHERE DATE(STR_TO_DATE(order_date, '%d-%m-%Y')) BETWEEN '2015-01-01' AND '2015-07-31' AND order_date IS NOT NULL
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY FIELD(order_day, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
```
```sql
select monthname(str_to_date(order_date, '%d-%m-%Y')) as Months, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
WHERE DATE(STR_TO_DATE(order_date, '%d-%m-%Y')) BETWEEN '2015-01-01' AND '2015-12-31' AND order_date IS NOT NULL
GROUP BY monthname(STR_TO_DATE(order_date, '%d-%m-%Y'))
order by 1;
```
```sql
select pizza_category, sum(total_price) from pizza_sales
group by pizza_category; 
```
```sql
select pizza_size, sum(total_price) from pizza_sales
group by pizza_size; 
```
```sql
select pizza_name, count(distinct order_id)
from pizza_sales
group by pizza_name
order by count(distinct order_id) desc limit 5;
```

## Visualizations
* ## **Total Orders by Month (Explained as Pie Chart)**:
- 1January has the largest slice with 2.0K orders, marking the peak start.

- May follows with a significant slice at 1.853K orders, close to the maximum.

- July contributes 1.936K orders, forming a notable slice.

- February and March have moderate slices at 1.685K and 1.840K orders, respectively.

- April, June, and August have the smallest slices at 1.799K, 1.773K, and 1.5K orders, showing a decline.

* ## **Top 5 by Revenue (Explained as Pie Chart)**:
- Barbecue Chicken takes the largest slice with the highest revenue (approx. 20K).
  
- Thai Chic holds a significant slice with around 18K revenue.

- California contributes a moderate slice at about 16K revenue.

- Classic Deluxe has a smaller slice with approximately 14K revenue.

- Spicy Italian forms the smallest slice at around 12K revenue.


<img width="1498" height="821" alt="bi1" src="https://github.com/user-attachments/assets/86673ac7-8211-42dd-a8c2-743d2c049c40" />

* ## **Bottom 5 by Revenue (Explained as Pie Chart)**:
- Brie Carre has the largest slice among worst sellers, with the least revenue (approx. 5K).
  
- Green Garden follows with a significant slice at around 6K revenue.
  
- Mediterranean contributes a moderate slice with about 7K revenue.
  
- Spinach Pesto and Spinach Supreme have smaller slices, each around 8K revenue.

* ## **Top 5 by Quantity (Explained as Bar Graph)**:
- Barbecue Chicken leads with the tallest bar, indicating the highest quantity.

- California follows with a high bar, close to Barbecue Chicken.

- Classic Deluxe has a slightly shorter bar, still significant.

- Hawaiian and Pepperoni have the shortest bars, showing lower quantities.

* ## **Bottom 5 by Quantity (Explained as Bar Graph)**:
- Brie Carre has the tallest bar among worst sellers, indicating the lowest quantity.

- Mediterranean follows with a high bar, close to Brie Carre.

- Spinach Pesto and Calabrese have slightly shorter bars, showing minimal quantities.

- Chicken Alfredo has the shortest bar, reflecting the least quantity.


<img width="1499" height="822" alt="bi2" src="https://github.com/user-attachments/assets/a1ffcbf9-df92-4f67-97a2-2b1e07183e5d" />

View the Full Power BI Dashboard here [dashboard](https://github.com/dakshsuman/Pizzadb/blob/main/pizzadb_%20dashboard.pbit)

## Contact

For questions or suggestions, reach out via GitHub Issues or email at [dakshsuman13@gmail.com].



