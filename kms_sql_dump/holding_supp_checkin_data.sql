select 'c' || h.record_num as hnum, 
-- box.*
  clink.enum_level_count,
  clink.enum_level_a as enum_a_label, box.enum_level_a as enum_a_value,
  clink.enum_level_b as enum_b_label, box.enum_level_b as enum_b_value,
  clink.chron_level_i as chron_i_pattern, box.chron_level_i as chron_i_value,
  clink.chron_level_j as chron_j_pattern, box.chron_level_j as chron_j_value
  --, clink.is_use_autumn

from holding_view h

inner join holding_record_card card
 on card.holding_record_id = h.id
 and (card.is_suppress_opac_display != 't' 
      OR card.is_suppress_opac_display IS NULL )

inner join holding_record_cardlink clink 
 on clink.holding_record_card_id = card.id
 and clink.card_type_code = 's'
 --and clink.enum_level_count = '0'
 --and clink.calendar_change is not NULL

INNER join holding_record_box box 
 on box.holding_record_cardlink_id = clink.id
 and box.is_suppressed = 'f'
 --and box.chron_level_j = '23'

where h.record_num = '2791616'
order by hnum, box.box_count ASC