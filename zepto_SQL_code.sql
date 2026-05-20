drop table if exists zepto;

create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discount_percent NUMERIC(5,2),
available_quantity INTEGER,
discounted_selling_price NUMERIC(8,2),
weight_in_gms INTEGER,
out_of_stock BOOLEAN,
quantity INTEGER
);


-- DATA EXPLORATION

-- COUNT OF ROWS
SELECT COUNT(*)
FROM zepto;


-- SAMPLE DATA
SELECT * FROM zepto
limit 10;


-- NULL VALUES
SELECT * FROM zepto
WHERE name is NULL
OR
category is NULL
OR 
mrp is NULL
OR 
discount_percent is NULL
OR 
discounted_selling_price is NULL
OR 
weight_in_gms is NULL
OR 
available_quantity is NULL
OR 
out_of_stock is NULL
OR 
quantity is NULL;


-- different product categories
select distinct category
from zepto
order by category;


-- products in stock vs outof stock
select out_of_stock, count(sku_id)
from zepto
group by out_of_stock;


-- product names present multiple times
select name, count(sku_id) as "no. of SKUs"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc


-- data cleaning

-- products with price=0
select * from zepto 
where mrp=0 or discounted_selling_price=0;

delete from zepto
where mrp=0;


-- convert paise to rupees
update zepto
set mrp = mrp/100.0,
discounted_selling_price = mrp/100.0;

select * from zepto


 --data analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.

select distinct name, mrp, discount_percent
from zepto
order by discount_percent desc
limit 10;


--Q2.What are the Products with High MRP but Out of Stock

select distinct name, mrp
from zepto
where out_of_stock is TRUE and mrp>300
order by mrp desc;


--Q3.Calculate Estimated Revenue for each category

select category,
sum(discounted_selling_price * available_quantity) as total_revenue
from zepto
group by category
order by total_revenue;


-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.

select distinct name, mrp, discount_percent
from zepto
where mrp>500 and discount_percent<10
order by mrp desc, discount_percent desc; 


-- Q5. Identify the top 5 categories offering the highest average discount percentage.

select category, ROUND(AVG(discount_percent),2) as avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;


-- Q6. Find the price per gram for products above 100g and sort by best value.

select distinct name, weight_in_gms, discounted_selling_price,
ROUND(discounted_selling_price/weight_in_gms,2) as price_per_gm
from zepto
where weight_in_gms>=100
order by price_per_gm;


--Q7.Group the products into categories like Low, Medium, Bulk.

select distinct name, weight_in_gms,
case when weight_in_gms <1000 then 'low'
     when weight_in_gms<5000 then 'medium'
	 else 'bulk'
	 end as weight_category
from zepto;


--Q8.What is the Total Inventory Weight Per Category 

select category,
sum(weight_in_gms *available_quantity) as total_weight
from zepto
group by category
order by total_weight;