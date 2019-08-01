select 'b' || rm.record_num || 'a' AS bnum, 
       tmp.tl, 
       cf.p33,
       cf.p34
--       vc.field_content
from
(select record_type_code || bib_level_code AS tl,
   record_id
from sierra_view.leader_field) tmp

inner join sierra_view.bib_record br
  on tmp.record_id = br.record_id
  and br.is_suppressed = 'f'

inner join sierra_view.record_metadata rm
  on tmp.record_id = rm.id

--uncomment section below to limit to e-resource records in collections
--inner join sierra_view.varfield vc 
--  on tmp.record_id = vc.record_id 
--  and vc.marc_tag = '773' 
--  and vc.field_content like '%online collection%'

inner join sierra_view.control_field cf
  on tmp.record_id = cf.record_id
  and cf.control_num = '8'
  and (cf.p33 !~ '[mu |]'
       or 
       cf.p34 !~ '[ |]')

where tmp.tl ~ 'a[acdm]'

--limit 5