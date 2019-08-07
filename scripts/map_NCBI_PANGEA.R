library(ggplot2)
library(dplyr)
library(tidyverse)
library(lubridate)

######Load dataset NCBI
Tara_dir="/Users/aponsero/Documents/UA_POSTDOC/projects/Planet_Microbe/Planet_Microbe_data/in_progress/Tara_Oceans"
dir=paste(Tara_dir,"/AHX", sep="")
file=paste(dir,"/sample_NCBI.tsv", sep = "")
WGS_data <- readr::read_tsv(file)
WGS_ID <- WGS_data %>% select(SampleID_Tara)
WGS_event <- WGS_data %>% select("Event Label")

######################################################################################
######################################################################################

#Load dataset Pangea sampling_events
file5=paste(Tara_dir,"/PANGEA_sampling_events/TARA_reg_events.tsv", sep = "")
event_data <- readr::read_tsv(file5)

#######select only relevent samples
my_event_data <- left_join(WGS_event,event_data, by="Event Label")
my_event_file=paste(dir,"/TARA_sampling_event_PANGEA.tsv", sep="")
write.table(my_event_data, file=my_event_file, quote=FALSE, sep='\t', row.names = F)

###select relevant features for table
sampling_event <- my_event_data %>% select('Event Label','Date/Time','Date/Time 2','Latitude',
                                           'Latitude 2','Longitude','Longitude 2','Campaign',
                                           'Station') %>%
                                    rename('Sample_event_ID'='Event Label', 'start_ISO_dateTime'='Date/Time',
                                           'stop_ISO_dateTime'='Date/Time 2', 'start_lat'='Latitude',
                                           'stop_lat'='Latitude 2','start_lon'='Longitude',
                                           'stop_lon'='Longitude 2','Cruise_ID'='Campaign',
                                           'Station_name'='Station')


sampling_event <- sampling_event %>% 
                  mutate('sampling_event_type'=tolower(gsub(".*EVENT_|.*EVENTS_","",Sample_event_ID)))

nb<-sampling_event %>% nrow(.)
Tara_O<-tbl_df(rep("Tara Oceans", nb)) %>% rename('cruise_expedition'='value')
sampling_event <- bind_cols(sampling_event, Tara_O)
sampling_event_file <- paste(dir,"/sampling_event.tsv", sep="")
write.table(sampling_event, file=sampling_event_file, quote=FALSE, sep='\t', row.names = F)







######################################################################################
######################################################################################

#Load dataset Pangea Biodiversity
file4=paste(Tara_dir,"/PANGEA_samples/TARA_sample_biodiv.tsv", sep = "")
bio_data <- readr::read_tsv(file4)

#######select only relevent samples
my_bio_data <- left_join(WGS_ID,bio_data, by="SampleID_Tara")
my_bio_file=paste(dir,"/TARA_samples_biodiversity_PANGEA.tsv", sep="")
write.table(my_bio_data, file=my_bio_file, quote=FALSE, sep='\t', row.names = F)

######################################################################################
######################################################################################

#Load dataset Pangea Carbonate
file3=paste(Tara_dir,"/PANGEA_samples/TARA_samples_carbonate_PANGEA.tsv", sep = "")
carb_data <- readr::read_tsv(file3)

#######select only relevent samples
my_carb_data <- left_join(WGS_ID,carb_data, by="SampleID_Tara")
my_carb_file=paste(dir,"/TARA_samples_carbonate_PANGEA.tsv", sep="")
write.table(my_carb_data, file=my_carb_file, quote=FALSE, sep='\t', row.names = F)

######################################################################################
######################################################################################

#Load dataset Pangea HPLC
file2=paste(Tara_dir,"/PANGEA_samples/TARA_samples_HPLC_PANGEA.tsv", sep = "")
hplc_data <- readr::read_tsv(file2)

#######select only relevent samples
my_hplc_data <- left_join(WGS_ID,hplc_data, by="SampleID_Tara")
my_hplc_file=paste(dir,"/TARA_samples_HPLC_PANGEA.tsv", sep="")
write.table(my_hplc_data, file=my_hplc_file, quote=FALSE, sep='\t', row.names = F)

######################################################################################
######################################################################################

#Load dataset Pangea Nutrient
file2=paste(Tara_dir,"/PANGEA_samples/TARA_samples_nutrients_PANGEA.tsv", sep = "")
nut_data <- readr::read_tsv(file2)

#######select only relevent samples
my_nut_data <- left_join(WGS_ID,nut_data, by="SampleID_Tara")
my_nut_file=paste(dir,"/TARA_samples_nutrients_PANGEA.tsv", sep="")
write.table(my_nut_data, file=my_nut_file, quote=FALSE, sep='\t', row.names = F)

######################################################################################
######################################################################################



