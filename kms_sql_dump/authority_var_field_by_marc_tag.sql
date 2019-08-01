select 
v.marc_tag,
v.marc_ind1,
v.marc_ind2,
v.field_content

from sierra_view.varfield v
inner join sierra_view.authority_record a
on a.id = v.record_id
--   and b.cataloging_date_gmt IS NULL
--  and b.bcode2 = 'a'
and a.is_suppressed = 'f'

inner join sierra_view.record_metadata rm
on rm.id = v.record_id

where 
-- v.marc_tag IN ('655', '695') 
v.marc_tag = '110'
-- v.marc_tag LIKE '69%'
-- and v.marc_ind1 = '0'
-- and v.marc_ind2 = '2'
    AND 
v.field_content LIKE '% & %'
--    AND v.field_content ~ '\|uhttps?:\/\/cdr\.lib\.unc\.edu'
--    and v.field_content !~* '[0-9 ][ℓpvl]\s?: *(\||$)'
-- and v.field_content ~ '\|t'
-- and v.field_content ~ 'dwsgpo|DWSGPO'
-- and v.field_content ~ '\|z'
-- and v.field_content ~ '\|4http'  



-- section below limits to LCSH
-- and ( v.marc_ind2 = '0'
--       OR
--       ( v.marc_ind2 = '7' AND v.field_content ~ '\|2lcsh' ) )
 
-- and v.marc_ind2 = '0'
-- AND v.field_content ~ '\|zNorth Carolina'
-- -- AND v.field_content ~ '\|[np]'
-- and v.field_content ~ '\|tMacbeth'
-- and v.field_content ~ '\|i'
-- 
-- and v.field_content ~ '^ *\d+ *$'

-- and exists ( select v2.field_content from sierra_view.varfield v2
--                 where v2.record_id = v.record_id
--                 and v2.marc_tag = '700'
--                and v2.marc_ind2 = '2'
--                  and v2.field_content LIKE '%|t%'
-- )
-- 
--section below gets record where another variable field exists
-- 
-- and not exists (select * from sierra_view.varfield v4
--                 where v4.record_id = v.record_id
--                    and v4.marc_tag = '752'
-- --                 and v4.marc_tag IN ('700', '710', '711')
-- -- and v4.field_content LIKE 'sse%' 
-- -- and v4.field_content !~ 'ANTH'
-- --                   and v4.marc_ind1 = '0'
-- -- and v4.marc_ind2 = ' '
-- )

-- section below limits on lack of a control field with certain values
-- and not exists ( select * fom sierra_view.control_field cf
--                  where b.id = cf.record_id
--                  and cf.control_num = '7'
--                  and cf.p00 = 'c' )
-- LIMIT 1000
-- order by bnum ASC