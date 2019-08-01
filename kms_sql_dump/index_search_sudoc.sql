select COUNT(DISTINCT bnums)
from 
((SELECT rm.record_num AS bnum
FROM sierra_view.varfield v
inner join sierra_view.record_metadata rm
on v.record_id = rm."id"
where rm.record_type_code = 'b'
and v.marc_tag = '086'
and v.varfield_type_code = 'g'
and v.field_content ~* 'NAS 1\.15 ?:? *$')
 
UNION

(SELECT rm2.record_num AS bnum
FROM sierra_view.varfield v2
inner join sierra_view.bib_record_item_record_link bi
ON v2.record_id = bi.item_record_id
inner join sierra_view.record_metadata rm2
on bi.bib_record_id = rm2.id
where v2.marc_tag = '086'
and v2.varfield_type_code = 'c'
and v2.field_content ~* 'NAS 1\.15 ?:? *$')
) bnums