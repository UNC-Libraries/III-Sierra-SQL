SELECT
  'b' || b.record_num AS bnum,
  to_char(
    b.cataloging_date_gmt,
    'YYYYMMDD'
  ),
  b.bcode2
FROM
  sierra_view.bib_view b
INNER JOIN sierra_view.bib_record_holding_record_link lr
  ON lr.bib_record_id = b.id
INNER JOIN sierra_view.holding_record h 
  ON lr.holding_record_id = h. ID
  AND h.scode2 != 'n'
  AND EXISTS (
    SELECT *
    FROM sierra_view.holding_record_card hrc
    WHERE h.id = hrc.holding_record_id
    AND hrc.is_suppress_opac_display = 't'
    )
WHERE
  b.bcode3 NOT IN ('d', 'n', 'c')
;