{{config (materialized = 'table') }}

SELECT
    *
FROM
    {{source("insource",'dim_customer')}}