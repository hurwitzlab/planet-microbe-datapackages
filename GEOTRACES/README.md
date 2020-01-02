GEOTRACES datapackage

###### IN PROGRESS DO NOT IMPORT ######

# NCBI Data
- Marine metagenomes : https://www.ncbi.nlm.nih.gov/bioproject/385854    
- Artic metagenomes : https://www.ncbi.nlm.nih.gov/bioproject/324018 

## Issues to solve :
- Some Undefined lat/long and depth/time in the Artic dataset and no Bottle ID to map to the GEOTRACES database
- a sample has "Niskin" as sampling method but "sea ice" as material...

## corrections to the datasets
### Marine metagenomes:
- lat/long corrected into two fields
- purl biome/features/material added
### Artic metagenomes:
- removed sequencing method and platform
- merged "sampling site" and "sampling station"
- sample with missing depth inferred from description
- removed samples that contained assemblies submitted as samples
- merged "Title" and "description"
- merged "marine region" and "location"
- "melt pond" was changed from "material" to "feature" and the material field was corrected to "seawater"

