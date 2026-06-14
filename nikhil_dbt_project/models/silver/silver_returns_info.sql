WITH date AS
(

SELECT
    date_sk

FROM
    {{ref('bronze_date')}}

),

store AS
(

SELECT
    store_sk,
    city,
    country

FROM
    {{ref("bronze_store")}}

),


returns AS
(

SELECT
    sales_id,
    date_sk,
    store_sk,
    product_sk

FROM
    {{ref('bronze_returns')}}

),

joined_query AS
(

SELECT
    date.date_sk,
    store.store_sk,
    store.country,
    store.city,
    returns.sales_id,
    returns.store_sk,
    returns.product_sk

FROM
    returns


JOIN
    date ON
    date.date_sk = returns.date_sk

JOIN
    store ON
    store.store_sk = returns.store_sk

)

SELECT
    sales_id,
    country,
    date_sk
    
FROM
    joined_query

ORDER BY
    sales_id
