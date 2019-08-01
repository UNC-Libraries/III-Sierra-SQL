select 
'b' || rm.record_num || 'a' AS bnum, 
v.varfield_type_code AS fieldtype,
v.marc_tag AS tag,
REGEXP_REPLACE(v.field_content, '.*(\|5[^|]+)', '\1') AS instcode
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'
inner join sierra_view.record_metadata rm
on rm.id = v.record_id
where 
   v.field_content ~ '\|5[^N][^c][^U]'
and not exists ( select v2.field_content from sierra_view.varfield v2
                where v2.record_id = v.record_id
                 and v2.field_content ~ '\|5NcU'
)
order by fieldtype, instcode DESC