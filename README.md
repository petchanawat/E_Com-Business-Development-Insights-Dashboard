# E-Commerce Business Development Insights Dashboard
### Overview
![image](https://github.com/user-attachments/assets/f2ff912a-ce8c-4abb-b6d9-430ed2f14cf8)

In the highly competitive e-commerce market, companies must align strategies from top management to employees handling routine tasks to achieve key goals like cost optimization, sales growth, and enhanced customer satisfaction.

Business Intelligence dashboards are essential tools to unify efforts by providing real-time, dynamic KPI tracking and performance insights. These dashboards help identify gaps and opportunities for improvement and growth, as demonstrated in this project.

### Project Objectives
	
- #### 1. Analyze Sales and Profitability
Provide an overview of sales and profitability across key focus areas to develop strategies that increase revenue.

- #### 2. Optimize Shipping Efficiency
Reduce shipping costs and delivery lead times by analyzing shipping modes, order priorities, and locations. Recommend tailored shipping strategies for different products.

- #### 3. Refine Discount Strategies
Assess the impact of discounts on sales, profitability, customer acquisition, and product units sold to improve discounting policies.

- #### 4. Identify High-Potential Markets
Highlight markets, regions, and countries with high sales potential and profit margins. Analyze performance trends, monthly sales growth, and sub-category contributions.

- #### 5. Improve Product Performance
Identify best-selling products, optimize inventory, and phase out low-performing items. Track monthly growth in units sold to enhance inventory management.

- #### 6. Focus on High-Value Customers
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
[SQL Querying Script](https://github.com/petchanawat/E_Com-Business-Development-Insights-Dashboard/blob/main/SQL%20Querying%20Script.sql)

```sql
-- Discount Metrics (Sample)
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
```

#### 3. Data Modeling
Define essential columns and measures using DAX (Data Analysis Expressions) to enable in-depth analysis and meaningful visualizations. Organize and manipulate data in Power BI's Data view to ensure accuracy and alignment with reporting requirements. [Column DAX Script](https://github.com/petchanawat/E_Com-Business-Development-Insights-Dashboard/blob/main/Column%20DAX%20Script.dax) and [Measure DAX Script](https://github.com/petchanawat/E_Com-Business-Development-Insights-Dashboard/blob/main/Measure%20DAX%20Script.dax) 

```dax
-- Number of new customer that be attracted by discount (Sample)
new_customers_discount = 
CALCULATE(
    DISTINCTCOUNT(e_commerce_data_bi_dashboard[customer_id]),
    FILTER(
        e_commerce_data_bi_dashboard,
        e_commerce_data_bi_dashboard[first_purchase_with_discount] = 1
    )
)
```

#### 4. Data Analysis

- ##### 4.1 Define Yearly Targets
Utilize historical data to set clear annual targets focused on sales growth, profitability, and business expansion. Understand the target audience and market opportunities to identify new growth paths, form partnerships, and add value to the company.

- ##### 4.2 Analyze Key Business Problems
Examine data to address specific challenges, uncovering root causes and formulating solutions. Focus on solving issues related to sales, profitability, shipping efficiency, and customer retention.

- ##### 4.3 Identify New Opportunities
Highlight areas for growth by analyzing emerging trends, market gaps, and untapped segments. Emphasize opportunities that align with the company's long-term goals.

- ##### 4.4 Evaluate KPIs and Targets
Break down data by key performance indicators (KPIs) such as sales revenue, profit margins, and customer acquisition metrics. Align analysis with strategic objectives and track progress against defined targets.

- ##### 4.5 Root Cause Analysis with Visualizations
Dive deeper into business challenges by using fast and interactive Power BI visualizations. This approach helps uncover trends, outliers, and patterns, enabling actionable insights.


#### 5. Data Visualization

- ##### 5.1 Create Interactive Dashboards
Design dynamic dashboards in Power BI that allow users to interact with the data seamlessly. Focus on creating visuals that are user-friendly and easy to navigate. [Power BI Dashboard Photos](https://github.com/petchanawat/E_Com-Business-Development-Insights-Dashboard/tree/main/PowerBI%20Dashboard%20Photos)
![powerbi_20241223_page-0002](https://github.com/user-attachments/assets/2e9e277f-3d97-4e5c-9c36-0447e574bf65)
*The Logistics dashboard*

- ##### 5.2 Align Dashboards with Objectives
Ensure dashboards are tailored to meet project objectives, providing clear insights into sales growth, profitability, shipping efficiency, and customer trends.

- ##### 5.3 Highlight Key Focus Areas
Present data in a way that highlights critical areas, such as high-potential markets, best-selling products, and high-value customers. Use visuals to emphasize areas requiring action.

- ##### 5.4 Simplify Data Interpretation
Use clear, concise visuals to ensure users can quickly understand trends, patterns, and outliers. Avoid overloading dashboards with unnecessary details.

- ##### 5.5 Drive Fast Decision-Making
Enable quick decision-making by providing actionable insights through interactive filters, drill-down capabilities, and real-time updates.


#### 6. Findings & Insights Report
This project uncovered critical insights into the e-commerce business, highlighting areas for improvement and growth opportunities:

- ##### 6.1 Sales and Profitability

  * **Situation:** Analyzed sales and profitability trends from 2011 to 2014 to provide actionable insights for top management. The objective was to set realistic yearly targets and align strategic goals with operational execution across all levels of the organization.

  * **Task:** Identify key revenue and profit drivers, as well as underperforming areas, to assist in setting achievable goals and developing strategies for improvement.

  * **Action:** 
    - Conducted year-over-year sales growth analysis, revealing an average growth rate of 23.98%.
    - Identified key performance trends:
      - **Customer Segments:** Consumers were the top revenue contributors, while the Home Office segment underperformed.
      - **Product Categories:** Office Supplies drove the highest unit sales, while Copiers, Phones, and Bookcases were the most profitable subcategories.
      - **Geographies:**
        - **Top Revenue Countries:** United States, Australia, and France (in descending order).
        - **Top Revenue States:** England, California, and Île-de-France (in descending order).
    - Created visual trends for monthly revenue and sales orders to pinpoint seasonality and demand fluctuations.

  * **Result:** 
    - Delivered actionable insights that helped set clear sales and profitability targets for the next year.
    - Enabled top management to establish a baseline for monitoring performance and launch strategic interventions when targets are unmet.
    - Enhanced organizational alignment by connecting top-level strategy with employee-level execution to ensure routine tasks contribute to overarching business goals.

- ##### 6.2 Shipping Efficiency

  * **Situation:** Evaluated shipping performance data from 2011 to 2014 to address rising inefficiencies and declining on-time delivery rates. The goal was to identify key issues and propose strategies for improvement while aligning goals across the organization.

  * **Task:** Analyze shipping costs, delivery lead times, and on-time performance to identify areas for optimization and provide actionable insights to improve operational efficiency.

  * **Action:** 
    - Analyzed key shipping metrics:
      - Year-over-year shipping cost per order showed a slight decline of -1.053%, with an average lead time of 4 days remaining stable.
      - On-time delivery rates decreased, requiring recovery to the best year’s performance of 68.25%.
    - Identified key trends and challenges:
      - **Shipping Modes:** Standard class accounted for the highest total shipping costs, while same-day delivery had the lowest delay rates, and second-class shipping experienced the most delays.
      - **Geographies:** Lesotho, Montenegro, and Taiwan had the highest delay percentages.
      - **Products:** Highlighted products with the highest delay rates, ranked from worst to best.
    - Visualized trends:
      - Monthly total shipping costs and on-time percentages by shipping mode using stacked color charts.
      - Monthly average shipping costs and lead times per order to track performance fluctuations.

  * **Result:** 
    - Provided actionable insights that enabled top management to set measurable goals for reducing delays and improving efficiency.
    - Established baselines for tracking progress and aligning operational tasks with strategic objectives.
    - Delivered clarity on improvement opportunities, empowering teams to focus on high-impact changes to enhance shipping reliability.

- ##### 6.3 Discount Strategies

  * **Situation:** Analyzed discounting trends from 2011 to 2014 to identify key drivers of revenue, customer acquisition, and product sales. The objective was to provide strategic insights on how to optimize discount offers and align them with business goals.

  * **Task:** Identify which discount strategies contributed most to revenue generation, customer acquisition, and unit sales to refine pricing strategies and boost business performance.

  * **Action:** 
    - Evaluated discount performance:
      - **Revenue:** Furniture products generated the highest revenue from discounted orders.
      - **Discount Types:**
        - Top revenue-generating discounts: 10%, 20%, and 40%.
        - Leading discount types for customer acquisition: 20%, 60%, and 70%.
        - Top discount types driving product sales: 20%, 10%, and 40%.
    - Created visualizations to track key metrics:
      - Monthly trends of total profit and average order value from discounted orders.
      - Revenue and attachment rate trends month-over-month.
      - Customer acquisition and revenue from first-time purchases by month.
      - Product units sold from discounted orders and percentage of discounted units sold compared to total units sold by month.

  * **Result:** 
    - Provided actionable insights that helped refine discounting strategies for better targeting of high-value customers and improving sales efficiency.
    - Created performance benchmarks for monthly tracking, helping management monitor progress towards discount-related goals.
    - Supported the alignment of pricing strategies with business targets, enabling more effective decision-making and resource allocation.

- ##### 6.4 High-Potential Markets

  * **Situation:** Conducted an analysis of market performance from 2011 to 2014 to identify high-potential regions and markets that could drive future business growth. The goal was to offer insights to the management team on where to focus efforts to maximize profitability.

  * **Task:** Identify key markets, regions, and countries with the highest revenue generation potential, and determine which areas are underperforming to adjust future business strategies accordingly.

  * **Action:** 
    - Analyzed market performance data:
      - **Profit Margin:** Discovered an average profit margin increase of 2.14% year-over-year, providing a baseline for setting future profit targets.
      - **Revenue Drivers:**
        - Top revenue-generating markets: APAC, EU, and the US.
        - Top regions by revenue: Central, South, and North.
        - Top countries by revenue: United States, Australia, and France.
    - Visualized key trends:
      - Monthly revenue and sales order trends.
      - Monthly profit and sales order trends.
      - Monthly growth in revenue (month-over-month).
      - Revenue distribution across product subcategories.

  * **Result:** 
    - Provided actionable insights into the performance of key markets, helping the management team focus on the most profitable regions and countries.
    - Enabled the setting of realistic revenue and profit targets for the upcoming year, ensuring alignment between business objectives and execution.
    - Established a monthly tracking system to monitor market performance and support timely decision-making for future growth strategies.

- ##### 6.5 Product Performance

  * **Situation:** Analyzed product sales data from 2011 to 2014 to assess the performance of different product categories, subcategories, and individual items. The goal was to identify high-performing products and inform business strategies for growth.

  * **Task:** Determine which product categories, subcategories, and specific items are the most popular and generate the highest sales volume. This information would support decisions on inventory management, sales strategies, and promotional activities.

  * **Action:** 
    - Conducted an analysis to identify:
      - **Top Product Categories:** Office supplies ranked as the highest in total units sold.
      - **Top Subcategories:** Binders, storage, and art were the highest in unit sales.
      - **Top-Selling Products:** Staples, Cardinal Index Tab Clear, and Eldon File Cart (single width) showed the highest sales volume.
    - Visualized trends:
      - Monthly trends for total units sold and average logistics lead time.
      - Monthly breakdown of units sold by category percentage.
      - A detailed table showing month-over-month changes in product unit sales.

  * **Result:** 
    - Provided valuable insights that allowed the business to focus on the best-selling products and optimize inventory.
    - Helped identify areas for improvement in logistics and supply chain operations to reduce lead times.
    - Established targets and baselines to monitor progress and drive strategic decisions, ensuring alignment with overall business goals.

- ##### 6.6 Product Performance
Best-Selling Products: Highlighted top-performing products, enabling inventory prioritization.
Low-Performing Items: Recommended phasing out underperforming products or repositioning them with promotional strategies.


### Summary
	
The project successfully leveraged data analytics and visualization to provide actionable insights into the e-commerce business. By addressing key challenges in sales, profitability, shipping efficiency, and customer engagement, the dashboards created will enable decision-makers to make informed, data-driven choices.

### Next Steps

- Enhance Discount Strategies: Develop models to determine optimal discount rates balancing sales growth and profitability.

- Optimize Shipping Logistics: Partner with logistics providers to improve shipping efficiency in high-delay regions.	

- Focus on Customer Retention: Design loyalty programs targeting high-value customers and incentives for new customer retention.

- Expand High-Potential Markets: Allocate resources to expand in emerging markets with high sales potential.

- Streamline Inventory: Implement dynamic inventory management systems to prioritize best-sellers and reduce overstocking of low-performing items.

- By implementing these strategies, the business can align operations with long-term objectives, driving sustainable growth and competitive advantage

