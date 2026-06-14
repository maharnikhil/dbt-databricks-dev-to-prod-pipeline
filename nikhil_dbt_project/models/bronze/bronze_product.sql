{{ config( materialized ='view' )}}

SELECT  
    *
FROM
    {{source('insource','dim_product')}}