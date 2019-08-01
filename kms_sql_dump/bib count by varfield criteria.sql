select DISTINCT 'b' || rm.record_num || 'a' AS bnum
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
 and b.bcode2 != '7'
and b.is_suppressed = 'f'
inner join sierra_view.record_metadata rm
on rm.id = v.record_id

-- where v.marc_tag IN ('700', '710', '711')
where v.marc_tag = '655'
--    and ( v.field_content ~ '\|eauthor' OR v.field_content ~ '\|4aut' )
-- and v.field_content !~ '^\|aIncludes (bib|disc)'
-- and v.field_content !~ '\|i'
and v.field_content ~ '^\|aGeodatabases\.'
-- and v.field_content !~ '\|3.*Hill copy'  
-- and v.marc_ind1 != '1'

-- and not exists ( select v2.field_content from sierra_view.varfield v2
--                 where v2.record_id = v.record_id
--                 and v2.marc_tag = '240'
-- --                and v2.marc_ind2 != '2'
-- --                  and v2.field_content ~ 'Shakespeare, William,\|d1564-1616'
-- )
-- 
-- section below gets record where anothev variable field exists
-- and exists (select * from sierra_view.varfield v3
--                 where v3.record_id = v.record_id
--                    and v3.marc_tag = '250'
--                 and v3.marc_tag IN ('700', '710', '711')
--                and v3.field_content ~ '\|aDLC'
-- )
--  LIMIT 1000