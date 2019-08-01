select 
'b' || rm.record_num || 'a' AS bnum, 
v.marc_tag,
-- following line formats field data in THE marcedit way
'=' || v.marc_tag || '  ' || COALESCE(nullif(v.marc_ind1, ' '), '\') || COALESCE(nullif(v.marc_ind2, ' '), '\') || replace(v.field_content, '|', '$') AS data

--' Added to make highlighting act right below

from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'
inner join sierra_view.record_metadata rm
on rm.id = v.record_id
where 
v.marc_tag = '700'
AND v.field_content LIKE '%|4White heat%'

-- ((v.marc_tag IN ('111', '611', '711', '811', '880')
-- AND v.field_content LIKE '%|jvance county%')
-- OR
-- (v.marc_tag IN ('100', '110', 
--                 '400', '410',
--                 '600', '610', '630', '650', '651', '654', '662',
--                 '700', '705', '710', '715', '720', '751', '752',
--                 '800', '810',
--                 '880')
-- AND v.field_content LIKE '%|4vance county%'))
order by v.marc_tag