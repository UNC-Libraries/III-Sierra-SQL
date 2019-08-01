SELECT
  marc_tag,
  marc_ind1,
  marc_ind2,
  field_content,
  varfield_type_code
FROM
  sierra_view.varfield
WHERE
  record_id = '425211764523'
ORDER BY
  marc_tag,
  varfield_type_code,
  occ_num ASC;