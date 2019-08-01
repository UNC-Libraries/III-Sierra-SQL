select distinct substring(v.field_content FROM '\|a.*') AS heading
from sierra_view.varfield v
where v.marc_tag ~ '^6'
and v.field_content like '%|vDictionaries%'
and v.field_content not like '%|vBio%'
ORDER BY heading ASC