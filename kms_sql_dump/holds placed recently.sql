SELECT
  to_char(h.placed_gmt, 'YYYYMMDD')AS hold_date,
  i.barcode AS item_barcode,
  pv.barcode AS patron_barcode,
  REPLACE(
    btrim(
      concat_ws(
        ' ',
        pfn.first_name,
        pfn.middle_name,
        pfn.last_name,
        pfn.suffix
      ),
      ' '
    ),
    '  ',
    ' '
  )AS patron_name,
  pe.field_content AS patron_email,
  btrim(
    regexp_replace(
      ba.field_content,
      '\|.',
      ' ',
      'g'
    ),
    ' '
  )AS author,
  btrim(
    regexp_replace(
      regexp_replace(
        bt.field_content,
        '\/?\s?\|c.*$',
        ''
      ),
      '\|.',
      ' ',
      'g'
    ),
    ' '
  )AS title,
  btrim(
    regexp_replace(
      (
        SELECT
          v.field_content
        FROM
          sierra_view.varfield v
        WHERE
          v.marc_tag IN('260', '264')
        AND bil.bib_record_id = v.record_id
        ORDER BY
          v.occ_num ASC FETCH FIRST ROW ONLY
      ),
      '\|.',
      ' ',
      'g'
    ),
    ' '
  )AS imprint,
  i.copy_num AS copy_num,
  btrim(
    regexp_replace(
      ic.field_content,
      '\|.',
      ' ',
      'g'
    ),
    ' '
  )AS item_call_no,
  iv.field_content AS itemvol,
  i.record_type_code || i.record_num AS inum,
  bil.bib_record_id
FROM
  sierra_view. HOLD h
INNER JOIN sierra_view.item_view i ON h.record_id = i. ID
AND i.location_code IN('trln', 'troup')
INNER JOIN sierra_view.bib_record_item_record_link bil ON i. ID = bil.item_record_id
AND bil.bibs_display_order = '0'
LEFT OUTER JOIN sierra_view.patron_view pv ON h.patron_record_id = pv. ID
LEFT OUTER JOIN sierra_view.patron_record_fullname pfn USING(patron_record_id)
LEFT OUTER JOIN sierra_view.varfield pe ON h.patron_record_id = pe.record_id
AND pe.varfield_type_code = 'z'
LEFT OUTER JOIN sierra_view.varfield ba ON bil.bib_record_id = ba.record_id
AND ba.varfield_type_code = 'a'
AND ba.occ_num = '0'
LEFT OUTER JOIN sierra_view.varfield bt ON bil.bib_record_id = bt.record_id
AND bt.marc_tag = '245'
LEFT OUTER JOIN sierra_view.varfield ic ON h.record_id = ic.record_id
AND ic.varfield_type_code = 'c'
LEFT OUTER JOIN sierra_view.varfield iv ON h.record_id = iv.record_id
AND iv.varfield_type_code = 'v'
WHERE
  h.placed_gmt >(CURRENT_TIMESTAMP - INTERVAL '18 hours' - INTERVAL '30 minutes')
ORDER BY
  h.placed_gmt ASC;