select 
COUNT('b' || rm.record_num || 'a') AS bnum_ct
,
v.varfield_type_code 
,
v.marc_tag
--,
--v.marc_tag || ' ' || COALESCE(nullif(v.marc_ind1, ' '), '_') || ' ' || COALESCE(nullif(v.marc_ind2, ' '), '_') || ' ' || replace(v.field_content, '|', '$')
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'
inner join sierra_view.record_metadata rm
on rm.id = v.record_id
where v.marc_tag LIKE '69%'
-- where v.marc_tag IN ('760', '762', '765')

-- line below gets "linking entry" fields
-- where v.marc_tag IN (
-- '760', '762', 
-- '765', '767', '770', '772', '773', '774', '775', '777', '780', '785', '786', '787')

-- section below limits to LCSH
-- and ( v.marc_ind2 = '0'
--       OR
--       ( v.marc_ind2 = '7' AND v.field_content ~ '\|2lcsh' ) )
 
-- and v.marc_ind1 ~ '0'
-- AND v.field_content ~ '\|aBach, Johann Sebas'
-- and v.marc_ind2 !~ '2'
-- AND v.field_content ~ '\|[np]'
-- and v.field_content !~ '\|t'
--and v.field_content !~ '\|i'
-- and v.field_content ~ '^ *\d+ *$'

-- and not exists ( select * from sierra_view.varfield v2
--                 where v2.record_id = v.record_id
--                 and v2.marc_tag = '580'
-- --                 and v2.field_content ~ 'OCoLC'
-- )

-- section below gets record where anothev variable field exists
-- and exists (select * from sierra_view.varfield v3
--                where v3.record_id = v.record_id
--                    and v3.marc_tag = '040'
--                and v3.marc_tag IN ('100', '110', '111')
--                and v3.field_content ~ '\|aDLC'
--)
--LIMIT 1000 
GROUP BY v.marc_tag, v.varfield_type_code
ORDER BY v.marc_tag, v.varfield_type_code ASC
-- HAVING COUNT (*) > 1