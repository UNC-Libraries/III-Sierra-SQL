SELECT
  lr.holding_record_id,
  rm.record_type_code || rm.record_num || 'a' AS hnum,
  hl.location_code
FROM
  sierra_view.bib_record_holding_record_link lr
INNER JOIN sierra_view.holding_record_location hl ON lr.holding_record_id = hl.holding_record_id
INNER JOIN sierra_view.holding_record h ON lr.holding_record_id = h.id
INNER JOIN sierra_view.record_metadata rm ON lr.holding_record_id = rm.id
AND h.scode2 != 'n'
WHERE
  lr.bib_record_id = '420908098717'
ORDER BY lr.holdings_display_order ASC;