select 
COUNT(DISTINCT 'b' || rm.record_num || 'a') AS bnum,
       ldr.record_type_code
--       vc.field_content
from 
(select record_type_code, record_id
from sierra_view.leader_field
-- where record_type_code = 'a'
) ldr

inner join sierra_view.bib_record br
  on ldr.record_id = br.record_id
  and br.is_suppressed = 'f'

inner join sierra_view.record_metadata rm
  on ldr.record_id = rm.id

inner join sierra_view.control_field cf
  on ldr.record_id = cf.record_id
  and cf.control_num = '6'
  and cf.p00 = 'a'
-- and cf.p07 ~ '\d'
--   and cf.p11 ~ '[ |]'
--   and cf.p12 ~ '[ |]' 
--   and cf.p13 ~ '[ |]'
--   and cf.p14 ~ '[ |]' 

-- limit 5
GROUP BY ldr.record_type_code
