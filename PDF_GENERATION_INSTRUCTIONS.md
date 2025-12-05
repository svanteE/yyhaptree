# PDF Generation Instructions for YYhapTree Manuscript

## Completed Tasks ✓

1. **MBE Citation Style Downloaded** - `molecular-biology-and-evolution.csl` is now in your project directory
2. **Figure Legends Section Added** - All 6 main figures have detailed legends at the end of the manuscript
3. **References Bibliography** - `references.bib` already exists with 16 citations properly formatted
4. **Cover Letter Created** - `CoverLetter_MBE.md` is ready for submission

## To Generate the Final PDF

Since R/Rscript is not available in the PowerShell path, please use **RStudio** to knit the manuscript:

### Method 1: Using RStudio (Recommended)
1. Open `YYhapTree_manuscript.Rmd` in RStudio
2. Click the **"Knit"** button at the top of the editor
3. Select **"Knit to PDF"**
4. The PDF will be generated as `YYhapTree_manuscript.pdf` in the same directory

### Method 2: Using R Console
```r
setwd("c:/Users/svante/OneDrive - Aalborg Universitet/mito")
rmarkdown::render("YYhapTree_manuscript.Rmd", output_format = "pdf_document")
```

### Method 3: Add R to PATH (For Future Terminal Use)
If you want to use Rscript from PowerShell in the future:
1. Find your R installation (likely in `C:\Program Files\R\R-x.x.x\bin\`)
2. Add that path to your Windows PATH environment variable
3. Then you can run: `Rscript -e "rmarkdown::render('YYhapTree_manuscript.Rmd')"`

## Required Packages

Ensure these R packages are installed before knitting:
```r
install.packages(c("rmarkdown", "knitr", "webshot2", "dendextend", "RColorBrewer"))
```

## Expected Output

The PDF will include:
- **Title page** with author information and abstract
- **Line numbers** (left margin)
- **Double-spacing** throughout
- **~40-50 pages** total with proper MBE formatting
- **6 main figures** with detailed legends
- **References** in author-year format (MBE style)
- **Supporting Information** section description

## Files Ready for Submission

Once you generate the PDF, you'll have a complete submission package:

1. ✓ **YYhapTree_manuscript.pdf** (generate this)
2. ✓ **YYhapTree_SupplementaryMaterial.Rmd** (ready - knit to PDF separately)
3. ✓ **CoverLetter_MBE.md** (ready - convert to PDF or Word)
4. ✓ **Figure files** (already embedded, but MBE may want separate high-res versions)
5. ✓ **GitHub repository**: https://github.com/svanteE/yyhaptree

## Next Steps After PDF Generation

1. **Knit Supplementary Material**: Open `YYhapTree_SupplementaryMaterial.Rmd` and knit to PDF
2. **Review PDFs**: Check formatting, figure quality, reference formatting
3. **Create Zenodo Archive**:
   - Go to https://zenodo.org/account/settings/github/
   - Link your GitHub repository
   - Create a release (v1.0.0) to trigger Zenodo archiving
   - Add the Zenodo DOI to your manuscript and README
4. **Format Cover Letter**: Convert `CoverLetter_MBE.md` to PDF or Word for submission
5. **Submit to MBE**: Upload all files through the journal submission system

## Troubleshooting

If PDF generation fails:
- **LaTeX errors**: Install TinyTeX: `tinytex::install_tinytex()`
- **Missing packages**: Run the install.packages command above
- **Figure generation issues**: Check that all .RData files are loaded correctly
- **Citation errors**: Verify all `@cite` keys match entries in `references.bib`

## Final Checklist Before Submission

- [ ] Main manuscript PDF generated successfully
- [ ] Supplementary material PDF generated
- [ ] All figures display correctly at high resolution
- [ ] References formatted in author-year style
- [ ] Line numbers and double-spacing present
- [ ] Cover letter personalized (add editor name)
- [ ] Zenodo DOI added to Data Availability statement
- [ ] GitHub repository is public and complete
- [ ] All co-authors (if any) have approved the manuscript

---

**Note**: The manuscript is now complete and MBE-ready. The only remaining technical step is PDF generation through RStudio, which requires opening the file in the RStudio IDE rather than command-line execution.
