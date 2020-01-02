# Amazon continuum datapackage

## sample_NCBI
Collects metadata associated to the amazon continuum metagenome in NCBI : 
- metagenomes: https://www.ncbi.nlm.nih.gov/bioproject/237344
- polyA metatranscriptomes: https://www.ncbi.nlm.nih.gov/bioproject/PRJNA237346
- non-specific metatranscriptomes: https://www.ncbi.nlm.nih.gov/bioproject/PRJNA237345
Only samples collected during the first ANACONDA expedition (may-june 2010), and the samples collected during the May 2011 ANACONDA were considered in this datapackage.

#### Minor corrections were done in order to help the use of the metadata :
  - collection_date normalized to a unique format (dd-mm-yyyy)  
  - PAR measurements from the metagenomes were transformed from Em-2/sec into μEm-2/sec to be consistent with the metatranscriptomes.
  - missing units from the metagenomes were derived from the metatranscriptomes
  - The biome "surface seacater" was corrected into "large river delta biome"
  - The feature "large river Plume" was corrected into "river"
  - Biome, feature and material purls were added from ENVO
  - the attributes "investigation type", "sequencing machine", "sequencing method", "target molecule" were removed because describing the experiments, not the samples.
  - lat-long field was split into a lat and long attributes
  - date field and time fields were reformated into standard format (dd-mm-yyyy and hh:mm)
  - an ISO-DateTime field was created from date and time

## sampling event
This table was generated using the samples information. Briefly, unique sampling event where derived from the station number and the ISO-DateTime.
For the first expedition, the Sampling event ID were generated as follow: "expeditionName_station_dateTime"
The sampling event type "pump" was inferred from the collection description in Satinsky et al. 2014: https://doi.org/10.1186/2049-2618-2-17

For the second expedition, the Sampling event ID were generated as follow: "expeditionName_station_date_sampledVolume"
The sampling event type "pump" was inferred from the collection description in XXX

## campaign
This table was inferred from information from the Rolling Deck repository.


