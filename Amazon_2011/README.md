# Amazon continuum 2010 datapackage

## sample_NCBI
Collects metadata associated to the amazon continuum metagenome in NCBI : 
- metagenomes: https://www.ncbi.nlm.nih.gov/bioproject/237344
- non-specific metatranscriptomes: https://www.ncbi.nlm.nih.gov/bioproject/PRJNA237345
Only samples collected during the May 2011 ANACONDA expedition were considered in this datapackage.

#### Minor corrections were done in order to help the use of the metadata :
  - collection_date normalized to a unique format (dd-mm-yyyy)  
  - lat-long field was split into a lat and long attributes
  - The attributes "sequencing_machine", "sequencing_method", "target_molecules" and "investigation_type" were removed because describing the experiment, not the sample

## sampling event
This table was generated using the samples information. Briefly, unique sampling event where derived from the station number, latitude-longitude and Date.
Sampling event ID were generated as follow: "expeditionName_station_date_sampledVolume"
The sampling event type "pump" was inferred from the collection description in XXX