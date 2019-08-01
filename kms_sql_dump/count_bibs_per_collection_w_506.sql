SELECT
  fullct.colltitle as collectionTitle,
  fullct.fct as recsInCollection,
  authct.act as recsWith506,
  (fullct.fct - authct.act) as difference
FROM
  (
    SELECT
      tmp1.colltitle AS colltitle,
      COUNT(*)AS fct
    FROM
      (
        SELECT
          v1.field_content AS colltitle
        FROM
          sierra_view.varfield v1
        WHERE
          v1.marc_tag = '773'
        AND v1.field_content ~ '\(online collection\)|Undergraduate library Kindle ebook collection'
      )tmp1
    GROUP BY
      1
    ORDER BY
      tmp1.colltitle ASC
  )fullct
left OUTER JOIN
  (
    SELECT
      tmp2.colltitle AS colltitle,
      COUNT(*)AS act
    FROM
      (
        SELECT
          v1.field_content AS colltitle
        FROM
          sierra_view.varfield v1
        WHERE
          v1.marc_tag = '773'
        AND v1.field_content ~ '\(online collection\)|Undergraduate library Kindle ebook collection'
        AND EXISTS(
          SELECT
            *
          FROM
            sierra_view.varfield v2
          WHERE
            v2.record_id = v1.record_id
          AND v2.marc_tag = '506'
          AND v2.field_content ~ '\|aAccess limited to UNC Chapel Hill-authenticated users\.'
        )
      )tmp2
    GROUP BY
      1
  ) authct ON authct.colltitle = fullct.colltitle
ORDER BY difference DESC