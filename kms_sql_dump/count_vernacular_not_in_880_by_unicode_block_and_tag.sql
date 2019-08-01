select
'{' || v.marc_tag || '}' AS tag,
-- v.field_content
count(v.id) AS tag_ct
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'
where v.marc_tag != '880'
and v.field_content ~ '[\x4E00-\x9FFF]'
and v.field_content !~ '\|6'
group by tag
order by tag ASC
