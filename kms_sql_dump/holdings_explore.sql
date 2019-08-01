SELECT 
  rmb.record_type_code || rmb.record_num || '--' || hl.location_code AS bnumloc
FROM sierra_view.bib_record_holding_record_link bhl
INNER JOIN sierra_view.holding_record_location hl
  ON bhl.holding_record_id = hl.holding_record_id
INNER JOIN sierra_view.bib_record b
  ON bhl.bib_record_id = b.id
  AND b.is_suppressed = 'f'
INNER JOIN sierra_view.leader_field ldr
  ON b.id = ldr.record_id
  AND ldr.bib_level_code = 's'
INNER JOIN sierra_view.holding_record h
  ON bhl.holding_record_id = h.id
  AND h.is_suppressed = 'f'
INNER JOIN sierra_view.record_metadata rmb
  ON bhl.bib_record_id = rmb.id
GROUP BY bnumloc
HAVING COUNT (*) > 1
