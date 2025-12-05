# Quick Start Guide

Get up and running with YYhapTree in minutes!

## ⚡ Prerequisites

- R (≥ 4.0.0) installed
- RStudio (recommended)
- 8 GB RAM minimum

## 🚀 5-Minute Setup

### 1. Clone and Install (2 minutes)

```bash
git clone https://github.com/[username]/yyhaptree.git
cd yyhaptree
```

Open RStudio and run:
```r
# Install required packages
install.packages(c("knitr", "rmarkdown", "kableExtra", "dendextend", "RColorBrewer"))
```

### 2. Get Data (2 minutes)

Download data files from Zenodo: [LINK]

Or use wget/curl:
```bash
wget https://zenodo.org/record/[ID]/files/HapTable.RData
wget https://zenodo.org/record/[ID]/files/m3.RData
wget https://zenodo.org/record/[ID]/files/prof171.RData
wget https://zenodo.org/record/[ID]/files/adM.RData
```

### 3. Verify Setup (1 minute)

```r
# Verify installation
load("HapTable.RData")
cat("Haplogroups:", length(HapTable), "\n")
cat("Setup complete! ✓\n")
```

## 📊 Basic Usage

### View Haplogroup Data

```r
# Load data
load("HapTable.RData")

# List all haplogroups
names(HapTable)

# Examine R1b data (baaa4a)
r1b <- HapTable[["baaa4a"]]
head(r1b)
table(r1b$ori)  # Population distribution
```

### Generate Supplementary Material

```r
# Render supplementary figures (takes ~5-10 minutes)
rmarkdown::render("YYhapTree_SupplementaryMaterial.Rmd", output_format = "pdf_document")

# Output: YYhapTree_SupplementaryMaterial.pdf
```

### Run Main Analysis

```r
# Full analysis workflow (takes ~30 minutes)
rmarkdown::render("YYhapTree.Rmd")
```

## 🎯 Common Tasks

### Extract Specific Population

```r
load("HapTable.RData")

# Get all European R1b samples
r1b <- HapTable[["baaa4a"]]
european_r1b <- r1b[r1b$ori %in% c("British", "Finland", "Toscani", "Iberian"), ]
nrow(european_r1b)
```

### Create Custom Dendrogram

```r
library(dendextend)
library(RColorBrewer)

# Load data
load("HapTable.RData")
load("prof171.RData")

# Select haplogroup
hap_name <- "baaa4a"  # R1b
h <- HapTable[[hap_name]]

# Calculate distances
h <- h[order(h$ori), ]
L <- ncol(h)
d1 <- h[, -c(L-1, L)]  # Remove HG and ori columns
di <- dist(d1, method = "manhattan")

# Create dendrogram
cl <- hclust(di, method = "single")
dend <- as.dendrogram(cl)

# Color by population
colors <- brewer.pal(length(levels(h$ori)), "Set1")
label_colors <- colors[as.numeric(h$ori)]
labels_colors(dend) <- label_colors[order.dendrogram(dend)]

# Plot
plot(dend, main = paste("Haplogroup", hap_name), ylab = "Manhattan Distance")
```

### Check Sample Sizes

```r
load("HapTable.RData")

# Get sample sizes for all haplogroups
sample_sizes <- sapply(HapTable, nrow)
sort(sample_sizes, decreasing = TRUE)

# Filter haplogroups with ≥10 samples
large_haps <- names(sample_sizes[sample_sizes >= 10])
large_haps
```

## 📚 Next Steps

1. **Read the full README**: `README.md`
2. **Explore the analysis**: Open `YYhapTree.Rmd` in RStudio
3. **Check methodology**: Review the manuscript
4. **Contribute**: See `CONTRIBUTING.md`

## 🆘 Troubleshooting

### "Cannot load data files"
```r
# Check working directory
getwd()

# Set to project directory
setwd("path/to/yyhaptree")
```

### "Package not found"
```r
# Install missing package
install.packages("package_name")
```

### "Out of memory"
```r
# Work with subset of data
load("HapTable.RData")
small_sample <- HapTable[1:5]  # First 5 haplogroups
```

### Rendering fails
```r
# Install LaTeX for PDF output
install.packages("tinytex")
tinytex::install_tinytex()

# Or render to HTML instead
rmarkdown::render("YYhapTree_SupplementaryMaterial.Rmd", output_format = "html_document")
```

## 💡 Tips

- **RStudio**: Use the "Knit" button for easier rendering
- **Memory**: Close other applications when processing large datasets
- **PDF output**: Install TinyTeX if you don't have LaTeX
- **Parallel processing**: Use `parallel` package for faster analysis

## 🔗 Quick Links

- **Full Installation Guide**: [INSTALL.md](INSTALL.md)
- **Contributing Guide**: [CONTRIBUTING.md](CONTRIBUTING.md)
- **Report Issues**: [GitHub Issues](https://github.com/[username]/yyhaptree/issues)
- **1000 Genomes Data**: [FTP Link](ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/)

## Example Output

After running the supplementary material script, you'll get:

- **PDF document** with:
  - 12 haplogroup dendrograms (conditionally rendered)
  - Population color-coded samples
  - Phylogenetic distance metrics
  - Complete yyhap definitions

## Performance Tips

| Task | Expected Time | Memory Usage |
|------|---------------|--------------|
| Load data | < 1 min | 2 GB |
| Generate supplementary PDF | 5-10 min | 4 GB |
| Full analysis | 30-60 min | 6 GB |
| Single dendrogram | < 1 min | 1 GB |

---

**Need Help?** Open an issue or check the [full documentation](README.md)!
