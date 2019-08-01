select 
b.bcode2 AS iiimattype,
'b' || rm.record_num || 'a' AS bnum,
v.marc_tag,
v.marc_ind1, 
v.marc_ind2,
regexp_replace(regexp_replace(v.field_content, '\|2.*', ''), '\|a', '') AS hdg,
regexp_replace(regexp_replace(v.field_content, '^.*\|2', ''), '^\|a.*$', 'na') AS vocab
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id 
and b.is_suppressed = 'f'

inner join sierra_view.record_metadata rm
on rm.id = v.record_id

inner join sierra_view.bib_record_property bp
ON b.id = bp.bib_record_id

where 
(v.marc_tag ~ '69[05]'
OR
v.marc_tag LIKE '6%' AND v.field_content ~ '\|2 *local')

and exists ( select v2.field_content from sierra_view.varfield v2
                where v2.record_id = v.record_id
                and v2.marc_tag ~ '69[05]'
                 and v2.field_content LIKE '%|2uncmrc%'
)