SELECT DISTINCT
  'b' || bib.record_num AS bnum,
  To_char(
    bib.cataloging_date_gmt,
    'YYYYMMDD'
  )AS catdate,
  bib.bcode2 AS mattype
FROM
  sierra_view.bib_view bib
INNER JOIN(
  (
    SELECT
      record_id
    FROM
      sierra_view.varfield
    WHERE
      marc_tag = '919'
    AND marc_ind1 = '0'
  )
  UNION
    (
      SELECT
        v.record_id
      FROM
        sierra_view.varfield v
      INNER JOIN sierra_view.leader_field ldr ON v.record_id = ldr.record_id
      AND ldr.bib_level_code IN ('c', 'd')
      WHERE
        v.marc_tag = '856'
      AND v.marc_ind2 = '2'
      AND v.field_content LIKE '%finding-aids.lib.unc.edu%'
    )
)vids ON bib. ID = vids.record_id
WHERE
  bib.bcode3 NOT IN('d', 'n', 'c')