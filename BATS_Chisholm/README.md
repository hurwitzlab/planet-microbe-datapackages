# BATS Chisholm datapackage

## NCBI Data
Collects metadata associated to the NCBI Biosamples of the bioproject https://www.ncbi.nlm.nih.gov/bioproject/385855. Only samples collected at the BATS station were considered (the NCBI project also contains samples from the HOT time series).

Minor corrections were done in order to help the use of the metadata :
  - The field "latitude and longitude" was parsed and separated into two separate fields "latitude" and "longitude".
  - The field "environmental medium" was corrected as "seawater"
  - purls corresponding to the biome, feature and material was added using the description from the dataset

## BCO-DMO sample dataset
The BCO-DMO dataset associated to BATS project was downloaded from https://www.bco-dmo.org/project/2124

### The closest Niskin record was obtained for each sample by the followig steps :
  - Load BCO-DMO Niskin Dataset
  - Retrieve the Niskin record with a matching "bottle_id" than the NCBI samples

### The closest CTD record was obtained for each sample by the followig steps :
  - Load BCO-DMO CTD dataset
  - Retrieve CTD records with a matching "cruise_name", "ISO_datetime" and "cast" as the sample.
  - For the selected CTD records, finds the closest "depth" as the Niskin record "depth" for the sample.

The script is available in scripts/selection_CTD_BATS.R and scripts/selection_Niskin_BATS.R

## sampling_events
A sampling event table was generated from the sample tables. A sampling-event is defined as a unique "cast" and "station" and "cruise_name". The sampling event ID was created as followed:
"BATS_"+cruise_id+"_"+cast_nb+"_"+date-time

## campaign
A campaign table was generated from the unique "cruise_ID" from the sample table. The cruise was searched in the Rolling Deck repository, in order to obtain the "R2R_cruise_DOI", "start_date", "end_date", "start_location", "end_location" and "CCHDO url".
Additional information about the cruise was searched in BCO-DMO in order to obtain "BCO-DMO summary" and "BCO-DMO deployment".

## CTD_profiles and Niskin_profiles
Complete CTD and Niskin records for a given sampling event were obtained by a simple query on the BCO-DMO BATS frictionless datapackage using the "cruise_name", "station", and "cast" of the sampling event.
