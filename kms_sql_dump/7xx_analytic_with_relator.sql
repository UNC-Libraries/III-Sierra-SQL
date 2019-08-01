select rm.record_type_code || rm.record_num AS bnum, 
       v.marc_tag,
       v.field_content
from varfield v
inner join record_metadata rm
on v.record_id = rm."id"
where v.varfield_type_code = 'b'
and v.marc_ind2 = '2'
and ( ( v.marc_tag in ('700', '710')
      and 
      v.field_content ~ '\|[e4]' )
     OR
       ( v.marc_tag = '711' 
         AND 
         v.field_content ~ '\|[j4]' )
)