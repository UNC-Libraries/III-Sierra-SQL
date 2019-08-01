select 
'b' || rm.record_num || 'a' AS bnum, 
br.bcode2,
items.location_code,
ln.name
from sierra_view.bib_record_item_record_link bi
inner join (select i.record_id as item_id, i.location_code
from sierra_view.item_record i
-- aart - Art Library Artists' Book  Collection
-- hhta	- Highway Safety Research Center Library Archives
-- kwrar - Law Library Archives
-- kwrc - Law Library Special Collections
-- nohb - Health Sciences Library History Collection
-- uldaa - Media Resources Center Screenplay
-- vama - School of Government Library Rare Book Room
-- w - Wilson locations
-- xcea - Carolina Population Center Library Reports, Offprints, Papers
-- ydrc - Park Library (School of Media & Journalism) Student Papers
-- ygdd - Botanical library archives
where i.location_code !~ '^(aart|hhta|kwrar|nohb|uldaa|vama|w|xcea|ydrc|ygdd)'
and i.item_status_code != 'w') items
on items.item_id = bi.item_record_id
inner join sierra_view.location loc
on items.location_code = loc.code
inner join sierra_view.location_name ln
on loc.id = ln.location_id
and ln.name !~ '([Mm]icro(form|film|fiche|card|opaque|print)|[Tt]hes[ei]s|[Cc]age| [Rr]are |[Vv]ault)'
inner join sierra_view.bib_record br
on bi.bib_record_id = br.id
and br.is_suppressed = 'f'
inner join sierra_view.leader_field ldr
on bi.bib_record_id = ldr.record_id
and ldr.record_type_code = 't'
inner join sierra_view.record_metadata rm
on bi.bib_record_id = rm."id"
and not exists ( select v.field_content from sierra_view.varfield v
                where v.record_id = bi.bib_record_id
                and v.marc_tag = '502'
)

order by ln.name asc