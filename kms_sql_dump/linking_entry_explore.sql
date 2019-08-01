select 'UNCb' || v.record_num || 'a' AS bnum,
v.marc_tag, v.marc_ind1, v.marc_ind2, v.field_content
from sierra_view.varfield_view v
where v.record_type_code = 'b'
--AND v.marc_tag = '780'
--AND v.marc_ind2 = '4'
AND v.marc_tag IN ('760', '762', '765', '767', '770', '772', '773', '774', '775', '777', '780', '785', '786','787')
AND v.marc_ind1 = '0'
AND v.field_content LIKE '|i%'
