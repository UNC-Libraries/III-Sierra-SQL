SELECT 
'b' || rm.record_num || 'a' AS bnum, 
COALESCE(nullif(cf.p00, ' '), '\') ||
COALESCE(nullif(cf.p01, ' '), '\') ||
COALESCE(nullif(cf.p02, ' '), '\') ||
COALESCE(nullif(cf.p03, ' '), '\') ||
COALESCE(nullif(cf.p04, ' '), '\') ||
COALESCE(nullif(cf.p05, ' '), '\') ||
COALESCE(nullif(cf.p06, ' '), '\') ||
COALESCE(nullif(cf.p07, ' '), '\') ||
COALESCE(nullif(cf.p08, ' '), '\') ||
COALESCE(nullif(cf.p09, ' '), '\') ||
COALESCE(nullif(cf.p10, ' '), '\') ||
COALESCE(nullif(cf.p11, ' '), '\') ||
COALESCE(nullif(cf.p12, ' '), '\') ||
COALESCE(nullif(cf.p13, ' '), '\') ||
COALESCE(nullif(cf.p14, ' '), '\') ||
COALESCE(nullif(cf.p15, ' '), '\') ||
COALESCE(nullif(cf.p16, ' '), '\') ||
COALESCE(nullif(cf.p17, ' '), '\') ||
COALESCE(nullif(cf.p18, ' '), '\') ||
COALESCE(nullif(cf.p19, ' '), '\') ||
COALESCE(nullif(cf.p20, ' '), '\') ||
COALESCE(nullif(cf.p21, ' '), '\') ||
COALESCE(nullif(cf.p22, ' '), '\') ||
COALESCE(nullif(cf.p23, ' '), '\') ||
COALESCE(nullif(cf.p24, ' '), '\') ||
COALESCE(nullif(cf.p25, ' '), '\') ||
COALESCE(nullif(cf.p26, ' '), '\') ||
COALESCE(nullif(cf.p27, ' '), '\') ||
COALESCE(nullif(cf.p28, ' '), '\') ||
COALESCE(nullif(cf.p29, ' '), '\') ||
COALESCE(nullif(cf.p30, ' '), '\') ||
COALESCE(nullif(cf.p31, ' '), '\') ||
COALESCE(nullif(cf.p32, ' '), '\') ||
COALESCE(nullif(cf.p33, ' '), '\') ||
COALESCE(nullif(cf.p34, ' '), '\') ||
COALESCE(nullif(cf.p35, ' '), '\') ||
COALESCE(nullif(cf.p36, ' '), '\') ||
COALESCE(nullif(cf.p37, ' '), '\') ||
COALESCE(nullif(cf.p38, ' '), '\') ||
COALESCE(nullif(cf.p39, ' '), '\') AS date008,
br.cataloging_date_gmt,
rm.record_last_updated_gmt,
rm.previous_last_updated_gmt,
br.bcode1 AS IIIblvl,
br.bcode2 AS IIImattype,
br.bcode3

FROM sierra_view.control_field cf
  
inner join sierra_view.bib_record br
  on cf.record_id = br.record_id
  and br.is_suppressed = 'f'
  and br.cataloging_date_gmt IS NOT NULL
  and br.is_suppressed = 'f'


inner join sierra_view.record_metadata rm
  on cf.record_id = rm.id

WHERE cf.control_num = '8'
  AND cf.p06 = ' '
  AND cf.p07 = ' '
  AND cf.p08 = ' '
  AND cf.p09 = ' '
  AND cf.p10 = ' '
  AND cf.p11 = ' '
  AND cf.p12 = ' '
  AND cf.p13 = ' '
  AND cf.p14 = ' '
  AND cf.p15 = ' '
  AND cf.p16 = ' '
  AND cf.p17 = ' '
  AND cf.p18 = ' '
  AND cf.p19 = ' '
  AND cf.p20 = ' '
  AND cf.p21 = ' '
  AND cf.p22 = ' '
  AND cf.p23 = ' '
  AND cf.p24 = ' '
  AND cf.p25 = ' '
  AND cf.p26 = ' '
  AND cf.p27 = ' '
  AND cf.p28 = ' '
  AND cf.p29 = ' '
  AND cf.p30 = ' '
  AND cf.p31 = ' '
  AND cf.p32 = ' '
  AND cf.p33 = ' '
  AND cf.p34 = ' '
  AND cf.p35 = ' '
  AND cf.p36 = ' '
  AND cf.p37 = ' '
  AND cf.p38 = ' '
  AND cf.p39 = ' '

ORDER BY rm.record_last_updated_gmt ASC