# C-DEBI mid-ocean ridge flank datapackage

## NCBI Data
This datapackage contains the seawater samples from the NCBI BioProjects: 
- PRJNA268250 https://www.ncbi.nlm.nih.gov/bioproject/268250
- PRJNA266365 https://www.ncbi.nlm.nih.gov/bioproject/266365
Samples for sediment, mixed samples and control of DNA extraction were not included.

### corrections to the datasets
- lat/long corrected into two fields
- Date format corrected to dd-mm-yyyy
- the biome 'seawater' was corrected to "marine abyssal zone biome"
- the feature 'seawater' was corrected to "oceanic zone"
- the material 'water' was corrected to "seawater"

## BCO-DMO sample dataset
The BCO-DMO dataset associated to C-DEBI project was downloaded from https://www.bco-dmo.org/program/554979/datapackage.json

The seawater samples were selected from the BCO-DMO project 635868

## paper sample dataset
The supplemental material from Jungbluth et al. 2016 (https://doi.org/10.1038/ismej.2015.248) was parsed for additional information about the samples.

## sampling events
Unique sampling event IDs were derived as follow: "CDEBIMR_"+Date+depth+location.
The sampling event type was retrieved from the supplemental material (sup. Table 1) from Jungbluth et al. 2016 (https://doi.org/10.1038/ismej.2015.248).

## campaign
A campaign table was generated from the unique "cruise_ID" from the sample table. The cruise was searched in the Rolling Deck repository, in order to obtain the "R2R_cruise_DOI", "start_date", "end_date", "start_location", "end_location" and "CCHDO url".