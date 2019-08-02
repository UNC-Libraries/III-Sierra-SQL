select 
'b' || rm.record_num || 'a' AS bnum,
b.bcode2 AS iiimattype,
v.marc_tag,
v.marc_ind1,
v.marc_ind2,
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
(v.marc_tag ~ '[17][01]0'
AND v.field_content LIKE '%|e%'
AND v.field_content LIKE '%|4%')
OR
(v.marc_tag ~ '[17]11'
AND v.field_content LIKE '%|j%'
AND v.field_content LIKE '%|4%')
 
