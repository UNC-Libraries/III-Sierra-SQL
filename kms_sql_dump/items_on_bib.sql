SELECT
  i.record_id,
  id2reckey(i.record_id)AS inum,
  i.copy_num,
  i.location_code,
  i.item_status_code,
  TO_CHAR(C .due_gmt, 'YYYYMMDD'),
  i.checkout_total,
  i.itype_code_num
FROM
  sierra_view.bib_record_item_record_link bil
JOIN sierra_view.item_record i ON bil.item_record_id = i.record_id
LEFT OUTER JOIN sierra_view.checkout C ON bil.item_record_id = C .item_record_id
WHERE
  bil.bib_record_id = reckey2id('b1288396')
AND i.icode2 != 'n'
ORDER BY
  bil.items_display_order ASC