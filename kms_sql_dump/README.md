# Everyday workhorses

* bib_var_field_by_marc_tag

  The main query I used daily to find stuff for online catalog work. Tons of different search options present but commented out, to enable quick and flexible queries primarily focused on variable fields
* bibs by ldr and ff values

  Find bibs with certain combinations of LDR and other fixed field values
* 008_or_006_search

  Find bibs by 008/006 values
* relator_term_find

  Find bibs having a given relator term or code
* bib_varfields

  Given a bnum, show me all the variable fields

# Large scale reporting and analysis of catalog data

* gmds_unique

  List of all unique 245|h values in the catalog and how many times each occurs
* count_by_bib_varfield_values

  Given a MARC tag, find all unique values of that field content, and tell how many times each occurs. For 066: 
  
``` 
|c$1      92441
|c(N      22997
|c(N|c(Q  6154
|c(3      5531
|c(2      741
|c(3|c(4  684
```

* subfield_5_report

  Find fields with non-standard |5 values
* subfield_occurrence_summary

  Given '3', learn that 383,296 856 fields have a |3, while only 2 581 fields have a |3

* serials_with_no_ser_type

  Find unique invalid or empty SerType codes used in bibs cataloged as continuing resource and give count of how many records have that coding
* genre heading value list w mattype and bnum

  Produce a gigantic report that can be used to identify genre headings that should be flipped back to subject headings. Limits to records under authority control that were cataloged before we had LTI turn this "feature" off
  
# Other
* Any query with 'invalid' in the name

  Probably gives you a list of records with invalid fixed field values
