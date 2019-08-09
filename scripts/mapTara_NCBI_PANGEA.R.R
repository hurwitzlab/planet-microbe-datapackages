library(ggplot2)
library(dplyr)
library(tidyverse)
library(lubridate)

######Load dataset NCBI
Tara_dir="/Users/aponsero/Documents/UA_POSTDOC/projects/Planet_Microbe/Planet_Microbe_data/in_progress/Tara_Oceans_Polar"
dir=paste(Tara_dir,"/BNA", sep="")
file=paste(dir,"/sample_NCBI.tsv", sep = "")
WGS_data <- readr::read_tsv(file)
WGS_ID <- WGS_data %>% select(SampleID_Tara)
WGS_event <- WGS_data %>% select("Event Label") %>% distinct()
WGS_campaign <- WGS_data %>% select("Sampling Campaign") %>% rename("Campaign"="Sampling Campaign")%>% distinct()

######################################################################################
######################################################################################
#Load campaign registry
file=paste(Tara_dir,"/TARA_campaign_registries.txt", sep = "")
camp_data <- readr::read_tsv(file)

#######select only relevent data
my_camp_data <- inner_join(WGS_campaign,camp_data, by="Campaign")
my_camp_data <- my_camp_data %>% select("Campaign", "Date/Time", "Date/Time 2", "Locality (from port)", 
                                        "Locality (to port)", "URL file","URL PANGAEA", "URL ENA") %>%
                rename("campaign_name"="Campaign",
                       "start_date"="Date/Time",
                       "end_date"="Date/Time 2",
                       "start_location"="Locality (from port)",
                       "end_location"="Locality (to port)")

nb<-my_camp_data %>% nrow(.)
Tara_O<-tbl_df(rep("Tara Oceans", nb)) %>% rename('campaign_expedition'='value')
Tara_url<- tbl_df(rep("https://oceans.taraexpeditions.org/en/", nb)) %>% rename('expedition_url'='value')
campaign_table <- bind_cols( Tara_O, Tara_url,my_camp_data)

my_camp_file=paste(dir,"/campaign.tsv", sep="")
write.table(campaign_table, file=my_camp_file, quote=FALSE, sep='\t', row.names = F)





######################################################################################
######################################################################################
#Load Ardyna water context
file1=paste(Tara_dir,"/PANGEA_sampling_events/Ardyna_TARA_SAMPLES_CONTEXT_ENV-WATERCOLUMN.txt", sep = "")
water1_data <- readr::read_tsv(file1)

water1_data <- water1_data %>% rename("Event Label"="Event")
#######select only relevent samples
my_water1_data <- inner_join(WGS_event,water1_data, by="Event Label")
my_water1_file=paste(dir,"/Ardyna_TARA_water_context_PANGEA.tsv", sep="")
write.table(my_water1_data, file=my_water1_file, quote=FALSE, sep='\t', row.names = F)

#Load water column context
file=paste(Tara_dir,"/PANGEA_sampling_events/TARA_SAMPLES_CONTEXT_ENV-WATERCOLUMN.txt", sep = "")
water_data <- readr::read_tsv(file)

water_data <- water_data %>% rename("Event Label"="Event")
#######select only relevent samples
my_water_data <- inner_join(WGS_event,water_data, by="Event Label")
my_water_file=paste(dir,"/TARA_water_context_PANGEA.tsv", sep="")
write.table(my_water_data, file=my_water_file, quote=FALSE, sep='\t', row.names = F)

######################################################################################
######################################################################################
#Load Niskin profiles
nis_dir=paste(Tara_dir,"/PANGEA_Niskin/tsv_files/", sep="")
files_list <- list.files(path=nis_dir)

cpt<-1
for (i in files_list) {
  name=paste(nis_dir,i, sep="")
  temp_nis_data <- readr::read_tsv(name)
  if (cpt==1) {
    nis_all <- temp_nis_data
    cpt<-2
  }else{
    nis_all <- bind_rows(nis_all, temp_nis_data)
  }
}

nis_data <- nis_all %>% rename('Event Label'='Event')

#######select only relevent samples
my_nis_data <- inner_join(WGS_event,nis_data, by="Event Label")
my_nis_file=paste(dir,"/Niskin_profiles_PANGEA.tsv", sep="")
write.table(my_nis_data, file=my_nis_file, quote=FALSE, sep='\t', row.names = F)

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



