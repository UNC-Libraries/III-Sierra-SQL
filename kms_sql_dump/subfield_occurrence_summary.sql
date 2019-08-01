select sf.marc_tag, count(sf.varfield_id)
from sierra_view.subfield sf
inner join sierra_view.bib_record b
on b.id = sf.record_id
and b.is_suppressed = 'f'
where sf.tag = '3'
group by sf.marc_tag