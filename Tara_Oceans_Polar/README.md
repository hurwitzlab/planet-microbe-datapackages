# Tara Oceans Polar datapackage

# NCBI metadata 

## sample_NCBI
Collects metadata associated to the Tara Oceans Polar metagenome in NCBI : https://www.ncbi.nlm.nih.gov/bioproject/173486

Shotgun sequencing projects
- PRJEB9742 BNA. Shotgun Sequencing of Tara Oceans Polar Circle DNA samples corresponding to size fractions for small DNA viruses.  Shotgun Sequencing of Tara Oceans Polar Circle DNA samples corresponding to size fractions for small DNA viruses. (GSC)
https://www.ncbi.nlm.nih.gov/bioproject/288560

### bioprojects not included (data not public)
- PRJEB9691 BHN - Shotgun Sequencing of Tara Oceans Polar Circle DNA samples corresponding to size fractions for protists.  Shotgun Sequencing of Tara Oceans Polar Circle DNA samples corresponding to size fractions for protists. (GSC)
- PRJEB9737 BHQ. Amplicon sequencing of Tara Oceans Polar Circle DNA samples corresponding to size fractions for protists.  Amplicon sequencing of Tara Oceans Polar Circle DNA samples corresponding to size fractions for protists. (GSC)
- PRJEB9740 BMI. Shotgun Sequencing of Tara Oceans Polar Circle DNA samples corresponding to size fractions for prokaryotes.  Shotgun Sequencing of Tara Oceans Polar Cicle DNA samples corresponding to size fractions for prokaryotes. (GSC)
- PRJEB9738 BII. Metatranscriptome sequencing from Tara Oceans Polar Circle samples corresponding to size fractions for protists. Metatranscriptome sequencing from Tara Oceans Polar Circle samples corresponding to size fractions for protists. (GSC)
- PRJEB9739 BIK. Metatranscriptome sequencing from Tara Oceans Polar Circle samples corresponding to size fractions for protists. Metatranscriptome sequencing from Tara Oceans Polar Circle samples corresponding to size fractions for protists. (GSC)
- PRJEB9741 BMR. Metatranscriptome sequencing from Tara Oceans Polar Circle RNA samples corresponding to size fractions for prokaryotes.  Metatranscriptome sequencing from Tara Oceans Polar Circle RNA samples corresponding to size fractions for prokaryotes. (GSC)

#### minor corrections
- SRA removed
- Sample Status removed
- Size Fraction Lower Threshold removed (">")
- units not available in NCBI, the units were retrieved from EBI
- package with samples with range of depth (pooled samples) were divided into a min_Depth and max_Depth attributes
- The "surface water (ENVO:00002042) layer" feature annotation was corrected as "sea surface layer"
- The "marine epipelagic mixed layer (ENVO:xxxxxxxxx)" feature annotation was corrected as "marine wind mixed layer"
- The "water layer with no specific feature" feature annotation was removed
- The "filtered seawater (ENVO:xxxxxxxxx)" material annotation was corrected to "seawater"
- Range depth samples were removed (TARA_R110002094	SAMEA4397409 TARA_20130711T0613Z_175_Combined-EVENTS_CAST and TARA_R110002074	SAMEA4397215 TARA_20130702T0424Z_168_Combined-EVENTS_CAST)

#### issues to solves
- sensors reporting 99999 when below/not detected

# Pangea sample metadata
Collects metadata about samples associated to the Tara Oceans expedition in Pangea : 
https://doi.pangaea.de/10.1594/PANGAEA.875582

- carbonate chemistry : https://doi.org/10.1594/PANGAEA.875567
- nutrients : https://doi.org/10.1594/PANGAEA.875575
- pigments : https://doi.org/10.1594/PANGAEA.875569

Notes : the biodiversity context dataset https://doi.pangaea.de/10.1594/PANGAEA.853809 is not included (empty for this dataset)
	
#### Minor corrections
In Nutrient dataset :
- "Size fraction, lower threshold" attribute was removed
- units were not provided in the https://doi.org/10.1594/PANGAEA.875575. We derived the units from the parent dataset https://doi.pangaea.de/10.1594/PANGAEA.836319
- the attributes "Depth, top/min" and "Depth, bottom/max" were removed from the datapackage because describing the sampling event, not the samples

In HPLC dataset :
- "Size fraction, lower threshold" attribute was removed
- units were not provided in the https://doi.org/10.1594/PANGAEA.875569. We derived the units from the parent dataset https://doi.pangaea.de/10.1594/PANGAEA.836319
- the attributes "Depth, top/min" and "Depth, bottom/max" were removed from the datapackage because describing the sampling event, not the samples

In carbonate dataset :
- "Size fraction, lower threshold" attribute was removed
- Carbon dioxide, Carbon dioxide, partial pressure, Fugacity of carbon dioxide in seawater removed (empty in this dataset)
- units were not provided in the https://doi.org/10.1594/PANGAEA.875567. We derived the units from the parent dataset https://doi.pangaea.de/10.1594/PANGAEA.836319
- the attributes "Depth, top/min" and "Depth, bottom/max" were removed from the datapackage because describing the sampling event, not the samples

## Sampling_event
Collects metadata about the sampling events during which samples were obtained. Original data was retrieved from the Pangea event registry : https://doi.pangaea.de/10.1594/PANGAEA.842227

The original Pangea dataset was parsed and attributes selected for relevant information using a custom R script available in scripts/map_NCBI_PANGEA.R

### Minor corrections : 
- Event type attributes were derived from the Tara event label

## sampling_event water context
Water column context for the sampling events were obtained from Pangea : https://doi.pangaea.de/10.1594/PANGAEA.875579

In PANGEA the water column context is linked to the sample registry. Information about the sample was removed from the dataset, dereplicated and matched to the sampling_events registry. When different records matching the same sampling_event ID, the records containing the most metadata was kept.

## sampling_event Ardyna water context
Water column context for the sampling events were obtained from Pangea : https://doi.pangaea.de/10.1594/PANGAEA.875577

In PANGEA the water column context is linked to the sample registry. Information about the sample was removed from the dataset, dereplicated and matched to the sampling_events registry.

## Campaigns
Campaigns informatations were retrieved from the Pangea registry of all campaigns : https://doi.pangaea.de/10.1594/PANGAEA.842191

Relevant information were selected and renamed using the script available in scripts/mapTara_NCBI_PANGEA.R
