SELECT
'b' || rm.record_num || 'a' AS bnum,
bp.best_title AS title,
bp.material_code AS iii_mattype,
ldr.record_type_code AS ldr_rec_type,
cf.p01 AS map_type

FROM sierra_view.bib_record b

inner join sierra_view.bib_record_property bp
ON b.record_id = bp.bib_record_id

inner join sierra_view.leader_field ldr
on b.id = ldr.record_id
-- and ldr.record_type_code ~ '[at]'
-- and ldr.bib_level_code = 'c'
-- -- and ldr.record_status_code = 'n'
-- -- and ldr.control_type_code = 'a'

inner join sierra_view.control_field cf
on b.id = cf.record_id
-- section below searches only on one control field at a time
AND cf.control_num = '7'
AND cf.p00 = 'a'
AND cf.p01 ~ '[gkqrsuyz|]'
-- AND cf.p26 != 'm'
-- AND cf.p27 != 'm'

-- section below searches analagous values in 008 and 006
-- and 
--    ((cf.control_num = '6' 
--     AND 
--     cf.p00 = 'm'
--     AND cf.p09 = 'i' )
-- OR
-- (ldr.record_type_code = 'm'
-- AND cf.control_num = '8'
-- AND cf.p26 = 'i'))


inner join sierra_view.record_metadata rm
on rm.id = b.id

WHERE b.is_suppressed = 'f'
-- LIMIT 50