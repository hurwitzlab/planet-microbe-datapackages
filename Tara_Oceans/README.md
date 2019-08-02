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

### minor corrections in some packages
	- APX : remove "size fraction lower threshold"
	- ARG : remove "size fraction upper threshold" if there is none ('>')

### issues left to solve all packages
	- sensors reporting 99999 when below/not detected

### issues to solve in some packages
	- AHX : samples without time/date (DCM samples) nor lat/long
	- APY/ARG : samples with range of depth (pooled samples)
	- ARD_2 : some samples with a depth at 99999 (detection issue)

## bioprojects not included
PRJEB4422	ALP	Shotgun Sequencing of Single Cell Whole Genome Amplification from Tara Oceans samples corresponding to size fractions for protist (GSC)
PRJEB6604 APE Whole genome Sequencing from protist culture. (GSC)
PRJEB6607 AZA Metatranscriptome sequencing of Tara Oceans DNA samples corresponding to size fractions for prokaryotes. (GSC)
