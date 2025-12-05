# Changelog

All notable changes to the YYhapTree project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Automated yyhap discovery pipeline
- Interactive web visualization of phylogenetic tree
- Extended population comparisons
- Integration with additional Y-chromosome databases

## [1.0.0] - 2025-12-05

### Added
- Initial release of YYhapTree analysis pipeline
- Complete R Markdown workflow for Y-chromosome analysis
- 171 yyhap definitions across Y-chromosome phylogeny
- Analysis of 1,223 samples from 1000 Genomes Project Phase 3
- Supplementary material with 12 haplogroup dendrograms
- Conditional figure rendering (excludes haplogroups with <5 samples)
- Lexicographic ordering of figures in supplementary material
- Population abbreviations and metadata
- Complete documentation (README, CONTRIBUTING, LICENSE)
- GitHub repository infrastructure (.gitignore, CITATION.cff)

### Features
- **Data Processing**
  - SNP filtering and quality control
  - Genotype matrix construction
  - Haplogroup assignment for 26 populations

- **Phylogenetic Analysis**
  - Yyhap identification and extraction
  - Hierarchical tree construction based on nesting patterns
  - Phylogenetic consistency checking (23 inconsistencies identified)
  - Correspondence mapping with ISOGG nomenclature

- **Visualization**
  - Dendrogram generation for major haplogroups
  - Population-based color coding
  - Tree structure diagrams for subbranches
  - Conditional rendering of figures based on sample size

- **Documentation**
  - Main analysis workflow (YYhapTree.Rmd)
  - Manuscript source (YYhapTree_manuscript.Rmd)
  - Supplementary material (YYhapTree_SupplementaryMaterial.Rmd)
  - Comprehensive README with usage examples

### Technical Details
- R Markdown based workflow
- knitr for reproducible analysis
- kableExtra for table formatting
- dendextend for dendrogram visualization
- Manhattan distance metric for phylogenetic relationships
- Single linkage hierarchical clustering

### Haplogroups Analyzed
- **African lineages**: E (aaa1aa, aaa1aaa1aa1a, aaa1aaa1aba1)
- **East Asian lineages**: D (part of aaa1aa), O (c1aa, c1ab, c1abb1)
- **South Asian lineages**: C5a (aaa1b6), R2a (bab2a)
- **Middle Eastern lineages**: J (ab)
- **European lineages**: R1b (baaa4a), R1a (baab2)
- **South American lineages**: Q (bb4)

### Data
- 1,223 male samples from 1000 Genomes Project
- 26 global populations
- Complete Y-chromosome SNP data
- Population metadata and haplogroup assignments

## [0.9.0] - 2025-11-XX (Pre-release)

### Changed
- Reorganized supplementary figures in lexicographic order
- Moved terminal haplogroups after their respective parent branches
- Updated figure numbering (S1-S12)
- Modified error handling to exclude small sample dendrograms

### Fixed
- Duplicate figure sections in supplementary material
- Figure ordering inconsistencies
- Caption references

## [0.8.0] - 2025-10-XX (Pre-release)

### Added
- Initial supplementary material document
- Basic dendrogram visualization
- Error handling for small sample sizes

### Changed
- Improved dendrogram color coding by population
- Enhanced figure captions with haplogroup information

---

## Version Number Scheme

- **MAJOR version**: Incompatible API/analysis changes
- **MINOR version**: New functionality in a backwards-compatible manner
- **PATCH version**: Backwards-compatible bug fixes

## Types of Changes

- **Added**: New features
- **Changed**: Changes in existing functionality
- **Deprecated**: Soon-to-be removed features
- **Removed**: Removed features
- **Fixed**: Bug fixes
- **Security**: Vulnerability fixes

---

[Unreleased]: https://github.com/username/yyhaptree/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/username/yyhaptree/releases/tag/v1.0.0
[0.9.0]: https://github.com/username/yyhaptree/releases/tag/v0.9.0
[0.8.0]: https://github.com/username/yyhaptree/releases/tag/v0.8.0
