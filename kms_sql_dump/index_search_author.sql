select DISTINCT rm.record_type_code || rm.record_num AS bnum
from varfield v
inner join record_metadata rm
on v.record_id = rm."id"
where rm.record_type_code = 'b'
and ( 
  (v.marc_tag in ('100', '110', '111') 
   AND v.varfield_type_code = 'a')
  OR 
  (v.marc_tag in ('400', '410', '411', '800', '810', '811')
   AND v.varfield_type_code = 's')
  OR
  (v.marc_tag in ('700', '705', '710', '711')
   AND v.varfield_type_code = 'b')
)
      and 
      v.field_content ~* '\|aUnited States\.?(\|b| )Congress\.?(\|b| )House[,. ]?(\|[^abcdgnq]| *$)'
 
