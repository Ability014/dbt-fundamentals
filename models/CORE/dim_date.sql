

SELECT
TRY_CAST(CONCAT(LEFT(DATE_DAY, 4), SUBSTR(DATE_DAY, 6, 2), SUBSTR(DATE_DAY, 9, 2)) AS INTEGER) As date_key,
TRY_CAST(CONCAT(LEFT(DATE_DAY, 4), SUBSTR(DATE_DAY, 6, 2)) AS INTEGER) As month_key, -- New change
*
FROM {{ ref('dates') }}