 select 'b' || record_num AS bnum,
         to_char(cataloging_date_gmt, 'YYYYMMDD'),
         bcode2
from sierra_view.bib_view 
where record_type_code = 'b'
order by random()
LIMIT 5000;