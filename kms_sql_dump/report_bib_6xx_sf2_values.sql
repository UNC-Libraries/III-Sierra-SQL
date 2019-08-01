select 
COUNT(v.id), 
v.marc_tag,
TRIM(REGEXP_REPLACE(regexp_replace(v.field_content, '^.*\|2', ''), '\|.*$', '')) AS vocab
-- following line formats field data in THE marcedit way
-- '=' || v.marc_tag || '  ' || COALESCE(nullif(v.marc_ind1, ' '), '\') || COALESCE(nullif(v.marc_ind2, ' '), '\') || replace(v.field_content, '|', '$') AS data

--' Added to make highlighting act right below
--,
--'=' || vv.marc_tag || '  ' || COALESCE(nullif(vv.marc_ind1, ' '), '\') || COALESCE(nullif(vv.marc_ind2, ' '), '\') || replace(vv.field_content, '|', '$') AS data243

--' Added to make highlighting act right below


-- the following line just takes the subfield delimiters out of field data
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'

WHERE v.marc_tag LIKE '6%'
and v.field_content LIKE '%|2%'
and v.marc_ind2 = '7'

GROUP BY vocab, v.marc_tag