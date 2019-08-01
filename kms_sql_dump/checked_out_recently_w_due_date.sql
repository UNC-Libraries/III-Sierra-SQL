select 'b' || bv.record_num AS bnum,
       'i' || rm.record_num AS inum,
       bv.title,
       ch.checkout_gmt,
       ch.due_gmt
from sierra_view.bib_view bv
INNER JOIN sierra_view.bib_record_item_record_link bi
ON bv.id = bi.bib_record_id
INNER JOIN sierra_view.item_record ir
ON ir.id = bi.item_record_id
INNER JOIN sierra_view.checkout ch
ON ir.id = ch.item_record_id
AND ch.checkout_gmt > (current_timestamp - interval '2 hours')
INNER JOIN sierra_view.record_metadata rm
ON ir.id = rm.id
ORDER BY ch.checkout_gmt DESC