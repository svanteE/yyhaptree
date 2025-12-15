# GitHub Copilot Instructions for YYhapTree

This document provides guidance for AI coding assistants working with the YYhapTree Y-chromosome phylogenetic analysis project.

## Project Overview

**YYhapTree** is a Y-chromosome phylogenetic analysis pipeline using the yin-yang haplotype (yyhap) framework applied to 1000 Genomes Project Phase 3 data. The project analyzes 8,008 SNPs from 1,223 male samples across 26 global populations.

### Key Concepts

- **Yin-Yang Haplotype (yyhap)**: A maximal set of SNPs where only two distinct haplotypes (yin=ancestral, yang=derived) are observed across all individuals
- **LODY (Length Of Ding Yang)**: The number of SNPs in a yyhap
- **171 yyhaps**: The complete set of haplogroup definitions discovered
- **Terminal haplogroups**: Leaf nodes in the phylogenetic tree (e.g., bb4, baaa4aa1, c1b3, abaaa3a)

## Technology Stack

- **Language**: R ( 4.0.0)
- **Document Format**: R Markdown (.Rmd)
- **Key Packages**: 
  - `knitr`, `rmarkdown` - Document rendering
  - `kableExtra` - Table formatting with styling
  - `dendextend` - Dendrogram visualization
  - `RColorBrewer` - Color palettes for populations
  - `webshot2` - PDF rendering support

## Project Structure

```
yyhaptree/
 YYhapTree_manuscript.Rmd       # Main manuscript for publication
 YYhapTree_SupplementaryMaterial.Rmd  # Supplementary figures/tables
 YYhapTree.Rmd                  # Analysis workflow
 extract.R                      # Utility functions
 references.bib                 # BibTeX references
 molecular-biology-and-evolution.csl  # Citation style
 *.RData                        # Data files (m3, prof171, HapTable, adM)
 .github/                       # GitHub templates and workflows
```

## Data Files and Structures

### Primary Data Objects

1. **`m3.RData`** - Main genotype matrix
   - Rows: SNP profiles
   - Columns 1-8008: SNP genotypes (binary)
   - Column 8009 (`ori`): Population origin
   - Column 8010 (`HG`): ISOGG haplogroup

2. **`prof171.RData`** - Contains `profs` list (171 yyhap definitions)
   - `profs[[i]]$HG`: Haplogroup names for samples
   - `profs[[i]]$origin`: Population distribution
   - `profs[[i]]$inHg`: SNPs specific to this haplogroup

3. **`HapTable.RData`** - Named list of haplogroup assignments
   - Keys: Haplogroup codes (e.g., "baaa4a", "c1b3")
   - Values: Data frames with genotypes and population info

4. **`adM.RData`** - Adjacency matrix for phylogenetic relationships

### Population Abbreviations

Use these standard abbreviations:
```r
short = c("AfrCarib", "AfrUSA", "Bengali", "ChinaDai", "EurUtah", 
          "ChinaHanB", "ChinaHanS", "Columbia", "NigeriaE", "Finland",
          "British", "GujaratiUSA", "Gambia", "Iberian", "TelugiUK",
          "Tokyo", "Vietnam", "Kenya", "SierraLeo", "MexicoUSA",
          "Peru", "Pakistan", "PuertoRico", "TamilUK", "Toscani", "NigeriaY")
```

## R Code Patterns

### Standard Setup Chunk

```r
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE, warning = FALSE, message = FALSE, fig.height = 4)
library(webshot2)
library(dendextend)
library(RColorBrewer)
library(knitr)
library(kableExtra)

load("m3.RData")
load("adM.RData")
load("prof171.RData")
load("HapTable.RData")
source("extract.R")
```

### Dendrogram Generation

Pattern for creating population-colored dendrograms:

```r
```{r plot-haplogroup-name, fig.height=5}
hap_data <- HapTable[["haplogroup_code"]]
n <- nrow(hap_data)

if (n >= 5) {
  d <- dist(hap_data[, 1:(ncol(hap_data)-2)])  # Exclude ori and HG columns
  hc <- hclust(d)
  dend <- as.dendrogram(hc)
  
  # Color by population
  pop_colors <- RColorBrewer::brewer.pal(12, "Set3")
  pop_factor <- as.factor(hap_data$ori)
  labels_colors(dend) <- pop_colors[as.numeric(pop_factor)]
  
  par(mar = c(10, 4, 4, 2))
  plot(dend, main = "Haplogroup Name Dendrogram")
}
```

### Table Generation with kableExtra

```r
# Simple frequency table
table(profs[["haplogroup"]]$HG) %>%
  kable(col.names = c("ISOGG Haplogroup", "Count")) %>%
  kable_styling(bootstrap_options = c("striped", "hover"))

# Population distribution table using inVertex helper
inVertex(profs[["haplogroup"]], m3) %>%
  kable() %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"))
```

### Conditional Figure Rendering

Only show figures for haplogroups with sufficient samples:

```r
```{r conditional-figure, eval = nrow(HapTable[["haplogroup"]]) >= 5}
# Dendrogram code here - only executed if n >= 5
```

## Manuscript Conventions

### Branch Naming

- Four primary branches from root: **a**, **b**, **c**, **d**
- Always bold branch names in text using `**a**`, `**b**`, etc.
- Terminal haplogroups use concatenated naming (e.g., baaa4aa1 = branch b  a  a  a  4  a  a  1)

### Branch Geographic Associations

- **Branch a**: Primarily African lineages (E haplogroups), some South Asian
- **Branch b**: Eurasian lineages (R, Q haplogroups - European, Asian, Americas)
- **Branch c**: East Asian lineages (O, N haplogroups)
- **Branch d**: Mediterranean/ancestral (J haplogroup, Middle Eastern)

### Figure Numbering

- Figure 1: Complete phylogenetic tree (in Introduction)
- Subsequent figures in Results follow section order
- Supplementary figures in lexicographic order by haplogroup code

### Citation Style

Uses `molecular-biology-and-evolution.csl` for MBE journal format. Key references:
- `@jobling2017human` - Y-chromosome biology
- `@1000genomes2015global` - 1000 Genomes Project
- `@wei2013whole`, `@hallast2015great`, `@batini2015large` - Tyler-Smith lab work

## Common Tasks

### Adding a Terminal Haplogroup Example

1. Create a new subsection under the appropriate branch
2. Add dendrogram figure with population colors
3. Add ISOGG haplogroup frequency table using `table(profs[[x]]$HG)`
4. Include population distribution if relevant
5. Describe geographic/demographic patterns

### Updating SNP Counts

When SNP counts change, update in:
- Abstract (YYhapTree_manuscript.Rmd)
- Materials and Methods section
- Supplementary Material header
- Data quality section

### Adding New References

1. Add BibTeX entry to `references.bib`
2. Use `@citationkey` format in text
3. Verify with `rmarkdown::render()` that citation resolves

## Code Style Guidelines

### R Code

- Use snake_case for variables: `hap_data`, `pop_colors`
- Use descriptive chunk names: `{r plot-branch-b-dendrogram}`
- Include `echo=FALSE, message=FALSE, warning=FALSE` in chunks
- Prefer tidyverse-style piping for table operations
- Comment complex data transformations

### R Markdown

- Use `##` for main sections, `###` for subsections
- Keep lines under 100 characters where possible
- Use inline R for dynamic values: `` `r nrow(data)` samples``
- Separate code chunks with blank lines

## Testing Changes

Before committing:

```r
# Render manuscript
rmarkdown::render("YYhapTree_manuscript.Rmd", output_format = "pdf_document")

# Render supplementary material
rmarkdown::render("YYhapTree_SupplementaryMaterial.Rmd", output_format = "pdf_document")

# Check for warnings in console output
```

## Git Workflow

- Commit messages: Present tense, imperative ("Add feature" not "Added feature")
- Keep commits focused on single changes
- Reference issue numbers where applicable

## Common Issues and Solutions

### Dendrogram Display Issues
- Adjust `fig.height` in chunk options
- Set `par(mar = c(bottom, left, top, right))` for margins
- Use `cex` parameter to adjust label sizes

### Table Rendering Issues
- Use `table(profs[[x]]$HG)` pattern (not `$HG` alone)
- Ensure data frame structure before piping to kable
- Check column names match expected format

### PDF Generation Failures
- Ensure `webshot2` and Chrome/Chromium installed
- Check LaTeX installation for PDF output
- Try HTML output first to isolate issues

## Contact

- **Author**: P. Svante Eriksen (svante@math.aau.dk)
- **Institution**: Aalborg University, Denmark
- **Repository**: https://github.com/svanteE/yyhaptree
