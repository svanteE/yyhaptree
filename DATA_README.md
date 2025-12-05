# Data Directory

This directory contains the data files used in the YYhapTree analysis.

## Files

### Included in Repository

These files are small enough to include in version control:
- `extract.R` - Utility functions for yyhap extraction
- `*.png` - Tree structure figures for subbranches (small file sizes)

### Not Included (Available Separately)

Due to size limitations, the following data files are **not included** in the GitHub repository but are available via external repositories:

#### Primary Data Files
- **`HapTable.RData`** - Haplogroup assignments for all 1,223 samples
  - List structure with haplogroups as names
  - Each element contains sample genotype matrix with population information
  - Size: ~XX MB
  
- **`m3.RData`** - Complete genotype matrix
  - 1,223 samples × SNPs binary matrix
  - Includes population origin (`ori`) column
  - Size: ~XX MB

- **`prof171.RData`** - Complete yyhap definitions
  - List of 171 yyhap profiles
  - Each contains: SNP lists, haplogroup names, sample assignments
  - Size: ~XX MB

- **`adM.RData`** - Adjacency matrix for phylogenetic relationships
  - Binary matrix showing yyhap nesting patterns
  - Used for tree construction
  - Size: ~XX MB

#### Source Data
- **1000 Genomes VCF files** - Original variant calls
  - Available from: ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/
  - Y-chromosome specific: `ALL.chrY.phase3_integrated_v2a.20130502.genotypes.vcf.gz`
  - Size: Several GB

## Data Availability

### Zenodo Archive
Complete processed datasets are archived on Zenodo:
- **DOI**: [To be added upon publication]
- **URL**: [To be added upon publication]

### Figshare
Alternative download location:
- **URL**: [To be added upon publication]

### 1000 Genomes Project
Original source data:
- **FTP**: ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/
- **Website**: https://www.internationalgenome.org/

## Data Format

### HapTable.RData Structure
```r
# Load the data
load("HapTable.RData")

# HapTable is a named list
names(HapTable)  # Returns haplogroup codes (e.g., "aaa1aa", "baaa4a")

# Each element is a data frame:
# - Columns: SNP positions (binary: 0/1)
# - Last two columns: HG (haplogroup name), ori (population)
head(HapTable[["baaa4a"]])
```

### prof171.RData Structure
```r
load("prof171.RData")

# profs is a list of 171 elements
length(profs)  # 171

# Each element contains:
# $HG - haplogroup names for samples
# $origin - population distribution
# $inHg - SNPs specific to this haplogroup
str(profs[[1]])
```

## Creating Data Files

To recreate the data files from 1000 Genomes raw data:

1. **Download VCF files** from 1000 Genomes
2. **Run preprocessing** (details in main analysis)
3. **Execute yyhap discovery** algorithm
4. **Generate derived files** (HapTable, prof171, etc.)

See `YYhapTree.Rmd` for complete processing pipeline.

## Data Usage

### Loading Data
```r
# Set working directory
setwd("path/to/project")

# Load all required data
load("data/HapTable.RData")
load("data/m3.RData")
load("data/prof171.RData")
load("data/adM.RData")

# Source utility functions
source("scripts/extract.R")
```

### Extracting Specific Haplogroups
```r
# Get all samples for haplogroup R1b
r1b_data <- HapTable[["baaa4a"]]

# Check sample size
nrow(r1b_data)

# Get population distribution
table(r1b_data$ori)
```

## Data License

The processed data files are derived from:
- **1000 Genomes Project** data (public domain)
- Processing and analysis © 2025 Aalborg University

The processed data may be used freely with appropriate citation.

## Data Provenance

1. **Source**: 1000 Genomes Project Phase 3 (2013)
2. **Processing**: Custom R pipeline (this repository)
3. **Version**: 1.0.0 (December 2025)
4. **Samples**: 1,223 male individuals
5. **Populations**: 26 global populations

## Contact

For questions about data access or format:
- Open a GitHub issue
- Contact: [email@institution.edu]

## Checksums

To verify data integrity (checksums to be added):
```bash
# MD5 checksums
md5sum HapTable.RData
md5sum m3.RData
md5sum prof171.RData
md5sum adM.RData
```
