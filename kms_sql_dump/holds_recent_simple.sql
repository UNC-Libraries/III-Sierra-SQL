SELECT
  to_char(h.placed_gmt, 'YYYY/MM/DD HH24:mm:ss')AS hold_date,
  i.record_type_code || i.record_num AS inum
FROM
  sierra_view. HOLD h
INNER JOIN sierra_view.item_view i ON h.record_id = i. ID
WHERE
  h.placed_gmt >(CURRENT_TIMESTAMP - INTERVAL '72 hours')
ORDER BY
  h.placed_gmt ASC;