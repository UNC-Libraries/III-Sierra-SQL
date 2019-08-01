SELECT
  o.ocode3 AS ord_proj,
  om.copies,
  o.received_date_gmt AS rcvdate,
  o.catalog_date_gmt AS catdate,
  TRIM(
    TRAILING ' '
    FROM
      om.location_code
  )AS LOCATION,
  o.order_status_code AS status
FROM
  sierra_view.bib_record_order_record_link bo
INNER JOIN sierra_view.order_record o ON o.record_id = bo.order_record_id
AND o.ocode3 != 'n'
INNER JOIN (
SELECT DISTINCT ON (cmf.order_record_id) * from sierra_view.order_record_cmf cmf
 ORDER BY cmf.order_record_id, cmf.id ASC 
) AS om
on bo.order_record_id = om.order_record_id
WHERE
  bo.bib_record_id = '420915087729';