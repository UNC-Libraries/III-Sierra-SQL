select 
'b' || rm.record_num || 'a' AS bnum,
b.bcode2 AS iiimattype,
v.field_content
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'
inner join sierra_view.record_metadata rm
on rm.id = v.record_id
inner join sierra_view.bib_record_property bp
ON b.id = bp.bib_record_id
where 
v.marc_tag = '300'
AND
v.field_content ~ '[^:] *\|b'

 
