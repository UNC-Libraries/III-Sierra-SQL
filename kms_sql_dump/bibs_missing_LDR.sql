select rm.record_type_code || rm.record_num || 'a' AS bnum

from
  sierra_view.bib_record br
  inner join sierra_view.record_metadata rm
    on br.record_id = rm.id

  where br.is_suppressed = 'f'

and not exists ( select * from sierra_view.leader_field ldr
                where ldr.record_id = br.record_id
)
ORDER by bnum DESC
--limit 5