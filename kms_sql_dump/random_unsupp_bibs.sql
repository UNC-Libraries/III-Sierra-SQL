 select 'b' || rm.record_num AS bnum
from sierra_view.bib_record b
inner join sierra_view.record_metadata rm
on b.id = rm.id
where b.is_suppressed = 'f'
order by random()
LIMIT 100000;