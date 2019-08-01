select * 
from sierra_view.control_field cf
inner join sierra_view.record_metadata rm 
on cf.record_id = rm.id
and rm.record_type_code = 'b'
and rm.record_num = '6348986'