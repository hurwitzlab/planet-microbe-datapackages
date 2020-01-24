# Tara Oceans datapackage

# NCBI metadata
## sample_NCBI
Collects metadata associated to the Tara Oceans expedition in NCBI : https://www.ncbi.nlm.nih.gov/bioproject/173486

shotgun_sequencing projects
- PRJEB4352 AHX Shotgun Sequencing of Tara Oceans DNA samples corresponding to size fractions for protist (GSC)
https://www.ncbi.nlm.nih.gov/bioproject/213098
- PRJEB1788 ANB Shotgun Sequencing of Tara Oceans DNA samples corresponding to size fractions for large DNA viruses (GSC)
https://www.ncbi.nlm.nih.gov/bioproject/196958
- PRJEB4419 APX Shotgun Sequencing of Tara Oceans DNA samples corresponding to size fractions for small DNA viruses. (GSC)
https://www.ncbi.nlm.nih.gov/bioproject/214077
- PRJEB1787 APY Shotgun Sequencing of Tara Oceans DNA samples corresponding to size fractions for prokaryotes. (GSC)
https://www.ncbi.nlm.nih.gov/bioproject/196960

metatranscriptomes
- PRJEB6605 ARC Metatranscriptome sequencing from samples corresponding to size fractions for protists. (GSC)
https://www.ncbi.nlm.nih.gov/bioproject/253559
- PRJEB6609 ARD_2 Metatranscriptome sequencing from samples corresponding to size fractions for protists. (GSC)
https://www.ncbi.nlm.nih.gov/bioproject/253564
- PRJEB6608 BEZ Metatranscriptome sequencing of Tara Oceans DNA samples corresponding to size fractions for prokaryotes. (GSC)
https://www.ncbi.nlm.nih.gov/bioproject/253563

amplicon sequencing
- PRJEB6610 ARG Amplicon sequencing of Tara Oceans DNA samples corresponding to size fractions for protists. (GSC)
https://www.ncbi.nlm.nih.gov/bioproject/253565
- PRJEB7315 ARH Amplicon sequencing of Tara Oceans RNA samples corresponding to size fractions for protists. (GSC)
https://www.ncbi.nlm.nih.gov/bioproject/261507
- PRJEB4357 ARI Amplicon sequencing of Tara Oceans DNA samples corresponding to size fractions for prokaryotes or protist. (GSC)
https://www.ncbi.nlm.nih.gov/bioproject/213100
- PRJEB6606 AUZ Amplicon sequencing of Tara Oceans DNA samples corresponding to size fractions for large DNA viruses. (GSC)
https://www.ncbi.nlm.nih.gov/bioproject/253560


### minor corrections in all packages
- remove the attributes "citation", "further details", "SRA", "sample status"
- units not available in NCBI, the units were retrieved from EBI
- NCBI description text contained mis-encoded characters corrected to "μ"
- 99999 values were replaced by "nd"
- purl_biome, purl_feature and purl_material were infered from the biome, feature and material provided by the PI.
- The "surface water (ENVO:00002042) layer" feature annotation was corrected as "sea surface layer"
- The "marine epipelagic mixed layer (ENVO:xxxxxxxxx)" feature annotation was corrected as "marine wind mixed layer"
- The "water layer with no specific feature" feature annotation was removed
- The "filtered seawater (ENVO:xxxxxxxxx)" material annotation was corrected to "seawater"

### minor corrections in some packages
- AHX : samples without sampling time/date nor lat/long were removed
- APX : remove "size fraction lower threshold"
- ARG : remove "size fraction upper threshold" if there is none ('>')
- APY/ARG : packages with samples with range of depth (pooled samples) were divided into a min_Depth and max_Depth attributes
- replaced latitude/longitude-end values of 99999 with latitude/longitude-start values for the following samples:
SAMEA2730749
SAMEA2620355
SAMEA2620354
SAMEA2657093
SAMEA2657107
SAMEA2619371
SAMEA2620360
SAMEA2620339
SAMEA2730747
SAMEA2622646
SAMEA2622641
SAMEA2622637
SAMEA2622632
SAMEA2622628
SAMEA2622624
SAMEA2622619
SAMEA2622614  
- AHX, ARD_2, ARG : for the Sample SAMEA2657086, the longitude-end was corrected from -95.9893 to -59.9893
- APY : The range-depth sample TARA_B100002029 (NCBI: SAMEA2623919, event_ID:TARA_20120319T1848Z_152_EVENT_CAST) was removed
- ARG : The range-depth samples TARA_A100000810 (NCBI:SAMEA2731305,	event_ID:TARA_20091111T1827Z_019_EVENT_NET) and TARA_A100000693	(NCBI:SAMEA2731098, event_ID:TARA_20091115T1031Z_021_EVENT_NET) were removed

### issues left to solve all packages
- sensors reporting 99999 when below/not detected

### issues to solve in some packages
- ARD_2 : some samples with a depth at 99999 (detection issue)

### bioprojects not included
PRJEB4422	ALP	Shotgun Sequencing of Single Cell Whole Genome Amplification from Tara Oceans samples corresponding to size fractions for protist (GSC)

PRJEB6604 APE Whole genome Sequencing from protist culture. (GSC)

PRJEB6607 AZA Metatranscriptome sequencing of Tara Oceans DNA samples corresponding to size fractions for prokaryotes. (GSC)

# Pangea metadata
Pangea registry of all campaigns : https://doi.pangaea.de/10.1594/PANGAEA.842191
Pangea registry of all events : https://doi.pangaea.de/10.1594/PANGAEA.842227
Pangea registry of all samples : https://doi.pangaea.de/10.1594/PANGAEA.875582


### Pangea sample metadata
Collects metadata about samples associated to the Tara Oceans expedition in Pangea : 
https://doi.pangaea.de/10.1594/PANGAEA.875582

- carbonate chemistry : https://doi.org/10.1594/PANGAEA.875567
- nutrients : https://doi.org/10.1594/PANGAEA.875575
- pigments HPLC : https://doi.org/10.1594/PANGAEA.875569
	
#### Minor corrections
In Nutrient dataset :
- AHX, ARD_2, ARG: removed ">0.8" and ">3" for "Size fraction, upper threshold"
- APX : "Size fraction, lower threshold" attribute was removed
- units were not provided in the https://doi.org/10.1594/PANGAEA.875575. We derived the units from the parent dataset https://doi.pangaea.de/10.1594/PANGAEA.836319
- the attributes "Depth, top/min" and "Depth, bottom/max" were removed from the datapackage because describing the sampling event, not the samples

In HPLC dataset :
- AHX, ARD_2, ARG: removed ">0.8" and ">3" for "Size fraction, upper threshold"
- APX : "Size fraction, lower threshold" attribute was removed
- units were not provided in the https://doi.org/10.1594/PANGAEA.875569. We derived the units from the parent dataset https://doi.pangaea.de/10.1594/PANGAEA.836319
- the attributes "Depth, top/min" and "Depth, bottom/max" were removed from the datapackage because describing the sampling event, not the samples

In carbonate dataset :
- AHX, ARD_2, ARG: removed ">" for "Size fraction, upper threshold"
- APX : "Size fraction, lower threshold" attribute was removed
- ARI : removed pH, Carbon dioxide, Carbon dioxide, partial pressure, Fugacity of carbon dioxide in seawater attributes (empty for this dataset)
- units were not provided in the https://doi.org/10.1594/PANGAEA.875567. We derived the units from the parent dataset https://doi.pangaea.de/10.1594/PANGAEA.836319
- the attributes "Depth, top/min" and "Depth, bottom/max" were removed from the datapackage because describing the sampling event, not the samples

## Sampling_event
Collects metadata about the sampling events during which samples were obtained. Original data was retrieved from the Pangea event registry : https://doi.pangaea.de/10.1594/PANGAEA.842227

The original Pangea dataset was parsed and attributes selected for relevant information using a custom R script available in scripts/mapTara_NCBI_PANGEA.R

### Minor corrections : 
- Event type attributes were derived from the Tara event label
- ARD_2, ARG : the events types named "control" were renamed to "filtrations" to be more informative.

## Niskin profiles
Collects metadata about the column of water during sampling events. Original data was retrieved from the Pangea Niskin profile dataset :
https://doi.pangaea.de/10.1594/PANGAEA.836319

200 Niskin profiles were downloaded from Pangea (see Niskin_profiles.txt for complete doi list). Each profile was cleaned using the command :

	sed -n -E -e '/\*\//,$ p' $FILE | sed '1 d' > $FILE.tsv

The cleaned profiles were imported and merged as one unique table, and the relevant Nisking profiles were retrieved and included in each datapackages. Script used to import, merge and select the relevant profiles is available in scripts/mapTara_NCBI_PANGEA.R

## sampling_event water context
Water column context for the sampling events were obtained from Pangea : https://doi.pangaea.de/10.1594/PANGAEA.875579

In PANGEA the water column context is linked to the sample registry. Information about the sample was removed from the dataset, dereplicated and matched to the sampling_events registry. When different records matching the same sampling_event ID, the records containing the most metadata was kept.

## sampling_event Ardyna water context
Water column context for the sampling events were obtained from Pangea : https://doi.pangaea.de/10.1594/PANGAEA.875577

In PANGEA the water column context is linked to the sample registry. Information about the sample was removed from the dataset, dereplicated and matched to the sampling_events registry.

## Campaigns
Campaigns informatations were retrieved from the Pangea registry of all campaigns : https://doi.pangaea.de/10.1594/PANGAEA.842191

Relevant information were selected and renamed using the script available in scripts/mapTara_NCBI_PANGEA.R

