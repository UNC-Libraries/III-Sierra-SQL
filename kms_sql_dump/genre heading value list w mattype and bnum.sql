select DISTINCT 'b' || rm.record_num || 'a' AS bnum,
b.bcode2 AS iii_mattype,
v.field_content AS genre_heading,
vt.field_content AS title,
vd.field_content AS description
-- regexp_replace(regexp_replace(regexp_replace(v.field_content, '\|[02][^|]+', ''),
--  '\|.', ' '),
--  '^ +', '') AS genre_heading
from sierra_view.varfield v

left outer join sierra_view.varfield vt on v.record_id = vt.record_id and vt.marc_tag = '245'

left outer join sierra_view.varfield vd on v.record_id = vd.record_id and vd.marc_tag = '300'

inner join sierra_view.bib_record b
on b.id = v.record_id
and b.is_suppressed = 'f'
and b.cataloging_date_gmt < '2018-03-30'

inner join sierra_view.record_metadata rm
on rm.id = v.record_id

where v.marc_tag = '655'
and v.field_content ~ '\|2lcgft'
AND v.field_content !~ '\|[vxyz]'

and exists ( select v3.field_content from sierra_view.varfield v3
                 where v3.record_id = v.record_id
                 and v3.marc_tag = '915'
                  and v3.field_content ~ '[Uu]nder [Aa]uthority [Cc]ontrol'
 )

-- LIMIT 100