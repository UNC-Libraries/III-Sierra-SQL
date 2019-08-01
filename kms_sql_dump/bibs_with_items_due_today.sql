SELECT 
'b' || rm.record_num || 'a' AS inum,
bp.best_title,
c.due_gmt
FROM sierra_view.checkout c
INNER JOIN sierra_view.bib_record_item_record_link bi
ON c.item_record_id = bi.item_record_id
INNER JOIN sierra_view.record_metadata rm
ON bi.bib_record_id = rm.id
INNER JOIN sierra_view.bib_record_property bp
ON bi.bib_record_id = bp.bib_record_id
INNER JOIN sierra_view.bib_record b
ON bi.bib_record_id = b.id
AND b.is_suppressed = 'f'
WHERE 
date_trunc('day', c.due_gmt) = current_date
-- c.due_gmt > current_timestamp
-- AND date_trunc('day', c.due_gmt) < current_date + 1
ORDER BY c.due_gmt ASC
