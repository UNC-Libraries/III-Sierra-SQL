select 
'i' || rm.record_num || 'a' AS inum,
v.varfield_type_code, 
v.marc_tag,
v.marc_ind1,
v.marc_ind2,
v.field_content,
i.location_code,
ip.call_number_norm
-- following line formats field data in marceditish way
-- v.marc_tag || ' ' || COALESCE(nullif(v.marc_ind1, ' '), '_') || ' ' || COALESCE(nullif(v.marc_ind2, ' '), '_') || ' ' || replace(v.field_content, '|', '$') AS data
-- following line formats field data in THE marcedit way
-- '=' || v.marc_tag || '  ' || COALESCE(nullif(v.marc_ind1, ' '), '\') || COALESCE(nullif(v.marc_ind2, ' '), '\') || replace(v.field_content, '|', '$') AS data

--' Added to make highlighting act right below

from sierra_view.varfield v
inner join sierra_view.item_record i
on i.id = v.record_id
and i.is_suppressed = 'f'

inner join sierra_view.record_metadata rm
on rm.id = v.record_id

inner join sierra_view.item_record_property ip
on v.record_id = ip.item_record_id

where 
v.varfield_type_code = 'c'
AND v.marc_tag = '050'
--    and v.field_content ~ '^\|a[A-Z]+ '
-- and v.field_content = '|aML96.4 .B3'
and v.field_content LIKE '|aHV9468.G75|bR33 2017%'
-- and v.marc_ind1 = '1'
-- and v.marc_ind2 != '2'

-- and not exists ( select v2.field_content from sierra_view.varfield v2
--                 where v2.record_id = v.record_id
--                 and v2.varfield_type_code = 'c'
-- --                 and v2.marc_tag = '700'
-- --                and v2.marc_ind2 != '2'
-- --                  and v2.field_content ~ '(\|eeditor|\|4ed[ct])'
-- )

-- order by bnum DESC