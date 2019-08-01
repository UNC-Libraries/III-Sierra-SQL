select vt.code,
vt.marc_tag,
vt.is_enabled,
vn.short_name,
vn."name"
from sierra_view.varfield_type vt
inner JOIN sierra_view.varfield_type_name vn
ON vt.id = vn.varfield_type_id
AND vn.iii_language_id = '1'
WHERE vt.record_type_code = 'c'
ORDER BY vt.code
