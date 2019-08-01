select DISTINCT('b' || rm.record_num) AS bnum
-- ,
-- items.location_code
from sierra_view.bib_record_item_record_link bi

inner join (select i.record_id as item_id, i.location_code
from sierra_view.item_record i
where i.location_code LIKE 'ddd%') items

on items.item_id = bi.item_record_id
inner join sierra_view.bib_record br
on bi.bib_record_id = br.id
and br.is_suppressed = 'f'
inner join sierra_view.record_metadata rm
on bi.bib_record_id = rm."id" 
LIMIT 100