library(dplyr)
library(tidyverse)
library(stringr)
library(magrittr)

#+++++++++++++++++++++++++
# Import data
# and cleanup
#+++++++++++++++++++++++++

out_dir="/Users/aponsero/Documents/UA_POSTDOC/projects//Planet_Microbe/Planet_Microbe_data/in_progress/BATS_Chisholm"
ctd_file<-paste(out_dir, "ctd.csv", sep = "/", collapse = NULL)
ctd_datasets <- readr::read_csv(ctd_file)
ctd_datasets$cruise_number %<>% as.integer
ctd_datasets$cast_number %<>% as.integer

niskin_samples<-paste(out_dir, "niskin_sample.csv", sep = "/", collapse = NULL)
niskin_datasets <- readr::read_csv(niskin_samples) %>% select(BioSample, cruise_number, cast_number, Depth) %>% 
  rename("Depth_Niskin"="Depth")

## samples CTD
select_ctd_cast<- inner_join(ctd_datasets,niskin_datasets, by=c("cruise_number", "cast_number"))

ctd_samples<-select_ctd_cast %>% group_by(BioSample) %>% filter(abs(Depth - Depth_Niskin) == min(abs(Depth - Depth_Niskin)))

out_file<-'/Users/aponsero/Documents/UA_POSTDOC/projects/Planet_Microbe/Planet_Microbe_data/in_progress/BATS_Chisholm/CTD_samples.csv'
write.csv(ctd_samples, out_file, row.names=FALSE)

## profile CTD
ctd_sample="/Users/aponsero/Documents/UA_POSTDOC/projects//Planet_Microbe/Planet_Microbe_data/planet-microbe-datapackages/BATS_Chisholm/samples_CTD_BCO-DMO.txt"
type<-paste(replicate(25, "c"), collapse = "")
ctd_sample_data <- readr::read_tsv(ctd_sample, col_types = type)
ctd_sample_data$cruise_number %<>% as.integer
ctd_sample_data$cast_number %<>% as.integer
zone<-rep("Z", 62)
ctd_sample_data$zone<-zone
ctd_sample_data<-ctd_sample_data%>%unite(ISO_datetime_deployed, c(ISO_datetime_deployed,zone), sep="")
ctd_sample_data$zone<-zone
ctd_sample_data<-ctd_sample_data%>%unite(ISO_datetime_recovered, c(ISO_datetime_recovered,zone), sep="")



out_dir="/Users/aponsero/Documents/UA_POSTDOC/projects/Planet_Microbe/Planet_Microbe_data/in_progress/BATS_Chisholm"
type<-paste(replicate(28, "c"), collapse = "")
ctd_file<-paste(out_dir, "ctd.csv", sep = "/", collapse = NULL)
ctd_datasets <- readr::read_csv(ctd_file, col_types = type)
ctd_datasets$cruise_number %<>% as.integer
ctd_datasets$cast_number %<>% as.integer


join_element<-ctd_sample_data%>% select(sampling_event_ID, ISO_datetime_deployed, cruise_number, cast_number) %>% unique()
profiles_ctd<-left_join(join_element, ctd_datasets, by=c("ISO_datetime_deployed", "cruise_number","cast_number"))
no_na_profile_ctd<-profiles_ctd %>% select_if(~sum(!is.na(.)) > 0)

out_file<-'/Users/aponsero/Documents/UA_POSTDOC/projects/Planet_Microbe/Planet_Microbe_data/in_progress/BATS_Chisholm/CTD_profiles.tsv'
write.table(no_na_profile_ctd, file=out_file, quote=FALSE, sep='\t', col.names = NA)
