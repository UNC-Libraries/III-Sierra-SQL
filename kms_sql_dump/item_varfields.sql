SELECT
  marc_tag,
  field_content,
  varfield_type_code
FROM
  sierra_view.varfield_view
WHERE
  record_type_code = 'i'
AND record_num = '9930754'
ORDER BY
  marc_tag,
  varfield_type_code,
  occ_num ASC