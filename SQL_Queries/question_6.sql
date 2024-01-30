SELECT
c.customer_code, c.customer, AVG(p.pre_invoice_discount_pct) as average_discount_percentage
FROM dim_customer as c
JOIN fact_pre_invoice_deductions AS p ON p.customer_code = c.customer_code
WHERE p.fiscal_year = 2021 and c.market = "India"
GROUP BY c.customer_code, c.customer
ORDER BY average_discount_percentage DESC
LIMIT 5;