SELECT
  DISTINCT('c' || vv.record_num || 'a') AS cnum,
  hr.accounting_unit_code_num,
  vv.marc_tag,
  vv.marc_ind1,
  vv.marc_ind2,
  vv.field_content AS the853
--   vv.varfield_type_code,
--   vv.record_type_code
FROM
  sierra_view.varfield_view vv
INNER JOIN sierra_view.holding_record hr
  ON vv.record_id = hr.record_id
  AND hr.is_suppressed = 'f'
--   AND hr.accounting_unit_code_num = 1
INNER JOIN sierra_view.bib_record_holding_record_link lr
  ON vv.record_id = lr.holding_record_id
INNER JOIN sierra_view.leader_field ldr
  ON lr.bib_record_id = ldr.record_id
  AND ldr.bib_level_code ~ '[bis]'
WHERE
  vv.record_type_code = 'c'
  AND vv.marc_tag = '866'
  AND vv.varfield_type_code = 'h'
--   AND vv.field_content ~ '\|[a-h][^|]+[a-z](\||$)'
--   AND vv.field_content ~ '\|g'
--   AND vv.marc_ind1 IN ('1', '2', '3')
--   AND vv.marc_ind2 = '0'
  AND NOT EXISTS (
    SELECT *
    FROM sierra_view.varfield v2
    WHERE v2.record_id = vv.record_id
    AND v2.marc_tag = '852'
--     AND v2.varfield_type_code = 'h'
    AND v2.field_content ~ '\|h'
)
--   AND EXISTS (
--     SELECT *
--     FROM sierra_view.varfield v3
--     WHERE v3.record_id = vv.record_id
--     AND v3.marc_tag = '863'
--     AND v3.varfield_type_code = 'h')
-- -- -- --  
--   vv.marc_tag IN ('866', '867', '868')
--   and field_content ~ '\|z.*\|z'
--   AND vv.varfield_type_code = 'v'
--  AND varfield_type_code NOT IN ('c', 'e')

-- ORDER BY
--   vv.marc_tag,
--   vv.varfield_type_code,
--   vv.occ_num ASC
-- GROUP BY varfield_type_code