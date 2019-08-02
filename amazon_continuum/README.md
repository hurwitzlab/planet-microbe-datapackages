# Amazon continuum datapackage

#############################################DATAPACKAGE IN PROGRESS#####################################################################

## sample_NCBI
Collects metadata associated to the amazon continuum metagenome in NCBI : https://www.ncbi.nlm.nih.gov/bioproject/237344

#### Minor corrections were done in order to help the use of the metadata :
  - biome attribute merged with env_biome
  - collection_date normalized to a unique format (dd-mm-yyyy)
  - feature attribute merged with env_feature
  - material attribute merged with env_material
  - isolation_source attribute merged with env_material

#### Additional corrections needed :
  - PAR : has two units ("¬µEm-2sec-1"and "_Em-2sec-1")
  - collection_time has no time zone information and some of them don't correspond to standard time format
  - density has two units ("g/ml" and "kgm-2")
  - diss-inorg-carb has three units ("umolC.kg", "µmol/kg", "_mol/kg")
  - diss_oxy has two units ("¬µmol/kg", "_mol/kg")
  - lat_long field needs to be standardized
  - max_filter has three units ("¬µm","um" and "_m") 
  - min_filter has three units ("¬µm","um" and "_m") 
  - samp_volume : some samples don't have any unit reported
  - surf_irradiance has two units ("¬µEM-2sec-1" and "_EM-2sec-1")
  - Turbidity has some -999 (below detection limit ?)

## others datasets left to add
#### BCO-DMO (CTD and NISKIN) : http://www.bco-dmo.org/project/2097

#### Cruise1 : june 2010 R/V Knorr (ANIO/KN197-08)
	-Metadata in paper Satinsky et al. 2014 Micro Announc.
	-Metagenomes: SRP039390
	-MetaTranscriptome non selectif : SRP037995
	-metatranscriptome polyA : SRP039544

#### cruise2 : May 2011
	-Metadata in paper Satinsky et al. 2015 Micro Announc.
	-metagenomes : SRP039390
	-metatranscriptomes : SRP037995

#### cruise3 : Sept/oct 2011 R/V Melville (ANII/MV1110)

#### cruise 4 : July 2012 R/V Atlantis

#### other papers :
	- Hilton et al 2014 ISME journal
	- Doherty et al 2017 
