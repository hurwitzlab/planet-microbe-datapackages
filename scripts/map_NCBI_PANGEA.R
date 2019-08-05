library(ggplot2)
library(dplyr)
library(tidyverse)
library(lubridate)

######Load dataset NCBI
Tara_dir="/Users/aponsero/Documents/UA_POSTDOC/projects/Planet_Microbe/Planet_Microbe_data/in_progress/Tara_Oceans"
dir=paste(Tara_dir,"/BNA", sep="")
file=paste(dir,"/sample_NCBI.tsv", sep = "")
WGS_data <- readr::read_tsv(file)
WGS_ID <- WGS_data %>% select(SampleID_Tara)

######################################################################################
######################################################################################

#Load dataset Pangea Biodiversity
file4=paste(Tara_dir,"/PANGEA/TARA_sample_biodiv.tsv", sep = "")
bio_data <- readr::read_tsv(file4)

#######select only relevent samples
my_bio_data <- left_join(WGS_ID,bio_data, by="SampleID_Tara")
my_bio_file=paste(dir,"/TARA_samples_biodiversity_PANGEA.tsv", sep="")
write.table(my_bio_data, file=my_bio_file, quote=FALSE, sep='\t', col.names = NA)







######################################################################################
######################################################################################

#Load dataset Pangea Carbonate
file3=paste(Tara_dir,"/PANGEA/TARA_samples_carbonate_PANGEA.tsv", sep = "")
carb_data <- readr::read_tsv(file3)

#######select only relevent samples
my_carb_data <- left_join(WGS_ID,carb_data, by="SampleID_Tara")
my_carb_file=paste(dir,"/TARA_samples_carbonate_PANGEA.tsv", sep="")
write.table(my_carb_data, file=my_carb_file, quote=FALSE, sep='\t', col.names = NA)

######################################################################################
######################################################################################

#Load dataset Pangea HPLC
file2=paste(Tara_dir,"/PANGEA/TARA_samples_HPLC_PANGEA.tsv", sep = "")
hplc_data <- readr::read_tsv(file2)

#######select only relevent samples
my_hplc_data <- left_join(WGS_ID,hplc_data, by="SampleID_Tara")
my_hplc_file=paste(dir,"/TARA_samples_HPLC_PANGEA.tsv", sep="")
write.table(my_hplc_data, file=my_hplc_file, quote=FALSE, sep='\t', col.names = NA)

######################################################################################
######################################################################################

#Load dataset Pangea Nutrient
file2=paste(Tara_dir,"/PANGEA/TARA_samples_nutrients_PANGEA.tsv", sep = "")
nut_data <- readr::read_tsv(file2)

#######select only relevent samples
my_nut_data <- left_join(WGS_ID,nut_data, by="SampleID_Tara")
my_nut_file=paste(dir,"/TARA_samples_nutrients_PANGEA.tsv", sep="")
write.table(my_nut_data, file=my_nut_file, quote=FALSE, sep='\t', col.names = NA)

######################################################################################
######################################################################################



