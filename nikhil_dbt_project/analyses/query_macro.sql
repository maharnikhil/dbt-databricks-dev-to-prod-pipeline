SELECT
    quantity,
    unit_price,
    {{ multiply('quantity','unit_price')}} AS Actual_price,
    {{exponent('quantity',2)}}
FROM
    {{ref('bronze_sales')}}