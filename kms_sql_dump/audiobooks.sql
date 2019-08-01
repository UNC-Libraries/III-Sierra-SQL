select 'b' || rm.record_num || 'a' AS bnum, tmp.tl
from
(select record_type_code || bib_level_code AS tl,
   record_id
from sierra_view.leader_field) tmp

inner join sierra_view.bib_record br
  on tmp.record_id = br.record_id
  and br.is_suppressed = 'f'

inner join sierra_view.control_field cf
  on tmp.record_id = cf.record_id
  and cf.control_num = '8'
  and (cf.p30 ~ '[abcdefhmop]'
  or cf.p31 ~ '[abcdefhmop]')

inner join sierra_view.record_metadata rm
  on tmp.record_id = rm.id

where tmp.tl = 'im'