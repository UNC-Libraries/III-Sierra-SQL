select mp.code, mn.name
from sierra_view.material_property mp
inner join sierra_view.material_property_name mn
on mn.material_property_id = mp.id
order by mp.code ASC