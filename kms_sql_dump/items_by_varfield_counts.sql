select 
COUNT(ip.item_record_id) as ict,
v.marc_tag,
v.marc_ind1,
v.marc_ind2

from sierra_view.varfield v
inner join sierra_view.item_record i
on i.id = v.record_id
and i.is_suppressed = 'f'

inner join sierra_view.record_metadata rm
on rm.id = v.record_id

inner join sierra_view.item_record_property ip
on v.record_id = ip.item_record_id

where 
v.varfield_type_code = 'c'
-- AND v.marc_tag = '096'
AND v.marc_tag NOT IN  ('050', '060', '070', '082', '083', '090', '092', '096', '099')
GROUP BY v.marc_tag, v.marc_ind1, v.marc_ind2

ORDER BY ict DESC