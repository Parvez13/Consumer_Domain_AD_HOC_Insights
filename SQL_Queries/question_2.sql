WITH unique_products AS
(
	SELECT 
           COUNT(DISTINCT CASE WHEN fiscal_year = 2020 THEN product_code END) as unique_products_2020,
           COUNT(DISTINCT CASE WHEN fiscal_year = 2021 THEN product_code END) as unique_products_2021
    FROM fact_sales_monthly

)

SELECT
    unique_products_2020, 
    unique_products_2021,
    CONCAT(ROUND(((unique_products_2021-unique_products_2020)*1.0/unique_products_2020)*100,2),'%') AS percentage_chg
FROM unique_products;