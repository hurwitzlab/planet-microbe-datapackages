Notes GOS Life


--> more EBI biosamples than NCBI : due to two analysis done per samples with two different pipelines version. But in fact same nb of samples than NCBI
--> This dataset is not in CAMERA

NCBI datasets
-corrections made : divide "Title" int "station_name" and "lower_filter_size"
-need to add "upper_filter_size" according to the protocol in JCV website
-conversion of "collection_date" into "collection_dateTime" and in ISO format
-conversion of "lat long" filed into "lat" and "long"
-addition of a "sampling_event_id"

Sampling_event table
-derived from information from NCBI_biosamples. Unique dateTime and location points are considered as a unique sampling events.


NOTE: remember to add the below detection strings in the appropriate category in the data package !!