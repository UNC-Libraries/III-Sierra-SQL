SELECT
  'b' || rm.record_num || 'a' AS bnum,
  b.language_code,
  b.bcode1,
  b.bcode2,
  locs.locations
FROM
  sierra_view.bib_record b
INNER JOIN sierra_view.leader_field ldr ON b. ID = ldr.record_id
AND ldr.record_type_code !~ '[acdefgijkmoprt]'
INNER JOIN sierra_view.record_metadata rm ON rm. ID = b. ID
INNER JOIN(
  SELECT
    bib_record_id,
    STRING_AGG(
      TRIM(TRAILING FROM location_code),
      ', '
    ORDER BY
      ID
    )AS locations
  FROM
    sierra_view.bib_record_location
  WHERE
    location_code != 'multi'
  GROUP BY
    bib_record_id
)locs ON b. ID = locs.bib_record_id
WHERE
  b.is_suppressed = 'f'
AND b.cataloging_date_gmt IS NOT NULL