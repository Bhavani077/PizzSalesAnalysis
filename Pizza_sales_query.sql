select * from Pizza_Sales;

select sum(total_price) as total_Revenue
from Pizza_Sales;

select sum(total_price)/count(distinct order_id) as avg_order_value from Pizza_Sales;

select sum(quantity) as total_pizzas_sold from Pizza_Sales;

select count(distinct order_id) as total_orders from Pizza_Sales;

select sum(quantity)/count( distinct order_id) as avg_pizzas_per_order from Pizza_Sales;

---Daily trend---

select DATENAME(W,order_date) as order_day,count(distinct order_id) as total_orders
from Pizza_Sales
group by DATENAME(W,order_date);

---hourly Trend---
select Datepart(hour,order_time) as order_hrs,count(distinct order_id) as total_orders
from Pizza_Sales
group by Datepart(hour,order_time)
order by Datepart(hour,order_time);

---total_percentage_Revenue_by_category--
select pizza_category,
sum(total_price) /(select sum(total_price) from Pizza_Sales )*100 as per_Total 
from Pizza_Sales
group by pizza_category;


---Per sales by pizza size---
select pizza_size , sum(total_price) /(select sum(total_price) from Pizza_Sales )*100 as per_Total

from Pizza_Sales
group by pizza_size
order by per_total ;
