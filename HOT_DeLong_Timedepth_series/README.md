# HOT Delong Time and depth series

## samples_NCBI
Collects metadata associated to the NCBI Biosamples of the bioproject https://www.ncbi.nlm.nih.gov/bioproject/352737. Pooled sampled for co-assembly were removed. Additionaly, a sample did not have any SRA accession associated and was removed (https://www.ncbi.nlm.nih.gov/biosample/SAMN11874873/)

Minor corrections were done in order to help the use of the metadata :
- the attribute "altitude" was removed (empty attribute)
- the attributes "Chlorophyll, nitrogen, phaeopigments,phosphate,salinity, total particulate carbon, dissolved organic carbon, dissolved inorganic carbon, alkalinity and salinity" were removed because they were submitted without corresponding units.
- the attribute "lat/long" was split into two fields (lat and long)
- The attributes filter_um and prefilter_um where corrected using information from personal communication with the authors
- The attributes "Date-Time, cruise_name, station_nb, cast_nb, bottleID, filter_max, filter_min and filter_type" was obtained through personal communication with the authors.
- the Biome, features and material were corrected as follow (any change are due to deprecated ENVO terms), and purl where added:
		"ENVO:00000447" -> marine biome (ENVO:00000447)

		"ENVO:00002151" -> sea water (ENVO:00002149)


NOTE: Sample SAMMN11874827 not included in the Ocean atlas data. Without information for the cast nb, station nb and bottleID or any time-date allowing to infer the cast nb, mapping the clostest CTD and niskin record was not performed.


## samples_CTD_BCO-DMO
Collects metadata from the closest CTD record for each samples. These CTD records were obtained from BCO-DMO HOT frictionless datapackage. 

Minor corrections were performed on the BCO-DMO dataset:
- The "Date-Time" attribute was changed into "start Date-Time" and the "Timecode" attribute was removed.

### The closest CTD record was obtained for each sample by the followig steps :
  - Load BCO-DMO CTD dataset, convert the "CTDPRS" of the CTD records into an "infered_depth" using the following formula  [see Fofonoff & Millard, 1983: UNESCO]
  - Retrieve CTD records with a matching "cruise_name", "station", and "cast" as the sample.
  - For the selected CTD records, finds the closest "inferred_depth" as the sample "depth". If no record is found in a given range (set as 5m), the sample is considered to have no closest CTD record.

The script is available in scripts/map_ctd_metagenomes.py

### The Niskin record was retrieved for each samples using the following steps :
- convert bottleID from the sample_NCBI dataset into the rosette number (two last digits of the number)
- load BCO-DMO Niskin dataset
- Retrieve Niskin record with matching cruise, cast, station and rosette number.

## Samples_paper
Collects information from the supplemental material of the published paper: https://doi.org/10.1038/s41564-017-0008-3

## sampling_event
This table was generated using the cast information from BCO-DMO. Briefly, unique sampling event where derived from the cruise ID, the cast and station number and the ISO-DateTime.
Sampling event ID were generated as follow: "expeditionName_cruiseID_stationCast"
No sampling event could be inferred for the sample SAMMN11874827




