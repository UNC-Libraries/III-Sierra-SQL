select
b.bcode2 AS iii_mattype,
regexp_replace(regexp_replace(regexp_replace(v.field_content, '^ *\|a', ''),
 '\|.*$', ''),
 ' *\. *', '') AS genre_heading,
count(b.id) AS rec_ct
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'
inner join sierra_view.record_metadata rm
on rm.id = v.record_id
where v.marc_tag = '655'
group by iii_mattype, genre_heading
order by rec_ct DESC