select 
ldr.record_type_code,
'b' || rm.record_num || 'a' AS bnum,
brp.best_title AS title


from sierra_view.bib_record b

inner join sierra_view.bib_record_property brp
on b.id = brp.bib_record_id

inner join sierra_view.leader_field ldr
on b.id = ldr.record_id
-- and ldr.record_type_code = 'e'
-- and ldr.bib_level_code = 'm'
-- and ldr.record_status_code = 'n'
-- and ldr.control_type_code = 'a'

-- inner join sierra_view.control_field cf
-- on b.id = cf.record_id
-- and 
--    (cf.control_num = '8' AND (cf.p24 = 'm' OR cf.p25 = 'm' OR cf.p26 = 'm' OR cf.p27 = 'm'))
-- 
inner join sierra_view.record_metadata rm
on rm.id = b.id

where b.is_suppressed = 'f'
and b.bcode2 = '8'
-- 
-- and not exists ( select v2.field_content from sierra_view.varfield v2
--                 where v2.record_id = v.record_id
--                 and v2.marc_tag = '502'
-- )
-- 

-- group by ldr.record_type_code

order by title ASC