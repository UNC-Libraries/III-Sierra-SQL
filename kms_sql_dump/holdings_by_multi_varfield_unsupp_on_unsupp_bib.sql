SELECT
--   varfield_type_code,
--   count(*)
  'http://search.lib.unc.edu/search?R=UNCb' || rm.record_num AS bnum,
  'c' || rmh.record_num || 'a' AS cnum,
  v.marc_tag,
  v.marc_ind1,
  v.marc_ind2,
  v.field_content,
  v.varfield_type_code
FROM
  sierra_view.varfield v
INNER JOIN sierra_view.holding_record h
ON v.record_id = h."id"
AND h.is_suppressed = 'f'
INNER JOIN sierra_view.record_metadata rmh
ON rmh."id" = h."id"
INNER JOIN sierra_view.bib_record_holding_record_link bh
ON bh.holding_record_id = v.record_id
INNER JOIN sierra_view.record_metadata rm
ON rm."id" = bh.bib_record_id
INNER JOIN sierra_view.bib_record b
ON b."id" = bh.bib_record_id
AND b.is_suppressed = 'f'
AND b.bcode1 = 's'
WHERE
--   marc_tag = '852'
--   and field_content ~ '\|j'
  v.marc_tag = '866'
  AND EXISTS 
    (SELECT * 
     FROM sierra_view.varfield vv
     WHERE vv.record_id = h.record_id
     AND vv.marc_tag = '867'
     )
     
  --AND vv.varfield_type_code = 'v'
--  AND varfield_type_code NOT IN ('c', 'e')
ORDER BY
  v.marc_tag,
  v.varfield_type_code,
  v.occ_num ASC
-- GROUP BY varfield_type_code