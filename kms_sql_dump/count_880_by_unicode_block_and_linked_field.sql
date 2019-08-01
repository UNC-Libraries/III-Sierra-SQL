select
regexp_matches(v.field_content, '\|6(...)') AS vtag,
-- v.field_content
count(v.id) AS tag_ct
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'
where v.marc_tag = '880'
and v.field_content ~ '[\x109A0-\x109FF]'
group by vtag
order by vtag ASC
