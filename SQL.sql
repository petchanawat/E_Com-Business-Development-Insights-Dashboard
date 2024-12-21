-- Create a view for sales data
CREATE VIEW sales_overview AS
SELECT
    order_id,
    customer_id,
    product_id,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM
    sales_data
GROUP BY
    order_id, customer_id, product_id;
