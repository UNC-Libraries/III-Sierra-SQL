select enum_level_a, count(enum_level_a) as ct
from sierra_view.holding_record_cardlink
group by enum_level_a
order by ct DESC