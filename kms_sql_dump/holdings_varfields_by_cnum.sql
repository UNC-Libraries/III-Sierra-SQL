SELECT
  varfield_type_code,
  marc_tag || '  ' ||
  marc_ind1 ||
  marc_ind2 ||
  field_content AS data
  
FROM
  sierra_view.varfield_view
WHERE
  record_type_code = 'c'
AND record_num = '1207843'
ORDER BY
  marc_tag,
  varfield_type_code,
  occ_num ASC