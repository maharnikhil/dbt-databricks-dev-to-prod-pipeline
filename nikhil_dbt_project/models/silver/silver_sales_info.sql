WITH sales AS
(

SELECT
    customer_sk,
    {{multiply('unit_price','quantity')}} AS calculated_gross_amount,
    sales_id,
    product_sk,
    gross_amount,
    payment_method

FROM
    {{ref("bronze_sales")}}



),
products AS
(

SELECT
    product_sk,
    category

FROM
    {{ref("bronze_product")}}
),


customer AS
(

SELECT
    customer_sk,
    gender

FROM
    {{ref('bronze_customer')}}

),

joined_query AS
(

SELECT
    sales.sales_id,
    sales.gross_amount,
    sales.payment_method,
    products.category,
    customer.gender
FROM
    sales

JOIN  
    products ON
    sales.product_sk = products.product_sk

 JOIN
    customer ON
    customer.customer_sk = sales.customer_sk
)

SELECT
    category,
    gender,
    SUM(gross_amount) AS Total_sales

FROM
    joined_query

GROUP BY
    category,
    gender

ORDER BY 
    Total_sales DESC