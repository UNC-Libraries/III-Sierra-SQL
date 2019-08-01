SELECT
COUNT(DISTINCT(b.id))
FROM sierra_view.bib_record b

WHERE b.cataloging_date_gmt IS NOT NULL
AND b.bcode3 != 'x'
AND b.is_suppressed = 'f'

AND NOT EXISTS (
SELECT * FROM sierra_view.varfield v
WHERE v.record_id = b.id
AND v.marc_tag IN ('336', '337', '338')
)