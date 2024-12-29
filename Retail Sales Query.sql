CREATE DATABASE sql_project_p2;
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );
select * from retail_sales;

#To check the count of columns
select count(*) from retail_sales;


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from retail_sales
where sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
SELECT * 
FROM retail_sales
WHERE category = 'Clothing'
  AND YEAR(STR_TO_DATE(sale_date, '%Y-%m-%d')) = 2022
  AND MONTH(STR_TO_DATE(sale_date, '%Y-%m-%d')) = 11
  AND quantity >= 4;

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select category, sum(total_sale) as net_sale,
count(*) as total_orders
from retail_sales
group by 1;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select 
round(avg(age), 2) as avg_age
from retail_sales
where category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
Select * from retail_sales
where total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select category, gender,
count(*) as total_trans
from retail_sales
group by category, gender
order by category;

-- Q.7 Write a SQL query to find the top 5 customers based on the highest total sales 
select customer_id,
sum(total_sale) as total_sales
from retail_sales
group by 1
order by 2 desc
limit 5;

-- Q.8 Write a SQL query to find the number of unique customers who purchased items from each category.
select category,
count(distinct customer_id) as cnt_unique_cs
from retail_sales
group by category
order by 2 desc;