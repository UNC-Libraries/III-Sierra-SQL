SELECT
-- 'b' || rm.record_num || 'a' AS bnum,
-- b.cataloging_date_gmt,
date_part('year', rm.record_last_updated_gmt) AS theyear,
date_part('month', rm.record_last_updated_gmt) AS themonth,
COUNT(DISTINCT(rm.id))
-- rm.record_last_updated_gmt - b.cataloging_date_gmt AS diffdate


FROM record_metadata rm

INNER JOIN bib_record b
ON rm.id = b.id
AND b.bcode3 != 'x'

WHERE
( rm.record_last_updated_gmt - b.cataloging_date_gmt > '7 days'
OR
  rm.record_last_updated_gmt - rm.previous_last_updated_gmt > '30 days'
)
-- AND rm.record_last_updated_gmt > MAKE_TIMESTAMP(2018, 1, 1, 0, 0, 0)

AND rm.deletion_date_gmt IS NULL

GROUP BY theyear, themonth
ORDER BY theyear, themonth ASC
-- LIMIT 10