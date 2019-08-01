SELECT iv.record_type_code || iv.record_num || 'a' AS inum
 
FROM sierra_view.item_view iv
WHERE iv.location_code LIKE 'e%' 
AND iv.icode2 != 'n'
