-- DROP TABLE troup_ocns;
-- 
-- CREATE TEMP TABLE troup_ocns AS
-- SELECT 
-- vocn.record_id,
-- vocn.field_content 
-- FROM varfield vocn
-- INNER JOIN varfield v ON vocn.record_id = v.record_id
-- AND v.marc_tag = '919'
-- AND v.field_content ~* '^\|aTROUP'
-- WHERE vocn.marc_tag = '001'
-- ;

-- CREATE TEMP TABLE ocn_fields AS
-- SELECT vo.record_id, vo.field_content
-- FROM varfield vo
-- INNER JOIN record_metadata rm ON vo.record_id = rm.id
-- AND rm.record_type_code = 'b'
-- WHERE vo.marc_tag = '001'
-- ;
 
-- CREATE TEMP TABLE dupe_ocns AS
-- SELECT o1.record_id AS rec1,
-- o2.record_id AS rec2,
-- o1.field_content
-- FROM ocn_fields o1
-- INNER JOIN ocn_fields o2 ON o1.record_id <> o2.record_id
-- AND o1.field_content = o2.field_content
-- ;

SELECT 
DISTINCT 'b' || rm.record_num || 'a' AS bnum,
d.field_content AS oclc_num
FROM dupe_ocns d
INNER JOIN troup_ocns t ON t.field_content = d.field_content
AND d.rec1 <> t.record_id
INNER JOIN record_metadata rm
ON d.rec1 = rm.id
