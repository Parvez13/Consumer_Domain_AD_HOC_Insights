SELECT
p.product_code,
p.product,
m.cost_year,
m.manufacturing_cost
FROM dim_product as p
JOIN fact_manufacturing_cost as m on m.product_code = p.product_code
WHERE manufacturing_cost = (SELECT min(manufacturing_cost) from fact_manufacturing_cost);