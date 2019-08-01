select record_id
from sierra_view.leader_field
GROUP BY record_id
HAVING COUNT (*) > 1