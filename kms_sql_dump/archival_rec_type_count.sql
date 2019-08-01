select 
ldr.record_type_code,
ldr.bib_level_code,
ldr.control_type_code,
count(b.id) AS occ

from sierra_view.leader_field ldr
inner join sierra_view.bib_record b
on ldr.record_id = b.id
and b.is_suppressed = 'f'

-- where
-- -- and ldr.record_type_code = 't'
-- -- and 
-- ldr.bib_level_code ~ '[cd]'
-- -- and ldr.record_status_code = 'n'
-- and ldr.control_type_code = 'a'
-- 


GROUP BY ldr.record_type_code, ldr.bib_level_code, ldr.control_type_code
ORDER BY occ DESC