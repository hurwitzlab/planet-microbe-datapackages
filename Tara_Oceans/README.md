# Tara Oceans datapackage

############DATAPACKAGE IN PROGRESS DO NOT USE#################

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

### minor corrections in some packages
- AHX : samples without sampling time/date nor lat/long were removed
- APX : remove "size fraction lower threshold"
- ARG : remove "size fraction upper threshold" if there is none ('>')

### issues left to solve all packages
- sensors reporting 99999 when below/not detected

### issues to solve in some packages
- APY/ARG : samples with range of depth (pooled samples)
- ARD_2 : some samples with a depth at 99999 (detection issue)

### bioprojects not included
PRJEB4422	ALP	Shotgun Sequencing of Single Cell Whole Genome Amplification from Tara Oceans samples corresponding to size fractions for protist (GSC)
PRJEB6604 APE Whole genome Sequencing from protist culture. (GSC)
PRJEB6607 AZA Metatranscriptome sequencing of Tara Oceans DNA samples corresponding to size fractions for prokaryotes. (GSC)

## Pangea metadata
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
- units were not provided in the https://doi.org/10.1594/PANGAEA.875575. We derived the units from the parent dataset https://doi.pangaea.de/10.1594/PANGAEA.839331

In HPLC dataset :
- AHX, ARD_2, ARG: removed ">0.8" and ">3" for "Size fraction, upper threshold"
- APX : "Size fraction, lower threshold" attribute was removed
- units were not provided in the https://doi.org/10.1594/PANGAEA.875569. We derived the units from the parent dataset https://doi.pangaea.de/10.1594/PANGAEA.839331

In carbonate dataset :
- AHX, ARD_2, ARG: removed ">" for "Size fraction, upper threshold"
- APX : "Size fraction, lower threshold" attribute was removed
- ARI : removed pH, Carbon dioxide, Carbon dioxide, partial pressure, Fugacity of carbon dioxide in seawater attributes (empty for this dataset)
- units were not provided in the https://doi.org/10.1594/PANGAEA.875567. We derived the units from the parent dataset https://doi.pangaea.de/10.1594/PANGAEA.839331

## Sampling_event
Collects metadata about the sampling events during which samples were obtained. Original data was retrieved from the Pangea event registry : https://doi.pangaea.de/10.1594/PANGAEA.842227

The original Pangea dataset was parsed and attributes selected for relevant information using a custom R script available in scripts/map_NCBI_PANGEA.R

### Minor corrections : 
	-ARD_2, ARG : the events types named "control" were renamed to "filtrations" to be more informative.
