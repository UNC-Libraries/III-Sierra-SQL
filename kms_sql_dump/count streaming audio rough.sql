select distinct count(br.id)
from sierra_view.bib_record br
inner join sierra_view.subfield sf
on sf.record_id = br.id
and sf.marc_tag = '773'
and sf.tag = 't'
and sf.field_type_code = 'w'
and sf.content LIKE '%(online collection)%'
WHERE br.bcode2 IN ('i', 'j')
AND br.is_suppressed = 'f'
   and EXISTS (select * from sierra_view.bib_record_location ll
                   WHERE ll.bib_record_id = br.id
                   and ll.location_code ='es'
       )
