select DISTINCT rm.record_type_code || rm.record_num AS bnum, 
       v.varfield_type_code,
       v.marc_tag,
       v.field_content
from varfield v
inner join record_metadata rm
on v.record_id = rm."id"
where rm.record_type_code = 'b'
and v.marc_tag = '773'
and v.varfield_type_code = 'w'
      and 
      v.field_content ~* 'ebrary academic complete \(online collection\)'
 
