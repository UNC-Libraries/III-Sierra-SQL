SELECT
'b' || rm.record_num || 'a' AS bnum,
bp.best_title AS title,
bp.material_code AS iii_mattype,
ldr.record_type_code AS ldr_rec_type

FROM sierra_view.bib_record b

inner join sierra_view.bib_record_property bp
ON b.record_id = bp.bib_record_id

inner join sierra_view.leader_field ldr
on b.id = ldr.record_id
-- -- and ldr.record_type_code !~ '[at]'
-- -- and ldr.bib_level_code = 'm'
-- -- and ldr.record_status_code = 'n'
-- -- and ldr.control_type_code = 'a'

inner join sierra_view.control_field cf
on b.id = cf.record_id
and 
   (cf.control_num = '7' 
    AND 
    cf.p00 = 't'
    AND cf.p01 ~ 'd' )

inner join sierra_view.record_metadata rm
on rm.id = b.id

WHERE b.is_suppressed = 'f'
-- LIMIT 50