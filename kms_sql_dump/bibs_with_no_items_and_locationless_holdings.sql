SELECT
  'b' || rm.record_num || 'a' AS bnum
FROM
  sierra_view.bib_record b
INNER JOIN sierra_view.bib_record_holding_record_link lrh ON b.id = lrh.bib_record_id
INNER JOIN sierra_view.holding_record h ON lrh.holding_record_id = h. ID
  AND h.is_suppressed = 'f'
-- INNER JOIN sierra_view.holding_record_location hl
--                            ON h.id = hl.holding_record_id
--                            AND hl.location_code = ''
INNER JOIN sierra_view.record_metadata rm ON b. ID = rm. ID
WHERE
  b.is_suppressed = 'f'
-- AND b.bcode2 IN('s', 'w', 'z')
-- AND b.cataloging_date_gmt IS NULL
AND NOT EXISTS(
  SELECT
    *
  FROM
    sierra_view.bib_record_item_record_link lri
  INNER JOIN sierra_view.item_record i ON lri.item_record_id = i. ID
  WHERE
    b. ID = lri.bib_record_id
  AND i.is_suppressed = 'f'
)

AND NOT EXISTS(
SELECT *
FROM sierra_view.varfield v
WHERE b.id = v.record_id
AND (v.marc_tag = '001'
AND v.field_content LIKE 'ss%'
) OR (v.marc_tag = '919'
AND v.field_content LIKE '%dwsgpo%')
)

;