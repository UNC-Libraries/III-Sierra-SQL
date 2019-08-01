select id2reckey(order_record_id) AS order_rec_key,
       order_record_id
from sierra_view.bib_record_order_record_link
where bib_record_id = sierra_view.reckey2id('b8327759');