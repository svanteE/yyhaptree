# Contributing to YYhapTree

Thank you for your interest in contributing to the YYhapTree project! This document provides guidelines for contributing to this Y-chromosome phylogenetic analysis project.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Reporting Issues](#reporting-issues)
- [Submitting Changes](#submitting-changes)
- [Coding Standards](#coding-standards)
- [Testing](#testing)

## Code of Conduct

This project adheres to a code of conduct that promotes:
- Respectful and inclusive communication
- Constructive feedback
- Collaboration and knowledge sharing
- Recognition of all contributors

Please be respectful and professional in all interactions.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/your-username/yyhaptree.git
   cd yyhaptree
   ```
3. **Add upstream remote**:
   ```bash
   git remote add upstream https://github.com/original-owner/yyhaptree.git
   ```
4. **Install dependencies** in R:
   ```r
   install.packages(c("knitr", "rmarkdown", "kableExtra", "dendextend", "RColorBrewer"))
   ```

## How to Contribute

We welcome contributions in several areas:

### 1. Code Contributions
- Bug fixes
- Performance improvements
- New analysis features
- Documentation improvements

### 2. Analysis Extensions
- Additional haplogroup analyses
- New visualization methods
- Statistical methods
- Population comparisons

### 3. Documentation
- README improvements
- Code comments
- Tutorial creation
- Method documentation

### 4. Data
- Validation datasets
- Additional population data (with proper permissions)
- Benchmark comparisons

## Reporting Issues

Before creating an issue, please:

1. **Search existing issues** to avoid duplicates
2. **Gather information**:
   - R version (`R.version.string`)
   - Package versions (`sessionInfo()`)
   - Operating system
   - Minimal reproducible example (if applicable)

### Issue Template

```markdown
**Description:**
[Clear description of the issue]

**Expected Behavior:**
[What you expected to happen]

**Actual Behavior:**
[What actually happened]

**Reproducible Example:**
```r
# Minimal code to reproduce the issue
```

**Environment:**
- R version:
- OS:
- Package versions:
```

## Submitting Changes

### Pull Request Process

1. **Create a branch** for your changes:
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes** following the [Coding Standards](#coding-standards)

3. **Test your changes** thoroughly

4. **Commit your changes**:
   ```bash
   git add .
   git commit -m "Brief description of changes"
   ```
   
   Commit message guidelines:
   - Use present tense ("Add feature" not "Added feature")
   - Use imperative mood ("Move cursor to..." not "Moves cursor to...")
   - First line: brief summary (50 chars or less)
   - Blank line, then detailed explanation if needed

5. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request** on GitHub

### Pull Request Template

```markdown
**Description:**
[Clear description of what this PR does]

**Related Issue:**
Closes #[issue number]

**Changes Made:**
- [List of changes]
- [Another change]

**Testing:**
- [ ] Tested locally
- [ ] All existing tests pass
- [ ] Added new tests (if applicable)

**Checklist:**
- [ ] Code follows project style guidelines
- [ ] Comments added for complex code
- [ ] Documentation updated
- [ ] No new warnings introduced
```

## Coding Standards

### R Code Style

Follow the [tidyverse style guide](https://style.tidyverse.org/):

1. **Naming conventions**:
   ```r
   # Variables and functions: snake_case
   my_variable <- 10
   calculate_distance <- function(x, y) { ... }
   
   # Constants: UPPER_CASE
   MAX_ITERATIONS <- 1000
   ```

2. **Spacing**:
   ```r
   # Good
   x <- 5
   mean(x, na.rm = TRUE)
   
   # Bad
   x<-5
   mean(x,na.rm=TRUE)
   ```

3. **Line length**: Maximum 80 characters

4. **Indentation**: 2 spaces (no tabs)

5. **Comments**:
   ```r
   # Good: Explain why, not what
   # Use Manhattan distance for binary data
   dist_matrix <- dist(data, method = "manhattan")
   
   # Bad: Obvious comment
   # Calculate distance
   dist_matrix <- dist(data, method = "manhattan")
   ```

### R Markdown Standards

1. **Chunk naming**: Use descriptive names
   ```r
   ```{r load-data}
   ```
   
   ```{r plot-haplogroup-e}
   ```

2. **Chunk options**: Set consistently
   ```r
   ```{r chunk-name, echo=FALSE, message=FALSE, warning=FALSE}
   ```

3. **Inline code**: Use for dynamic values
   ```r
   There are `r nrow(data)` samples in the dataset.
   ```

## Testing

Before submitting a PR:

1. **Test R Markdown rendering**:
   ```r
   rmarkdown::render("YYhapTree_SupplementaryMaterial.Rmd")
   ```

2. **Check for warnings**:
   ```r
   # Your code should not introduce new warnings
   ```

3. **Verify data consistency**:
   ```r
   # Ensure all data objects load correctly
   load("HapTable.RData")
   stopifnot(is.list(HapTable))
   ```

4. **Test with sample data** (if applicable)

## Documentation

When adding new functions or features:

1. **Add roxygen2 comments** (if creating R package functions):
   ```r
   #' Calculate haplogroup distance
   #'
   #' @param x Genotype matrix
   #' @param method Distance method
   #' @return Distance matrix
   #' @examples
   #' dist_matrix <- calculate_distance(genotypes, "manhattan")
   #' @export
   calculate_distance <- function(x, method = "manhattan") {
     # Function code
   }
   ```

2. **Update README.md** if adding user-facing features

3. **Add examples** for complex analyses

## Questions?

If you have questions about contributing:

1. Check existing documentation
2. Search closed issues
3. Open a new issue with the `question` label

## Recognition

All contributors will be acknowledged in:
- The project README
- Publication acknowledgments (for significant contributions)
- GitHub contributors list

Thank you for contributing to YYhapTree! 🧬
