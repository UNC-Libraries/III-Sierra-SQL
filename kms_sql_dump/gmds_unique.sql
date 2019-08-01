select
regexp_replace(regexp_replace(v.field_content, '^.*\|h', ''), '\].*$', ']') AS gmd,
count(b.id) AS rec_ct
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'
inner join sierra_view.record_metadata rm
on rm.id = v.record_id
where v.marc_tag = '245'
and v.field_content LIKE '%|h%'
group by gmd
order by rec_ct DESC