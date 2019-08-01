select 
cf.p21 AS sertype,
count('b' || rm.record_num || 'a') AS ct
-- '=' || v.marc_tag || '  ' || COALESCE(nullif(v.marc_ind1, ' '), '\') || COALESCE(nullif(v.marc_ind2, ' '), '\') || replace(v.field_content, '|', '$') AS data

--' Added to make highlighting act right below 

from sierra_view.varfield v

inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'

inner join sierra_view.leader_field ldr
on b.id = ldr.record_id
and ldr.record_type_code = 'a'
and ldr.bib_level_code ~ '[bis]'
-- and ldr.record_status_code = 'n'
-- and ldr.control_type_code = 'a'

inner join sierra_view.control_field cf
on b.id = cf.record_id
and 
   (cf.control_num = '8' AND cf.p21 !~ '[dlmnpw]')

inner join sierra_view.record_metadata rm
on rm.id = v.record_id
where 
v.marc_tag = '245'

and not exists ( select v2.field_content from sierra_view.varfield v2
                where v2.record_id = v.record_id
                and v2.marc_tag = '001'
                and v2.field_content ~ 'ss[jie]'
)
-- 

group by cf.p21

