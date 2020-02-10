library(dplyr)
library(tidyverse)
library(stringr)
library(lubridate)
library(tidyr)

NCBI_file<-'/Users/aponsero/Documents/UA_POSTDOC/projects/Planet_Microbe/Planet_Microbe_data/in_progress/BATS_Chisholm/NCBI_sample_corr.txt'
Niskin_file<-'/Users/aponsero/Documents/UA_POSTDOC/projects/Planet_Microbe/Planet_Microbe_data/in_progress/BATS_Chisholm/niskin.csv'
NCBI_data <- readr::read_tsv(NCBI_file)%>% select(bottle_id, BioSample)
type<-paste(replicate(68, "c"), collapse = "")
Niskin_data <- readr::read_csv(Niskin_file, col_types = type) %>% rename(bottle_id=Id)

Niskin_data$bottle_id<-as.numeric(Niskin_data$bottle_id)

## sample_niskin
select_Niskin<-left_join(NCBI_data, Niskin_data, by="bottle_id")

out_file<-'/Users/aponsero/Documents/UA_POSTDOC/projects/Planet_Microbe/Planet_Microbe_data/in_progress/BATS_Chisholm/niskin_sample.csv'
write.csv(select_Niskin, out_file, row.names=FALSE)

## profile Niskin
sample_Niskin<-'/Users/aponsero/Documents/UA_POSTDOC/projects/Planet_Microbe/Planet_Microbe_data/planet-microbe-datapackages/BATS_Chisholm/samples_niskin_BCO-DMO.tsv'
type<-paste(replicate(39, "c"), collapse = "")
Niskin_sample_data <- readr::read_tsv(sample_Niskin, col_types = type)
Niskin_sample_data$cruise_number %<>% as.integer
Niskin_sample_data$cast_number %<>% as.integer

Niskin_file<-'/Users/aponsero/Documents/UA_POSTDOC/projects/Planet_Microbe/Planet_Microbe_data/in_progress/BATS_Chisholm/niskin.csv'
type<-paste(replicate(65, "c"), collapse = "")
Niskin_data <- readr::read_csv(Niskin_file, col_types = type)
Niskin_data$cruise_number %<>% as.integer
Niskin_data$cast_number %<>% as.integer

join_element<-Niskin_sample_data%>% select(sampling_event_ID, cruise_number, cast_number) %>% unique()

profiles_niskin<-left_join(join_element, Niskin_data, 
                           by=c("cruise_number","cast_number"))
no_na_profile_niskin<-profiles_niskin %>% select_if(~sum(!is.na(.)) > 0)

out_file<-'/Users/aponsero/Documents/UA_POSTDOC/projects/Planet_Microbe/Planet_Microbe_data/in_progress/BATS_Chisholm/niskin_profile.tsv'
write.table(no_na_profile_niskin, file=out_file, quote=FALSE, sep='\t', col.names = NA)

