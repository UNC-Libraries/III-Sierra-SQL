select  
ldr.record_type_code,
ldr.encoding_level_code,
COUNT(DISTINCT rm.id) AS ct

FROM sierra_view.holding_record hr

INNER JOIN sierra_view.leader_field ldr
ON hr.record_id = ldr.record_id

INNER JOIN sierra_view.record_metadata rm
ON hr.record_id = rm.id

WHERE
hr.is_suppressed = 'f'

GROUP BY ldr.record_type_code, ldr.encoding_level_code
ORDER BY ldr.record_type_code, ldr.encoding_level_code ASC