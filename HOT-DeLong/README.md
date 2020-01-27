# DeLong HOT metagenomes datapackage

## samples_NCBI
Collects metadata associated to the NCBI Biosamples of the bioproject https://www.ncbi.nlm.nih.gov/bioproject/16339 . Only samples with metagenomes collected at the ALOHA station were considered (the NCBI project also contains samples from 16s sequencing, Fosmid library and other products).

Minor corrections were done in order to help the use of the metadata :
  - The field "Date Time" was converted into the ISO date-Time format
  - The field "latitude and longitude" was parsed and separated into two separate fields "latitude" and "longitude".
  - The field "depth" contained a 'm' in the field. This was removed and the unit was specified in meters.
  - A field "filter_min" and "filter_max" was added, with information from the biosample description.
  - Add purls for biome, feature and material

## samples_paper1
Collects metadata associated to the samples from the paper :
https://www.nature.com/articles/ismej2015221
The metadata is available in supplemental material 1.
Minor corrections were performed on the dataset:
- Fields `heterotrophic bacteria cell counts`, `Prochlorococcus cell counts`, `Synechococcus cell counts`,	`Picoeukaryote cell counts` were multiplied as to be reported in `cells/ml` rather than `cells*1e5/ml`.
- Added `Sample Date/Time GMT` field based on the combination of `Sample Date GMT`, `Sampling Time GMT` fields. 

## samples_CTD_BCO-DMO and samples_Niskin_BCO-DMO
Collects metadata from the closest CTD and Niskin record for each samples. These CTD and Niskin records were obtained from BCO-DMO HOT frictionless datapackage.

### The closest CTD record was obtained for each sample by the followig steps :
  - Load BCO-DMO CTD dataset, convert the "CTDPRS" of the CTD records into an "infered_depth" using the following formula  [see Fofonoff & Millard, 1983: UNESCO]
  - Retrieve CTD records with a matching "cruise_name", "station", and "cast" as the sample.
  - For the selected CTD records, finds the closest "inferred_depth" as the sample "depth". If no record is found in a given range (set as 5m), the sample is considered to have no closest CTD record.
  - information about the cast and not the sample (cast maximum depth and pressure) where removed from the samples_CTD_BCO-DMO table

The script is available in scripts/map_ctd_metagenomes.py

### The closest Niskin record was obtained for each sample by the followig steps :
  - Load BCO-DMO Niskin Dataset
  - Retrieve the Niskin record with a matching "cruise_name", "station", "cast" and "Rosette-position" (several Niskin could have been taken at the same depth). The "Rosette-position" for each sample was obtained directly from the experimentator in a personnal communication.

Additional minor corrections were performed on the BCO-DMO CTD and Niskin record for increased readability :
  - The "ISO_DateTime" and "timecode" were combined in "start ISO_DateTime".
  - The "cruise_name" from BCO-DMO was transformed to be consistant with the name displayed in NCBI (e.g. '154' is transformed to 'HOT154')
  - information about the cast and not the sample (cast maximum depth and pressure) where removed from the samples_CTD_BCO-DMO table

## sampling_events
A sampling event table was generated from the sample tables. A sampling-event is defined as a unique "cast" and "station" and "cruise_name". The "start_ISO_DateTime", "latitude", "longitude" and "cruise_ID" were retrieved from BCO-DMO.
A "sampling_event_type" was added.

## campaign
A campaign table was generated from the unique "cruise_ID" from the sample table. The cruise was searched in the Rolling Deck repository, in order to obtain the "R2R_cruise_DOI", "start_date", "end_date", "start_location", "end_location" and "CCHDO url", "SAMOS URL" and "WHOI URL".
Additional information about the cruise was searched in BCO-DMO in order to obtain "BCO-DMO summary" and "BCO-DMO deployment".
