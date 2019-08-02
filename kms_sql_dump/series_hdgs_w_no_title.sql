select 
'b' || rm.record_num || 'a' AS bnum, 
'=' || v.marc_tag || '  ' || COALESCE(nullif(v.marc_ind1, ' '), '\') || COALESCE(nullif(v.marc_ind2, ' '), '\') || replace(v.field_content, '|', '$') AS data
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'
and b.cataloging_date_gmt IS NOT NULL
inner join sierra_view.record_metadata rm
on rm.id = v.record_id
where v.marc_tag IN ('800', '810', '811')
and v.field_content !~ '\|t'
and v.field_content !~ '\|k'
order by bnum DESC
