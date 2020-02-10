# GEOTRACES datapackage


## NCBI Data
Collects metadata associated to the NCBI Biosamples of the bioproject: https://www.ncbi.nlm.nih.gov/bioproject/385854    

### corrections to the dataset
- lat/long corrected into two fields
- purl biome/features/material added

## sampling_events
The "discrete sample data v2" from GEOTRACES dataset was retrieved from the GEOTRACES database https://webodv.awi.de/geotraces
This dataset was connected to the NCBI dataset using the BODC Bottle ID, except for the cruise 'SS2011' for which such identifier was not provided. For this cruise, the samples where reconected to their metagenome using the "Station", "Cast identifier" and the "Niskin number".

A sampling_event ID was generated as followed: SamplingType_CastID_DateTime

## campaign
A campaign table was generated from the unique "cruise_ID" from the sample table. The cruise was searched in the Rolling Deck repository, in order to obtain the "R2R_cruise_DOI", "start_date", "end_date", "start_location", "end_location" and "CCHDO url".
Additional information about the cruise was searched in BCO-DMO in order to obtain "BCO-DMO summary" and "BCO-DMO deployment".
