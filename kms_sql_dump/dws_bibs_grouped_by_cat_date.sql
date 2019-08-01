select 
b.cataloging_date_gmt
,
count (b.id) AS rec_ct
from sierra_view.varfield v
inner join sierra_view.bib_record b
on b.id = v.record_id
where v.marc_tag = '919'
and v.field_content ~ 'dwsgpo'
group by b.cataloging_date_gmt
order by b.cataloging_date_gmt DESC