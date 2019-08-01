 select 'b' || rm.record_num AS bnum,
b.cataloging_date_gmt
from sierra_view.bib_record b
inner join sierra_view.record_metadata rm
on b.id = rm.id
where b.is_suppressed = 'f'
and b.cataloging_date_gmt > (LOCALTIMESTAMP - INTERVAL '5 day')
order by random()
LIMIT 25;