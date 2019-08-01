EXPLAIN ANALYZE SELECT
  'b' || b.record_num AS bnum,
  To_char(
    b.cataloging_date_gmt,
    'YYYYMMDD'
  )AS catdate,
  b.bcode2 AS mattype
FROM
  sierra_view.bib_view b
INNER JOIN sierra_view.varfield vf ON vf.record_id = b.ID
AND vf.marc_tag = '919'
AND vf.field_content = '|aTROUP'
WHERE
  b.bcode3 NOT IN('d', 'n', 'c');