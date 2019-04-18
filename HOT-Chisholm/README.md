# Chisholm HOT datapackage

## samples_NCBI
Collects metadata associated to the NCBI Biosamples of the bioproject https://www.ncbi.nlm.nih.gov/bioproject/385855. Only samples collected at the ALOHA station were considered (the NCBI project also contains samples from the BATS time series).

Minor corrections were done in order to help the use of the metadata :
  - The field "latitude and longitude" was parsed and separated into two separate fields "latitude" and "longitude".
  - The field "isolation source" contained informations about the "sample_name", the "cruise_name" and "depth_sample".
  - A field "cruise_expedition" was added.
  - A field "filter_min" was added, with information from the published sampling protocol.
  
## samples_CTD_BCO-DMO and samples_Niskin_BCO-DMO
Collects metadata from the closest CTD and Niskin record for each samples. These CTD and Niskin records were obtained from BCO-DMO HOT frictionless datapackage.

### The closest CTD record was obtained for each sample by the followig steps :
  - Load BCO-DMO CTD dataset, convert the "CTDPRS" of the CTD records into an "infered_depth" using the following formula  [see Fofonoff & Millard, 1983: UNESCO]
  - Retrieve CTD records with a matching "cruise_name", "station", and "cast" as the sample.
  - For the selected CTD records, finds the closest "inferred_depth" as the sample "depth". If no record is found in a given range (set as 5m), the sample is considered to have no closest CTD record.

The script is available in scripts/map_ctd_metagenomes.py

### The closest Niskin record was obtained for each sample by the followig steps :
  - Load BCO-DMO Niskin Dataset
  - Retrieve the Niskin record with a matching "cruise_name", "station", "cast" and "Rosette-position" (several Niskin could have been taken at the same depth). The "Rosette-position" for each sample was obtained directly from the experimentator in a personnal communication.

Additional minor corrections were performed on the BCO-DMO CTD and Niskin record for increased readability :
  - The "ISO_DateTime" and "timecode" were combined in "start ISO_DateTime".
  - The "cruise_name" from BCO-DMO was transformed to be consistant with the name displayed in NCBI (e.g. '154' is transformed to 'HOT154')

## sampling_events
A sampling event table was generated from the sample tables. A sampling-event is defined as a unique "cast" and "station" and "cruise_name". The "start_ISO_DateTime", "latitude", "longitude" and "cruise_ID" were retrieved from BCO-DMO.
A "sampling_event_type" was added.

## campaign
A campaign table was generated from the unique "cruise_ID" from the sample table. The cruise was searched in the Rolling Deck repository, in order to obtain the "R2R_cruise_DOI", "start_date", "end_date", "start_location", "end_location" and "CCHDO url".
Additional information about the cruise was searched in BCO-DMO in order to obtain "BCO-DMO summary" and "BCO-DMO deployment".

## CTD_profiles and Niskin_profiles
Complete CTD and Niskin records for a given sampling event were obtained by a simple query on the BCO-DMO HOT frictionless datapackage using the "cruise_name", "station", and "cast" of the sampling event.
