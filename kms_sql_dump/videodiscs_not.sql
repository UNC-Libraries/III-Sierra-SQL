select 'b' || rm.record_num || 'a',
(
        SELECT STRING_AGG(v.field_content, ';;;')
        FROM sierra_view.varfield v
        WHERE v.record_id = b.id
        AND v.marc_tag = '099'
     ) AS m099,
(
        SELECT STRING_AGG(v.field_content, ';;;')
        FROM sierra_view.varfield v
        WHERE v.record_id = b.id
        AND v.marc_tag = '340'
     ) AS m340,
(
        SELECT STRING_AGG(v.field_content, ';;;')
        FROM sierra_view.varfield v
        WHERE v.record_id = b.id
        AND v.marc_tag = '300'
     ) AS m300,
(
        SELECT STRING_AGG(v.field_content, ';;;')
        FROM sierra_view.varfield v
        WHERE v.record_id = i.id
        AND v.varfield_type_code = 'c'
     ) AS item_call,
i.location_code,
*

 from sierra_view.bib_record b
inner join sierra_view.record_metadata rm on rm.id = b.id
inner join sierra_view.control_field cf on cf.record_id = b.id and cf.control_num = '7' and cf.p00 = 'v' and cf.p01 = 'd' and cf.p04 = 'g'
inner join sierra_view.varfield v on rm.id = v.record_id
and v.marc_tag = '300'
and v.field_content !~* 'video ?dis[ck].*12 in'
left join sierra_view.bib_record_item_record_link bil on bil.bib_record_id = b.id
left join sierra_view.item_record i on i.id = bil.item_record_id
order by i.location_code, item_call, m099