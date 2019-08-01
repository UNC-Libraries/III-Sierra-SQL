SELECT 
  varfield_type_code,
  occ_num,
  id,
  marc_tag,
--   field_content
  marc_tag || '  ' || COALESCE(nullif(marc_ind1, ' '), '_') || ' ' || COALESCE(nullif(marc_ind2, ' '), '_') || ' ' || field_content
FROM
  sierra_view.varfield_view
WHERE
  record_type_code = 'b'
AND record_num = '9020106'
ORDER BY
 marc_tag,
--   varfield_type_code,
 occ_num,
  id ASC

