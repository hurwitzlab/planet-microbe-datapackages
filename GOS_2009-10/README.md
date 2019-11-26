# GOS Beyster Family Fund and Life Technologies Foundation - expedition 2009-2011 datapackage

## sample_NCBI
Collects metadata associated to the GOS expedition 2009-2011 in NCBI : https://www.ncbi.nlm.nih.gov/bioproject/293636
Note that the difference in numbers in the same project in EBI MGNIFY is due to the fact that two analysis pipelines were run per samples. In reality, there is the same number of samples in NCBI and EBI for this project.

#### Minor corrections were done in order to help the use of the metadata :
  - corrections made : divide "Title" int "station_name" and "lower_filter_size"
  - addition of a "upper_filter_size" according to the protocol reported in JCV website
  - conversion of "collection_date" into "collection_dateTime" and in ISO format
  - conversion of "lat long" filed into "lat" and "long"
  - Biome, feature and material purls where added using the label provided in env_biome, env_feature
  - env_material and its associated purls where added


## sampling_events
The sampling_event information is derived from information from NCBI_biosamples. Unique dateTime and location points are considered as a unique sampling events.



NOTE: remember to add the below detection strings in the appropriate category in the data package !!