select op.code, osn.name
from sierra_view.order_status_property op
inner join sierra_view.order_status_property_name osn
on osn.order_status_property_id = op.id
order by op.code ASC