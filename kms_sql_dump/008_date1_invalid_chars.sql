SELECT 
'b' || rm.record_num || 'a' AS bnum, 
COALESCE(nullif(cf.p06, ' '), '\') ||
COALESCE(nullif(cf.p07, ' '), '\') ||
COALESCE(nullif(cf.p08, ' '), '\') ||
COALESCE(nullif(cf.p09, ' '), '\') ||
COALESCE(nullif(cf.p10, ' '), '\') ||
COALESCE(nullif(cf.p11, ' '), '\') ||
COALESCE(nullif(cf.p12, ' '), '\') ||
COALESCE(nullif(cf.p13, ' '), '\') ||
COALESCE(nullif(cf.p14, ' '), '\') AS date008


FROM sierra_view.control_field cf
  
inner join sierra_view.bib_record br
  on cf.record_id = br.record_id
  and br.is_suppressed = 'f'

inner join sierra_view.record_metadata rm
  on cf.record_id = rm.id

WHERE cf.control_num = '8'
  AND (cf.p07 ~ '[^0-9 u|]' OR cf.p08 ~ '[^0-9 u|]' OR cf.p09 ~ '[^0-9 u|]' OR cf.p10 ~ '[^0-9 u|]')

