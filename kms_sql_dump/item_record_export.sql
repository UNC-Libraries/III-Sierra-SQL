SELECT
                      'i' || rmi.record_num AS REC_KEY,
                      iv.barcode AS BARCODE,
                      i.icode1 AS ICODE1,
                      i.icode2 AS ICODE2,
                      i.itype_code_num AS I_TYPE,
                      i.location_code AS LOCATION,
                      i.agency_code_num AS AGENCY,
                      i.item_status_code AS STATUS,
                      REPLACE(
                        REPLACE(
                          CAST(i.is_inherit_loc AS TEXT),
                          'false',
                          'n'
                        ),
                        'true',
                        'y'
                      )AS INHERIT_LOC,
                      i.price AS PRICE,
                      to_char(
                        i.last_checkin_gmt,
                        'YYYY-MM-DD HH24:MI'
                      )AS LCHKIN,
                      i.checkout_total AS TOT_CHKOUT,
                      i.renewal_total AS TOT_RENEW,
                      i.last_year_to_date_checkout_total AS LYRCIRC,
                      i.year_to_date_checkout_total AS YTDCIRC,
                      i.copy_num AS COPY_NUM,
                      i.checkout_statistic_group_code_num AS OUT_LOC,
                      rmp.record_num AS lpatron,
                      i.checkin_statistics_group_code_num AS IN_LOC,
                      i.use3_count AS IUSE3,
                      to_char(
                        i.last_checkout_gmt,
                        'YYYY-MM-DD HH24:MI'
                      )AS LOUTDATE,
                      i.internal_use_count AS INTL_USE,
                      i.copy_use_count AS COPY_USE,
                      i.item_message_code AS IMESSAGE,
                      i.opac_message_code AS OPACMSG,
                      i.holdings_code AS HLDG_TAG,
                      to_char(
                        rmi.creation_date_gmt,
                        'YYYY-MM-DD HH24:MI'
                      )AS CREATED
                    FROM
                      sierra_view.item_record i
                    INNER JOIN sierra_view.record_metadata rmp ON i.last_patron_record_metadata_id = rmp.ID
INNER JOIN sierra_view.record_metadata rmi ON i.id = rmi.id
AND rmi.deletion_date_gmt is NULL
INNER JOIN sierra_view.item_view iv ON i.id = iv.id
                    ORDER BY
                      rmi.record_num ASC