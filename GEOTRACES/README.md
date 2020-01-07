GEOTRACES datapackage

###### IN PROGRESS DO NOT IMPORT ######

# NCBI Data
- Marine metagenomes : https://www.ncbi.nlm.nih.gov/bioproject/385854    

## corrections to the datasets
### Marine metagenomes:
- lat/long corrected into two fields
- purl biome/features/material added

# GEOTRACE Discrete dataset
The "discrete sample data v2" from GEOTRACES dataset was downloaded from the GEOTRACES database https://webodv.awi.de/geotraces
This dataset was connected to the NCBI dataset using the BODC Bottle ID, except for the cruise 'SS2011' for which such identifier was not provided. For this cruise, the samples where reconected to their metagenome using the "Station", "Cast identifier" and the "Niskin number".

A sampling_event ID was generated as followed: SamplingType_CastID_DateTime

## corrections to the datasets
-The longitude was corrected to be expressed in DD (if the measure was above 180, we substracted 360)
-Cast from the same Cruise, sharing strictly the same DateTime, and latitude/longitude were set to share the same CastID