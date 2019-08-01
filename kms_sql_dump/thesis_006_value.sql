select 
-- (select field_content from varfield where record_id = v.record_id and marc_tag = '001') AS rec001,
-- b.bcode2 AS iiimattype,
'b' || rm.record_num || 'a' AS bnum, 
--v.marc_tag,
--v.marc_ind1,
--v.marc_ind2,
--v.field_content
-- v.varfield_type_code,
-- following line formats field data in marceditish way
-- v.marc_tag || ' ' || COALESCE(nullif(v.marc_ind1, ' '), '_') || ' ' || COALESCE(nullif(v.marc_ind2, ' '), '_') || ' ' || replace(v.field_content, '|', '$') AS data
-- following line formats field data in THE marcedit way
'=' || v.marc_tag || '  ' || COALESCE(nullif(v.marc_ind1, ' '), '\') || COALESCE(nullif(v.marc_ind2, ' '), '\') || replace(v.field_content, '|', '$') AS data

--' Added to make highlighting act right below
--,
--'=' || vv.marc_tag || '  ' || COALESCE(nullif(vv.marc_ind1, ' '), '\') || COALESCE(nullif(vv.marc_ind2, ' '), '\') || replace(vv.field_content, '|', '$') AS data243

--' Added to make highlighting act right below

-- regexp_replace(regexp_replace(v.field_content, '^\|.', ''), '\|.', ' ', 'g')
-- the following line just takes the subfield delimiters out of field data
from sierra_view.varfield v

inner join sierra_view.bib_record b
on b.id = v.record_id
-- and b.cataloging_date_gmt IS NOT NULL
--  and b.bcode2 = 'g'
and b.is_suppressed = 'f'

inner join sierra_view.leader_field ldr
on b.id = ldr.record_id
-- and ldr.record_type_code !~ '[at]'
-- and ldr.bib_level_code = 'm'
-- and ldr.record_status_code = 'n'
-- and ldr.control_type_code = 'a'

inner join sierra_view.control_field cf
on b.id = cf.record_id
and 
   (cf.control_num = '6' 
    AND 
    cf.p00 = 'a'
    AND (cf.p07 = 'm' OR cf.p08 = 'm' OR cf.p09 = 'm' OR cf.p10 = 'm'))


inner join sierra_view.record_metadata rm
on rm.id = v.record_id
-- inner join sierra_view.varfield vv
-- on (b.id = vv.record_id AND vv.marc_tag = '243')
-- 
-- lines below gets "linking entry" fields
-- where v.marc_tag IN (
-- -- included works
-- -- '774', --constituent unit (ie includes)
--  '777', --issued with
-- -- related works general
-- '770', --supplement
-- '772', --supplement parent
-- '765', --orig lang
-- '767', --translation
-- '773', --host item
-- '775', --other edition
-- '786', --data source
-- '787' --other
-- -- related works special fields
--  '760', --series
--  '762', --subseries
--  '780', --preceding entry - earlier title
--  '785' --succeeding entry - later title
-- -- ignored by TRLN Discovery
-- -- '776', --additional form
-- )
-- 
where 
-- v.marc_tag IN ('700', '710') 
v.marc_tag = '245'
--    and v.field_content ~ '\|b' 
-- and v.field_content ~ '\|d'
-- and v.field_content ~ '\|t'
-- and v.field_content ~ 'dwsgpo|DWSGPO'
-- and v.field_content ~ '\|z'
-- and v.field_content ~ '\|4http'  
-- and v.marc_ind1 = '1'
-- and v.marc_ind2 = ' '



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

-- and not exists ( select v2.field_content from sierra_view.varfield v2
--                 where v2.record_id = v.record_id
--                 and v2.marc_tag = '020'
-- --                and v2.marc_ind2 != '2'
-- --                  and v2.field_content ~ '\|61'
-- )
-- 
--section below gets record where anothev variable field exists

-- and 
-- exists (select * from sierra_view.varfield v4
--                 where v4.record_id = v.record_id
--                    and v4.marc_tag = '502'
--                 and v4.marc_tag IN ('700', '710', '711')
--                and v4.field_content ~ '\|l'
--                   and v4.marc_ind2 = '0'
-- )
-- 

-- LIMIT 100
-- order by bnum DESC