select 
v.field_content, 
count(v.field_content) as freq
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'
inner join sierra_view.record_metadata rm
on rm.id = v.record_id
where 
v.marc_tag = '066' 
GROUP BY v.field_content
ORDER BY freq DESC