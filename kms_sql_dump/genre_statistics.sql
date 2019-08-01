 select 
'b' || rm.record_num || 'a' AS bnum,
v.varfield_type_code,
v.marc_ind1,
v.marc_ind2,
v.field_content
 from sierra_view.varfield v
 inner join sierra_view.bib_record b
 on b.id = v.record_id
   and b.cataloging_date_gmt < '2018-03-30'
 and b.is_suppressed = 'f'
 inner join sierra_view.record_metadata rm
 on rm.id = v.record_id
 inner join sierra_view.leader_field ldr
 on b.id = ldr.record_id
 and (ldr.record_type_code = 't' OR (ldr.record_type_code = 'a' AND ldr.bib_level_code ~ '[acdm]'))
 inner join sierra_view.control_field cf
 on b.id = cf.record_id
 and 
    cf.control_num = '8' AND (cf.p24 = 's' OR cf.p25 = 's' OR cf.p26 = 's' OR cf.p27 != 's')
 where 
 v.marc_tag = '655'
 and v.field_content ~ '\|aStatistics\.'
 and not exists ( select v2.field_content from sierra_view.varfield v2
                 where v2.record_id = v.record_id
                 and v2.marc_tag ~ '^6'
                  and v2.field_content ~ '\|vStatistics'
 )
and exists ( select v3.field_content from sierra_view.varfield v3
                 where v3.record_id = v.record_id
                 and v3.marc_tag = '915'
                  and v3.field_content ~ '[Uu]nder [Aa]uthority [Cc]ontrol'
 )

-- GROUP BY v.varfield_type_code, v.marc_ind1, v.marc_ind2, v.field_content
