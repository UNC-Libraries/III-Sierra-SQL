select
sf.content

from subfield sf

where sf.marc_tag = '300'
and sf.tag = 'a'
   and sf.content !~* 'cards?|columns|pamphlets?|p\.|pages?|pagings?|plates?|ℓ\.|l\.|leaf|[lℓ]eaves|scores?|sheets?|v\.|vols?|volumes?'
   and sf.content !~* '[0-9 ][ℓpvl]\s?: *$'

-- select 
-- 'b' || rm.record_num || 'a' AS bnum, 
-- sf.content
-- 
-- from sierra_view.subfield sf
-- 
-- inner join sierra_view.bib_record b
-- on b.id = sf.record_id
-- --   and b.cataloging_date_gmt IS NULL
-- --  and b.bcode2 = 'g'
-- and b.is_suppressed = 'f'
-- 
-- inner join sierra_view.record_metadata rm
-- on rm.id = sf.record_id
-- 
-- where 
-- sf.marc_tag = '300'
-- and sf.tag = 'a'
--    and sf.content !~* 'cards?|columns|pamphlets?|p\.|pages?|pagings?|plates?|ℓ\.|l\.|leaf|[lℓ]eaves|scores?|sheets?|v\.|vols?|volumes?'
--    and sf.content !~* '[0-9 ][ℓpvl]\s?: *$'
-- 
-- and not exists ( select v2.field_content from sierra_view.varfield v2
--                 where v2.record_id = b.id
--                 and v2.marc_tag = '338'
-- --                and v2.marc_ind2 != '2'
-- --                  and v2.field_content ~ '^ss'
-- )
-- -- 
-- --section below gets record where another variable field exists
-- 
-- and not exists (select * from sierra_view.varfield v4
--                 where v4.record_id = b.id
--                    and v4.marc_tag = '245'
-- --                 and v4.marc_tag IN ('700', '710', '711')
-- and v4.field_content LIKE '%|h%' 
-- -- and v4.field_content !~ 'ANTH'
-- --                   and v4.marc_ind1 ~ '[23]'
-- )
-- 