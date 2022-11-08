
SELECT *
FROM PortfolioProject.dbo.supermarketsales
ORDER BY date;

 -- Which branch makes most out of gross income



SELECT branch, city, SUM("gross income") AS total_gross_income_per_branch
FROM PortfolioProject.dbo.supermarketsales
GROUP BY branch, city
ORDER BY branch;
 -- Branch C makes most out of gross income

 -- Corelation between rating and gross income (Tableau)
 -- No absolute correlation between rating and gross income

 -- 4. Member vs nonmember on spending comparision with each branch
 SELECT branch, [customer type], SUM(total) AS total_cust_type_spent_branch
 FROM PortfolioProject.dbo.supermarketsales
 GROUP BY "customer type", branch
 ORDER BY "customer type";
 -- We will compare values with plots in Tableau

 -- 5. Member vs nonmember on spending comparision total 3 branches
  SELECT "customer type", SUM(total) AS total_cust_type_spent
 FROM PortfolioProject.dbo.supermarketsales
 GROUP BY "customer type";
 -- Member spend more than non-member

 -- 6.Which product line got bought the most
SELECT DISTINCT "product line", SUM(quantity) AS num_product_sold
FROM PortfolioProject.dbo.supermarketsales
GROUP BY "product line"
ORDER BY  num_product_sold;
-- Electronic accessories sold the most

 -- 7. Correlation between price per item and quantity buy 
 SELECT DISTINCT "product line", "unit price", SUM(quantity) AS num_product_sold
FROM PortfolioProject.dbo.supermarketsales
GROUP BY "product line","unit price"
ORDER BY "product line";


 -- 8. Which product makes most profit
SELECT DISTINCT "product line", SUM("gross income") AS profit_per_product
FROM PortfolioProject.dbo.supermarketsales
GROUP BY "product line"
ORDER BY profit_per_product;
-- Food and beverages makes the most profit per product line

 -- Female vs Male on spending
 SELECT gender, COUNT(gender) as num_gender, SUM("gross income") AS profit_per_gender
FROM PortfolioProject.dbo.supermarketsales
GROUP BY gender
ORDER BY gender;
-- More female shop and spend more money

 -- which product line female bought the most
 -- Which product line male bought the most

 SELECT DISTINCT "product line", SUM(quantity) AS num_product_sold, gender
FROM PortfolioProject.dbo.supermarketsales
WHERE gender = 'female'
GROUP BY "product line", gender
ORDER BY num_product_sold DESC;
-- Female bought fashion and accessories the most frequently

SELECT DISTINCT "product line", SUM(quantity) AS num_product_sold, gender
FROM PortfolioProject.dbo.supermarketsales
WHERE gender = 'male'
GROUP BY "product line", gender
ORDER BY num_product_sold DESC;
-- Male bought health and beauty the most frequently

 -- Plot of sales over time for each brand and total sales over time (Tableau)

 -- Most chosen type of payment
  SELECT payment, COUNT(payment) AS payment_count
FROM PortfolioProject.dbo.supermarketsales
GROUP BY payment;
-- People use Ewallet the most to pay

 -- which products bought the most at each branch based on quantity
SELECT DISTINCT "product line", branch, SUM(quantity) AS quantity_sold
FROM PortfolioProject.dbo.supermarketsales
GROUP BY "product line", branch;
-- Electronic Accessories sold the most in each branch

-- Branch with highest average rating
SELECT branch, city, AVG(rating) AS avg_rating
FROM PortfolioProject.dbo.supermarketsales
GROUP BY branch, city;
--Branch A has highest rating

-- Average Rating for each product line
SELECT DISTINCT "product line", AVG(rating) AS avg_rating_product
FROM PortfolioProject.dbo.supermarketsales
GROUP BY "product line"
ORDER BY avg_rating_product;