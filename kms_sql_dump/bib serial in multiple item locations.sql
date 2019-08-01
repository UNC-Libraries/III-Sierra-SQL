SELECT DISTINCT
  'b' || rm.record_num
FROM
  sierra_view.bib_record br
INNER JOIN sierra_view.bib_record_item_record_link bi ON bi.bib_record_id = br. ID
INNER JOIN sierra_view.item_record ir ON ir. ID = bi.item_record_id
AND ir.location_code ~ '^wb'
AND ir.is_suppressed = 'f'

INNER JOIN sierra_view.record_metadata rm ON rm. ID = br. ID
WHERE
  br.is_suppressed = 'f'
  AND br.bcode1 = 's'
  AND EXISTS (SELECT * 
              FROM sierra_view.bib_record_item_record_link bi2
              INNER JOIN sierra_view.item_record ir2
              ON ir2.ID = bi2.item_record_id
              AND ir2.location_code ~ '^dd'
              AND ir2.is_suppressed = 'f'
              WHERE bi2.bib_record_id = br.ID
             )
LIMIT 10