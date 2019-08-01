select rm.record_type_code || rm.record_num AS bnum
from sierra_view.control_field cf
inner join sierra_view.record_metadata rm
  on cf.record_id = rm.id
  and rm.record_type_code = 'b'
where cf.control_num = 8
GROUP BY bnum
HAVING COUNT (*) > 1