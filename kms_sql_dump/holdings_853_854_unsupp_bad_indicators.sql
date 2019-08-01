select 'c' || v.record_num || 'a' AS hnum,
hl.location_code,
to_char(rm.creation_date_gmt, 'YYYY-MM-DD') AS create_date,
to_char(rm.record_last_updated_gmt, 'YYYY-MM-DD') AS update_date,
v.marc_tag,
v.marc_ind1,
v.marc_ind2,
v.occ_num,
v.field_content
from sierra_view.varfield_view v
INNER JOIN sierra_view.holding_record_location hl 
ON hl.holding_record_id = v.record_id
INNER JOIN sierra_view.record_metadata rm
ON v.record_id = rm.id
INNER JOIN sierra_view.holding_record hr
ON v.record_id = hr.record_id
AND hr.is_suppressed = 'f'
where v.record_type_code = 'c'
and v.marc_tag IN ('853', '854')
and ( v.marc_ind1 NOT IN ('0', '1', '2', '3')
    OR
     v.marc_ind2 NOT IN ('0', '1', '2', '3') )
