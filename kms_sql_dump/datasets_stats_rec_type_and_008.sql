select 
'b' || rm.record_num || 'a' AS bnum, 
'=' || v.marc_tag || '  ' || COALESCE(nullif(v.marc_ind1, ' '), '\') || COALESCE(nullif(v.marc_ind2, ' '), '\') || replace(v.field_content, '|', '$') AS data

from sierra_view.varfield v

inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'

inner join sierra_view.leader_field ldr
on b.id = ldr.record_id
and ldr.record_type_code = 'm'
-- and ldr.bib_level_code = 'm'
-- and ldr.record_status_code = 'n'
-- and ldr.control_type_code = 'a'

inner join sierra_view.control_field cf
on b.id = cf.record_id
and 
   (cf.control_num = '8' AND cf.p26 = 'a')

inner join sierra_view.record_metadata rm
on rm.id = v.record_id
where 
v.marc_tag = '245'


