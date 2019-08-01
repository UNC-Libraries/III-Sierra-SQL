select lc.code, ln.name
from sierra_view.location lc
inner join sierra_view.location_name ln
on lc.id = ln.location_id
and ln.iii_language_id = '1'
order by lc.code ASC