# HOT Delong metatranscriptome datapackage

## samples_NCBI
Collects metadata associated to the NCBI Biosamples of the bioproject https://www.ncbi.nlm.nih.gov/bioproject/16339. Only samples on which metatranscriptomes were performed were considered (the NCBI project also contains metagenomic samples).

Minor corrections were done in order to help the use of the metadata :

-the field "sample_name" was parsed to retrieve the depth and HOT cruise name

-the longitude values for the first four samples were changed from (positive) 158 to -158

-the fields env_biome, env_feature, env_material and their associated purls where created


## samples_paper
Papers reporting the results obtained for these samples were parsed for additional information. Importantly, filtration cutoff sizes were retrieved from the method of these papers.

HOT179 : https://www.ncbi.nlm.nih.gov/pubmed/19444216

HOT186 : https://www.ncbi.nlm.nih.gov/pubmed/20220791

## samples_CTD_BCO-DMO
Collects metadata from the closest CTD record for each samples. These CTD records were obtained from BCO-DMO HOT frictionless datapackage. Niskin records couldn't be match for this dataset (original bottle ID not available).

In order to match the samples to their closest CTD measure and CTD profiles, additional information on the cast number were provided by the original authors.

HOT-179 :  25m :  stn 2, cast 1

HOT-179 :  75m :  stn 2, cast 4

HOT-179 :  125m :  stn 2, cast 5

HOT-179 :  500m :  stn 2, cast 19

HOT-186 :  25m :  stn 2, casts 29 & 30

HOT-186 :  75m :  stn 2, casts 25 & 27

HOT-186 :  110m :  stn 2, casts 10 & 11

HOT-186 :  500m :  stn 2, casts 5 & 6


### The closest CTD record was obtained for each sample by the followig steps :
  - Load BCO-DMO CTD dataset, convert the "CTDPRS" of the CTD records into an "infered_depth" using the following formula  [see Fofonoff & Millard, 1983: UNESCO]
  - Retrieve CTD records with a matching "cruise_name", "station", and "cast" as the sample.
  - For the selected CTD records, finds the closest "inferred_depth" as the sample "depth". If no record is found in a given range (set as 5m), the sample is considered to have no closest CTD record.

The script is available in scripts/map_ctd_metagenomes.py

## sampling_events
A sampling event table was generated from the sample tables. A sampling-event is defined as a unique "cast" and "station" and "cruise_name". The "start_ISO_DateTime", "latitude", "longitude" and "cruise_ID" were retrieved from BCO-DMO.
A "sampling_event_type" was added.

## campaign
A campaign table was generated from the unique "cruise_ID" from the sample table. The cruise was searched in the Rolling Deck repository, in order to obtain the "R2R_cruise_DOI", "start_date", "end_date", "start_location", "end_location" and "CCHDO url".

Additional information about the cruise was searched in BCO-DMO in order to obtain "BCO-DMO summary" and "BCO-DMO deployment".

## CTD_profiles and Niskin_profiles
Complete CTD and Niskin records for a given sampling event were obtained by a simple query on the BCO-DMO HOT frictionless datapackage using the "cruise_name", "station", and "cast" of the sampling event.

Minor corrections to BCO-DMO records

-change timecode BE into start_date


