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
INNER JOIN sierra_view.order_record_cmf om ON om. ID =(
  SELECT
    cmf. ID
  FROM
    sierra_view.order_record_cmf cmf
  WHERE
    cmf.order_record_id = bo.order_record_id
  ORDER BY
    cmf. ID
  LIMIT 1
)
WHERE
  bo.bib_record_id = '420915087729';