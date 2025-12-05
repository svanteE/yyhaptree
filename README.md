# YYhapTree: Y-Chromosome Phylogenetic Analysis

A comprehensive Y-chromosome phylogenetic analysis using the yin-yang haplotype (yyhap) framework applied to 1000 Genomes Project data.

## Overview

This repository contains the complete analysis pipeline for identifying and characterizing Y-chromosome haplotypes using a novel two-haplotype framework. The analysis reveals phylogenetic structure, population diversity patterns, and haplogroup distributions across 26 global populations.

## Key Features

- **171 yyhap definitions** - Comprehensive SNP-based haplotype definitions
- **1,223 male samples** - Complete 1000 Genomes Phase 3 Y-chromosome data
- **26 populations** - Global population coverage from Africa, Asia, Europe, and Americas
- **Phylogenetic tree construction** - Hierarchical organization based on nesting patterns
- **Dendrogram visualization** - Within-group diversity analysis for major haplogroups

## Repository Structure

```
.
├── README.md                              # This file
├── LICENSE                                # Project license
├── CITATION.cff                           # Citation information
├── YYhapTree.Rmd                          # Main analysis workflow
├── YYhapTree_manuscript.Rmd               # Manuscript source
├── YYhapTree_SupplementaryMaterial.Rmd    # Supplementary figures and tables
├── data/                                  # Data files (see Data Availability)
│   ├── HapTable.RData                     # Haplogroup assignments
│   ├── m3.RData                           # Genotype matrix
│   ├── prof171.RData                      # Yyhap definitions
│   └── *.png                              # Tree structure figures
├── scripts/                               # Analysis scripts
│   └── extract.R                          # Utility functions
└── output/                                # Generated outputs
    └── YYhapTree_SupplementaryMaterial_files/
```

## Requirements

### Software
- R (≥ 4.0.0)
- RStudio (recommended)

### R Packages
```r
install.packages(c("knitr", "rmarkdown", "kableExtra", "dendextend", 
                   "RColorBrewer", "ggplot2", "dplyr"))
```

## Data Availability

### Source Data
- **1000 Genomes Project Phase 3**: ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/
- **Y-chromosome VCF**: 1000 Genomes Y-chromosome variants (GRCh37/hg19)
- **Sample information**: 1000 Genomes integrated call set samples

### Processed Data Files
Due to size limitations, large data files are available via:
- **Zenodo**: [DOI to be added upon publication]
- **Figshare**: [URL to be added upon publication]

Required files (not included in repository):
- `HapTable.RData` - Haplogroup assignments for all samples
- `m3.RData` - Genotype matrix (1,223 samples × SNPs)
- `prof171.RData` - Complete yyhap definitions with SNP lists
- `adM.RData` - Adjacency matrix for phylogenetic relationships

## Usage

### Reproduce Full Analysis
```r
# Install required packages
install.packages(c("knitr", "rmarkdown", "kableExtra", "dendextend", "RColorBrewer"))

# Render main analysis
rmarkdown::render("YYhapTree.Rmd")

# Generate supplementary material
rmarkdown::render("YYhapTree_SupplementaryMaterial.Rmd", output_format = "pdf_document")
```

### Generate Manuscript
```r
rmarkdown::render("YYhapTree_manuscript.Rmd", output_format = "pdf_document")
```

### Extract Specific Haplogroup Data
```r
# Load data
load("HapTable.RData")

# Example: Access haplogroup R1b (baaa4a)
r1b_samples <- HapTable[["baaa4a"]]
head(r1b_samples)
```

## Methodology

### Yyhap Framework
The yin-yang haplotype (yyhap) framework defines haplotypes using exactly two alleles:
- **Yin alleles**: Reference alleles (ancestral)
- **Yang alleles**: Alternative alleles (derived)

### Analysis Pipeline
1. **SNP filtering**: Quality control and Y-chromosome specific filtering
2. **Yyhap identification**: Systematic discovery of two-haplotype patterns
3. **Maximal set extraction**: Identification of non-extendable yyhap sets
4. **Tree construction**: Hierarchical organization based on subset relationships
5. **Haplogroup mapping**: Correspondence with ISOGG nomenclature
6. **Diversity analysis**: Within-group phylogenetic structure

### Key Algorithms
- **Distance metric**: Manhattan distance on binary SNP matrix
- **Clustering method**: Single linkage hierarchical clustering
- **Validation**: Phylogenetic consistency checking (23 inconsistencies identified)

## Results Summary

### Global Findings
- **171 yyhaps** identified across the Y-chromosome phylogeny
- **12 major haplogroups** with detailed dendrograms (conditional on ≥5 samples)
- **26 populations** represented with diversity patterns
- **99.8% classification success** (1,221 of 1,223 samples assigned)

### Major Haplogroups Analyzed
- **E (African)**: aaa1aa, aaa1aaa1aa1a, aaa1aaa1aba1
- **D (East Asian)**: Part of aaa1aa
- **C (South Asian)**: aaa1b6
- **J (Middle Eastern)**: ab
- **R (European/Asian)**: baaa4a (R1b), baab2 (R1a), bab2a (R2a)
- **Q (South American)**: bb4
- **O (East Asian)**: c1aa, c1ab, c1abb1

## Population Abbreviations

| Code | Population |
|------|------------|
| AfrCarib | African Caribbean in Barbados |
| AfrUSA | African Ancestry in Southwest USA |
| Bengali | Bengali in Bangladesh |
| British | British in England and Scotland |
| ChinaDai | Chinese Dai in Xishuangbanna |
| ChinaHanB | Han Chinese in Beijing |
| ChinaHanS | Han Chinese South |
| Columbia | Colombian in Medellín |
| EurUtah | Utah residents with N/W European ancestry |
| Finland | Finnish in Finland |
| Gambia | Gambian in Western Division |
| GujaratiUSA | Gujarati Indians in Houston, TX |
| Iberian | Iberian populations in Spain |
| Kenya | Luhya in Webuye, Kenya |
| MexicoUSA | Mexican Ancestry in Los Angeles, CA |
| NigeriaE | Esan in Nigeria |
| NigeriaY | Yoruba in Ibadan, Nigeria |
| Pakistan | Punjabi in Lahore, Pakistan |
| Peru | Peruvian in Lima, Peru |
| PuertoRico | Puerto Rican in Puerto Rico |
| SierraLeo | Mende in Sierra Leone |
| TamilUK | Sri Lankan Tamil in the UK |
| TelugiUK | Indian Telugu in the UK |
| Tokyo | Japanese in Tokyo, Japan |
| Toscani | Toscani in Italy |
| Vietnam | Kinh in Ho Chi Minh City |

## Citation

If you use this work in your research, please cite:

```bibtex
@article{yyhaptree2025,
  title={Y-Chromosome Phylogenetic Analysis Using the Yin-Yang Haplotype Framework},
  author={[Authors]},
  journal={[Journal]},
  year={2025},
  note={In preparation}
}
```

See `CITATION.cff` for machine-readable citation information.

## Contributing

We welcome contributions! Please:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m 'Add YourFeature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a Pull Request

## Issues and Support

- **Bug reports**: Open an issue with the `bug` label
- **Feature requests**: Open an issue with the `enhancement` label
- **Questions**: Open an issue with the `question` label

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- **1000 Genomes Project Consortium** for providing the Y-chromosome sequence data
- **ISOGG** (International Society of Genetic Genealogy) for haplogroup nomenclature
- Aalborg University for computational resources and support

## Contact

For questions or collaboration inquiries:
- **Primary Contact**: [Name] - [email]
- **Institution**: Aalborg University, Denmark

## Related Publications

[To be updated with publication information]

---

**Last Updated**: December 5, 2025  
**Version**: 1.0.0  
**Status**: Manuscript in preparation
