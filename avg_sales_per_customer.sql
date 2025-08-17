-- File: queries/avg_sales_per_customer.sql

WITH CustomerSales AS (
    SELECT customer_id, SUM(sale_amount) AS total_sales
    FROM sales
    GROUP BY customer_id
),
AverageSales AS (
    SELECT AVG(total_sales) AS avg_sales
    FROM CustomerSales
)
SELECT customer_id, total_sales
FROM CustomerSales
WHERE total_sales > (SELECT avg_sales FROM AverageSales);
