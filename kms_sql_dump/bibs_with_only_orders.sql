SELECT
  'b' || rm.record_num || 'a' AS bnum
--   'http://search.lib.unc.edu/search?R=UNC' || rm.record_num AS endeca_record,
--   locs.locations
FROM
  sierra_view.bib_record b
INNER JOIN sierra_view.record_metadata rm ON b. ID = rm. ID
-- INNER JOIN(
--   SELECT
--     bib_record_id,
--     STRING_AGG(
--       TRIM(TRAILING FROM location_code),
--       ', '
--     ORDER BY
--       ID
--     )AS locations
--   FROM
--     sierra_view.bib_record_location
--   WHERE
--     location_code != 'multi'
--   GROUP BY
--     bib_record_id
-- )locs ON b. ID = locs.bib_record_id
WHERE
  b.is_suppressed = 'f'
AND b.bcode2 NOT IN('s', 'w', 'z')
-- AND b.cataloging_date_gmt IS NOT NULL
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
  SELECT
    *
  FROM
    sierra_view.bib_record_holding_record_link lrh
  INNER JOIN sierra_view.holding_record h ON lrh.holding_record_id = h. ID
  WHERE
    b. ID = lrh.bib_record_id
  AND h.is_suppressed = 'f'
)
AND EXISTS(
  SELECT
    *
  FROM
    sierra_view.bib_record_order_record_link lro
  INNER JOIN sierra_view.order_record o ON lro.order_record_id = o. ID
  WHERE
    b. ID = lro.bib_record_id
  AND o.is_suppressed = 'f'
)
;