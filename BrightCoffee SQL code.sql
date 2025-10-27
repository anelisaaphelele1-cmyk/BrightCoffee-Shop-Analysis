SELECT
  *
FROM
  "CASESTUDY"."BRIGHTCOFFEE"."SHOPANALYSIS"
LIMIT
  10;

  --When was the shop opened--
  SELECT MIN(TRANSACTION_DATE) AS first_operating_date
  FROM "CASESTUDY"."BRIGHTCOFFEE"."SHOPANALYSIS";
  
    --earliest time--
    SELECT MIN(TRANSACTION_TIME) AS opening_hour
  FROM "CASESTUDY"."BRIGHTCOFFEE"."SHOPANALYSIS";

  --latest time--
  SELECT MAX(TRANSACTION_TIME) AS closing_hour
  FROM "CASESTUDY"."BRIGHTCOFFEE"."SHOPANALYSIS";

  --Last time the shop made a transaction--
  SELECT MAX(TRANSACTION_DATE) AS last_operating_date
  FROM "CASESTUDY"."BRIGHTCOFFEE"."SHOPANALYSIS";

-------------------------------------------------------------------------------------

  SELECT transaction_date,
  DAYNAME (transaction_date) AS day_name,
  CASE 
            WHEN day_name IN ('SUN', 'SAT') THEN 'weekend'
            ELSE 'weekday'
            END AS day_classification,
            MONTHNAME(TRANSACTION_DATE) AS month_name,
        
        --TRANSACTION_TIME,  
        CASE
            WHEN TRANSACTION_TIME BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
            WHEN TRANSACTION_TIME BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
             WHEN TRANSACTION_TIME >= '17:00:00' THEN 'Evening'
        END AS time_classification,
        HOUR(TRANSACTION_TIME) AS hour_of_day,
        store_location,
        product_category,
        product_detail,
        product_type,
        --unit_price,
        --transaction_qty,
        COUNT (DISTINCT transaction_id) AS number_of_sales,
        SUM(transaction_qty*unit_price) AS Revenue
   FROM "CASESTUDY"."BRIGHTCOFFEE"."SHOPANALYSIS"
   GROUP BY ALL;