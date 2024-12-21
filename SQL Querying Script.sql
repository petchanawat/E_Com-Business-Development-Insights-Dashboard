-- Create view that contains 1 table containing necessary columns that can easily streamline to Business Intelligence tool

CREATE VIEW `hopeful-host-444215-j3.e_commerce_dataset.e_commerce_data_bi_dashboard` AS

WITH logistics_leadtime_data AS (
  SELECT 
    ship_mode, -- Shipping mode
    APPROX_QUANTILES(DATETIME_DIFF(ship_date, order_date, DAY), 100)[OFFSET(50)] AS leadtime_expected -- Use median leadtime for each shipping mode to estimate expected leadtime for each
  FROM `hopeful-host-444215-j3.e_commerce_dataset.e_commerce_dataset_table`
  GROUP BY ship_mode
)

SELECT 
  main.*,
  
  -- Extracted Date Information
  EXTRACT(MONTH FROM main.order_date) AS order_month, -- Extract month number from order datetime column
  EXTRACT(YEAR FROM main.order_date) AS order_year, -- Extract year from order datetime column
  EXTRACT(MONTH FROM main.ship_date) AS ship_month, -- Extract month number from delivering datetime column
  EXTRACT(YEAR FROM main.ship_date) AS ship_year, -- Extract year from delivering datetime column
  
  -- Month and Year Formatting
  FORMAT_DATETIME('%b %Y', DATETIME(main.order_date)) AS month_year, -- Create column contain month and year of order datetime (e.g. 'Jan 2011')
  EXTRACT(YEAR FROM DATETIME(main.order_date)) * 100 + EXTRACT(MONTH FROM DATETIME(main.order_date)) AS sort_column_month_year, -- Create column that be used for sorting month_year in Business Intelligence tool 
  
  -- Logistics Lead Time
  DATETIME_DIFF(main.ship_date, main.order_date, DAY) AS logistics_leadtime, -- Logistics leadtime calculated by ship_date minus order_date
  logistics_leadtime_data.leadtime_expected AS expected_leadtime, -- Use median leadtime for each shipping mode to estimate expected leadtime for each
  
  -- Discount Metrics
  CASE
    WHEN main.percent_discount > 0 THEN 1
    ELSE 0
  END AS have_discount, -- 1 means order was applied discount but 0 means no discount applied
  CASE
    WHEN main.percent_discount > 0 THEN 'Discounted Order'
    ELSE 'None-Discounted Order'
  END AS have_discount_name, -- Name the category of discount to Discounted Order, None-Discounted Order
  ROUND(main.percent_discount * 100, 1) AS percent_discount_percent, -- Turn discountlike 0.2 (20%) to 20 that will use like category column 
  main.percent_discount * main.sales AS discount_amount -- Discount amount that subsidize the price that customers have to pay

FROM 
  `hopeful-host-444215-j3.e_commerce_dataset.e_commerce_dataset_table` AS main

LEFT JOIN 
  logistics_leadtime_data
ON 
  main.ship_mode = logistics_leadtime_data.ship_mode
