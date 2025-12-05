# Installation Guide

This guide will help you set up the YYhapTree analysis environment on your system.

## Prerequisites

### Required Software

1. **R** (version ≥ 4.0.0)
   - Download from: https://cran.r-project.org/
   - Verify installation:
     ```r
     R.version.string
     ```

2. **RStudio** (recommended, not required)
   - Download from: https://posit.co/download/rstudio-desktop/
   - Version: Any recent version (2022.02.0 or later recommended)

3. **Git** (for repository cloning)
   - Download from: https://git-scm.com/downloads

### System Requirements

- **RAM**: 8 GB minimum, 16 GB recommended
- **Disk Space**: 5 GB minimum for data files and outputs
- **OS**: Windows 10/11, macOS 10.14+, or Linux (Ubuntu 18.04+)

## Installation Steps

### 1. Clone the Repository

```bash
# Using HTTPS
git clone https://github.com/[username]/yyhaptree.git
cd yyhaptree

# Or using SSH
git clone git@github.com:[username]/yyhaptree.git
cd yyhaptree
```

### 2. Install R Packages

Open R or RStudio and run:

```r
# Install required packages
packages <- c(
  "knitr",
  "rmarkdown", 
  "kableExtra",
  "dendextend",
  "RColorBrewer",
  "ggplot2",
  "dplyr",
  "tidyr"
)

# Install packages that are not already installed
install.packages(packages[!packages %in% installed.packages()[,"Package"]])
```

### 3. Verify Package Installation

```r
# Check that all packages load successfully
library(knitr)
library(rmarkdown)
library(kableExtra)
library(dendextend)
library(RColorBrewer)

# Print package versions
sessionInfo()
```

### 4. Download Data Files

The large data files are not included in the repository. Download them from:

**Option A: Zenodo (Recommended)**
```bash
# Download from Zenodo
wget https://zenodo.org/record/[RECORD_ID]/files/HapTable.RData
wget https://zenodo.org/record/[RECORD_ID]/files/m3.RData
wget https://zenodo.org/record/[RECORD_ID]/files/prof171.RData
wget https://zenodo.org/record/[RECORD_ID]/files/adM.RData

# Or using curl
curl -O https://zenodo.org/record/[RECORD_ID]/files/HapTable.RData
curl -O https://zenodo.org/record/[RECORD_ID]/files/m3.RData
curl -O https://zenodo.org/record/[RECORD_ID]/files/prof171.RData
curl -O https://zenodo.org/record/[RECORD_ID]/files/adM.RData
```

**Option B: Manual Download**
1. Visit the Zenodo record: [URL to be added]
2. Download all `.RData` files
3. Place them in the project root directory

### 5. Verify Data Files

```r
# Verify all data files are present and loadable
files_to_check <- c("HapTable.RData", "m3.RData", "prof171.RData", "adM.RData")

for (file in files_to_check) {
  if (file.exists(file)) {
    cat("✓", file, "found\n")
    tryCatch({
      load(file)
      cat("  Successfully loaded\n")
    }, error = function(e) {
      cat("  ERROR loading:", e$message, "\n")
    })
  } else {
    cat("✗", file, "NOT FOUND\n")
  }
}
```

### 6. Test the Installation

Run a simple test to ensure everything works:

```r
# Load required libraries
library(knitr)
library(rmarkdown)

# Test rendering a simple section
test_code <- '
---
output: html_document
---

```{r}
load("HapTable.RData")
cat("Number of haplogroups:", length(HapTable), "\n")
cat("Total samples:", sum(sapply(HapTable, nrow)), "\n")
```
'

# Write test file
writeLines(test_code, "test_install.Rmd")

# Try to render
rmarkdown::render("test_install.Rmd", quiet = TRUE)

# Clean up
file.remove("test_install.Rmd", "test_install.html")
cat("✓ Installation test passed!\n")
```

## Platform-Specific Instructions

### Windows

1. **Install Rtools** (required for some packages):
   - Download from: https://cran.r-project.org/bin/windows/Rtools/
   - Choose the version matching your R version

2. **Path issues**: If R can't find executables, add R to PATH:
   ```powershell
   # In PowerShell (as Administrator)
   $env:PATH += ";C:\Program Files\R\R-4.x.x\bin"
   ```

### macOS

1. **Install Xcode Command Line Tools** (may be required):
   ```bash
   xcode-select --install
   ```

2. **Install XQuartz** (for graphics):
   - Download from: https://www.xquartz.org/

### Linux (Ubuntu/Debian)

1. **Install system dependencies**:
   ```bash
   sudo apt-get update
   sudo apt-get install -y \
     r-base \
     r-base-dev \
     libcurl4-openssl-dev \
     libssl-dev \
     libxml2-dev \
     libfontconfig1-dev \
     libharfbuzz-dev \
     libfribidi-dev \
     libfreetype6-dev \
     libpng-dev \
     libtiff5-dev \
     libjpeg-dev
   ```

2. **Install R packages as above**

## Troubleshooting

### Issue: Package installation fails

**Solution**: Install system dependencies first (see platform-specific instructions)

### Issue: "Cannot load HapTable.RData"

**Solution**: 
```r
# Check if file exists
file.exists("HapTable.RData")

# Check working directory
getwd()

# Set correct working directory
setwd("path/to/yyhaptree")
```

### Issue: "Out of memory" error

**Solution**: 
```r
# Increase memory limit (Windows)
memory.limit(size = 16000)

# Or work with subsets of data
load("HapTable.RData")
small_sample <- HapTable[1:5]  # First 5 haplogroups only
```

### Issue: Rendering fails with LaTeX errors

**Solution**: Install TinyTeX for PDF output
```r
install.packages("tinytex")
tinytex::install_tinytex()
```

### Issue: Graphics don't display

**Solution**:
```r
# Test graphics device
plot(1:10)

# If that fails, try:
# Windows
windows()

# macOS
quartz()

# Linux
x11()
```

## Updating

To update to the latest version:

```bash
# Pull latest changes
git pull origin main

# Update R packages
update.packages(ask = FALSE)

# Re-download data files if needed
# (check CHANGELOG.md for data file updates)
```

## Getting Help

If you encounter issues:

1. **Check documentation**: Review README.md and this guide
2. **Search issues**: Check existing GitHub issues
3. **Ask for help**: Open a new issue with:
   - Your operating system
   - R version (`R.version.string`)
   - Package versions (`sessionInfo()`)
   - Error messages
   - Minimal reproducible example

## Next Steps

After successful installation:

1. **Read the main README**: `README.md`
2. **Explore the analysis**: Open `YYhapTree.Rmd` in RStudio
3. **Generate supplementary material**: Render `YYhapTree_SupplementaryMaterial.Rmd`
4. **Review documentation**: Check `CONTRIBUTING.md` if you want to contribute

## Verification Checklist

- [ ] R version ≥ 4.0.0 installed
- [ ] All required R packages installed and loading without errors
- [ ] Data files downloaded and verified
- [ ] Test rendering successful
- [ ] No warnings about missing dependencies
- [ ] Graphics display correctly
- [ ] Sufficient disk space and memory available

---

**Installation Issues?** Open an issue: https://github.com/[username]/yyhaptree/issues
