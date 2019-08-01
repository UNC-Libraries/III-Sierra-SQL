SELECT rm.record_type_code,
COUNT(rm.id)
FROM sierra_view.hold h
INNER JOIN sierra_view.record_metadata rm
ON h.record_id = rm.id
GROUP BY rm.record_type_code