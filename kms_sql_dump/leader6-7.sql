select 'b' || rm.record_num || 'a' AS bnum, tmp.tl, vc.field_content
from
(select record_type_code || bib_level_code AS tl,
   record_id
from sierra_view.leader_field) tmp

inner join sierra_view.bib_record br
  on tmp.record_id = br.record_id
  and br.is_suppressed = 'f'

inner join sierra_view.record_metadata rm
  on tmp.record_id = rm.id

inner join sierra_view.varfield vc 
  on tmp.record_id = vc.record_id 
  and vc.marc_tag = '773' 
  and vc.field_content like '%online collection%'

where tmp.tl = 'em'

limit 5