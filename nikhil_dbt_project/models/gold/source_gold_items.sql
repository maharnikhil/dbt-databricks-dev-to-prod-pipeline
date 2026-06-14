WITH dedup AS
(

SELECT
    *,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY updatedDate DESC) AS dedup_id

FROM
    {{source('insource','items')}}

)

SELECT
    id,
    name,
    category,
    updatedDate

FROM
    dedup

WHERE
    dedup_id = 1