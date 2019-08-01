select 
'b' || rm.record_num || 'a' AS bnum,
ldr.bib_level_code,
b.language_code,
b.bcode1,
b.bcode2, 
locs.locations


from sierra_view.bib_record b

inner join sierra_view.leader_field ldr
on b.id = ldr.record_id
and ldr.bib_level_code !~ '[abcdims]'

inner join sierra_view.record_metadata rm
on rm.id = b.id

inner join (SELECT bib_record_id,
                      STRING_AGG(Trim(trailing FROM location_code), ', ' order by id) AS locations
               FROM   sierra_view.bib_record_location
               WHERE location_code != 'multi'
               GROUP  BY bib_record_id ) locs
             ON b.id = locs.bib_record_id
where 
b.is_suppressed = 'f'
and b.cataloging_date_gmt is not null

