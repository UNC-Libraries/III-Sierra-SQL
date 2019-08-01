select 
 'b' || rm.record_num || 'a' AS bnum,
ldr.record_type_code,
ldr.bib_level_code,
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
 where 
 v.marc_tag = '655'
 and v.field_content ~ '\|aSongs[.|]'
 and not exists ( select v2.field_content from sierra_view.varfield v2
                 where v2.record_id = v.record_id
                 and v2.marc_tag ~ '^6'
                  and v2.field_content ~ '\|vSongs'
 )
and exists ( select v3.field_content from sierra_view.varfield v3
                 where v3.record_id = v.record_id
                 and v3.marc_tag ~ '915'
                  and v3.field_content ~ '[Uu]nder [Aa]uthority [Cc]ontrol'
		  )