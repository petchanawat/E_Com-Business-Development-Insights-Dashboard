# E-Commerce Business Development Insights Dashboard
### Overview
![image](https://github.com/user-attachments/assets/f2ff912a-ce8c-4abb-b6d9-430ed2f14cf8)

In the highly competitive e-commerce market, companies must align strategies from top management to employees handling routine tasks to achieve key goals like cost optimization, sales growth, and enhanced customer satisfaction.

Business Intelligence dashboards are essential tools to unify efforts by providing real-time, dynamic KPI tracking and performance insights. These dashboards help identify gaps and opportunities for improvement and growth, as demonstrated in this project.

### Project Objectives
	
#### 1. Analyze Sales and Profitability
Provide an overview of sales and profitability across key focus areas to develop strategies that increase revenue.

#### 2. Optimize Shipping Efficiency
Reduce shipping costs and delivery lead times by analyzing shipping modes, order priorities, and locations. Recommend tailored shipping strategies for different products.

#### 3. Refine Discount Strategies
Assess the impact of discounts on sales, profitability, customer acquisition, and product units sold to improve discounting policies.

#### 4. Identify High-Potential Markets
Highlight markets, regions, and countries with high sales potential and profit margins. Analyze performance trends, monthly sales growth, and sub-category contributions.

#### 5. Improve Product Performance
Identify best-selling products, optimize inventory, and phase out low-performing items. Track monthly growth in units sold to enhance inventory management.

#### 6. Focus on High-Value Customers
Analyze high-value and new customers, order rates, and annual customer trends based on sales, profit, and order counts. Monitor monthly customer growth percentages to create targeted retention strategies.


### Dataset Description

| Column Name        | Description                           | Example               | Type     |
|--------------------|---------------------------------------|-----------------------|----------|
| row_id             | ID of the row in the dataset          | 48910, 48911          | INTEGER  |
| order_id           | ID of the sales order                 | SL-2014-420, SL-2011-6640 | STRING   |
| order_date         | Date the order was placed             | 2011-01-01, 2014-12-12 | DATE     |
| ship_date          | Date the goods were shipped           | 2011-01-01, 2014-12-12 | DATE     |
| ship_mode          | Mode of shipping                      | First Class, Same Day | STRING   |
| customer_id        | Unique ID of the customer             | MH-8115, SW-10350     | STRING   |
| customer_name      | Name of the customer                  | Mick Hernandez, Sally Hughsby | STRING   |
| segment            | Customer segment                     | Consumer, Corporate   | STRING   |
| city               | City of the customer                  | Zurich, Aksaray       | STRING   |
| state              | State of the customer                 | West Virginia, Wales  | STRING   |
| country            | Country of the customer               | Thailand, Belgium     | STRING   |
| market             | Customer's market                    | APAC, EU              | STRING   |
| postal_code        | Postal code of the customer           | 7960, 8302           | INTEGER  |
| region             | Region of the customer                | Southeast Asia, Africa | STRING   |
| product_id         | Unique ID of the product              | FUR-ADV-10001440, FUR-ADV-10001659 | STRING   |
| category           | Category of the product               | Office Supplies, Furniture | STRING   |
| sub_category       | Sub-category of the product           | Copiers, Phones       | STRING   |
| product_name       | Name of the product                   | DIXON Oriole Pencils  | STRING   |
| sales              | Revenue from the order                | 22638.48, 10499.97   | FLOAT    |
| quantity           | Quantity of units sold                | 3, 7                 | INTEGER  |
| percent_discount   | Discount percentage applied           | 0.4, 0.8             | FLOAT    |
| shipping_cost      | Cost of shipping                      | 644.75, 725.34       | FLOAT    |
| profit             | Profit from the order                 | 2461.32, 4946.37     | FLOAT    |
| order_priority     | Priority level of the order           | Low, Critical         | STRING   |

24 Columns x 51,290 Rows from
Dataset source: [Kaggle Dataset: E-commerce website sales data](https://www.kaggle.com/datasets/sivm205/e-commerce-website-sales-data).


### Data Analysis Processes


![Flowchart (1)](https://github.com/user-attachments/assets/2d6771cb-897a-43ba-8186-30291cb2580f)
*The data analysis processes workflow diagram*



#### 1. Upload Data to Serverless Data Warehouse
Create a dataset in Google Cloud BigQuery and upload the data in CSV format. Review the schema, details, and preview the data to understand its structure and key attributes before starting analysis.

#### 2. Data Querying using SQL
Use SQL to summarize numerical columns and describe categorical data. Create views to manage and organize essential columns for data modeling, ensuring a streamlined and simplified structure for Business Intelligence tools.
[SQL Querying Script](https://google.co.th)

#### 3. Data Modeling


#### 4. Data Analysis


#### 5. Data Visualization


#### 6. Findings & Insights Report

