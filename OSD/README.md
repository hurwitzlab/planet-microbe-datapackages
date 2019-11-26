# OSD2014 datapackage

## osd_sample
Collects metadata associated to the OSD2015 dataset in Pangea : https://doi.pangaea.de/10.1594/PANGAEA.854419
Only samples with metagenomic dataset associated are reported in this data package. Additional samples not sequenced in this study are not taken into account. 


#### Minor corrections were done in order to help the use of the metadata :
  - The field "Comment" was parsed and divided as "Comment OBJECTIVE", "Comment PLATFORM", "Comment DEVICE REPORTED" and "Comment DESCRIPTION"
  - For a small number of samples (e.g OSD131_2014-06-21_1m_NPL022), metadata were missing from the Pangea record but available in NCBI ( https://www.ncbi.nlm.nih.gov/bioproject/276999 ). Their records were updated using NCBI metadata.
  - purl_biome, purl_feature and purl_material were infered from the biome, feature and material provided by the PI.
  - the features "sea water" and "surface water" (these terms are material entities) where corrected to the appropriate feature from the localisation information.
  - Mediterreanean sea biome was added where necessary

#### Major modifications :

the fields "Quantity", "Container", "Content", "Size-fraction upper threshold", "Size-fraction, lower threshold", "Treatment chemicals" and "Treatment storage" were derived by reading the scanned paper records stored in : http://store.pangaea.de/Projects/OSD_2014/


## sampling_events
A sampling event table was generated from the sample information in Pangea. A sampling-event is defined as a unique "sample_event_ID".

