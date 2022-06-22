
<!-- README.md is generated from README.Rmd. Please edit that file -->

# MADRES

<!-- badges: start -->
<!-- badges: end -->

The MADRES package is a small suite of helper functions for working with
data from the MADRES Center at USC.

The Maternal And Developmental Risks from Environmental and Social
Stressors (MADRES) Center aims to understand the impact of environmental
exposures and social stressors on the health of mothers and their
children, and particularly how these exposures contribute to health
disparities. Since its inception in 2015, the MADRES Center has
recruited a cohort of over 900 women during pregnancy from four
community health centers in Los Angeles. The majority of MADRES Study
participants are Hispanic and report annual household incomes of less
than $50,000. The study follows the women and children through the
child’s fifth birthday. Key maternal health outcomes include pregnancy
weight gain, as well as postpartum weight retention, depression, and
cardiovascular disease risk in the years after birth. Key child health
outcomes include early childhood obesity, respiratory health including
asthma, neurodevelopment, and overall health.

If you’re interested in our work, please check out our research at
[madres.usc.edu](madres.usc.edu).

## Installation

You can install the development version of MADRES from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("helenbfoley/MADRES")
```

## Example

We can use these helper functions to investigate the number of
participants contributing to our biosample repository, who fit certain
criteria. Suppose we are sending out some maternal whole blood samples
to look at levels of metals. Our criteria are:

-   Maternal whole blood samples
-   From the late-pregnancy visit (approx 3rd trimester)

``` r
library(MADRES)

#Look at the data provided: simulated labtracking data
head(simul_labtrack)
#>               ID family_id            SAMPLE_TYPE         Sample_Name Sample_ID
#> 1 MAD-4-15-78-00        78 Blue - Top Whole Blood  MAD-4-15-78-00-BW1  MF367826
#> 2 MAD-4-15-78-00        78 Blue - Top Whole Blood  MAD-4-15-78-00-BW2  MF367826
#> 3 MAD-4-15-78-00        78 Blue - Top Whole Blood  MAD-4-15-78-00-BW3  MF367826
#> 4 MAD-4-15-78-00        78      Red - Top 1 Serum MAD-4-15-78-00-R1-1  MF306220
#> 5 MAD-4-15-78-00        78      Red - Top 1 Serum MAD-4-15-78-00-R1-2  MF306220
#> 6 MAD-4-15-78-00        78      Red - Top 1 Serum MAD-4-15-78-00-R1-3  MF306220
#>   SampleID            time Collection_Time Aliquot_ID Aliquot_Volume_uL
#> 1  5136722 First Trimester      1778843280    TU14807               380
#> 2  5136725 First Trimester      1778843280    PT58155               500
#> 3  5136728 First Trimester      1778843280    UG26036               500
#> 4  5137427 First Trimester      1778843280    QP27728               390
#> 5  5137430 First Trimester      1778843280    YH06870               500
#> 6  5137433 First Trimester      1778843280    BX71182               500
#>   LDNA_LRNA_Concentration
#> 1                      NA
#> 2                      NA
#> 3                      NA
#> 4                      NA
#> 5                      NA
#> 6                      NA

#look at a few of the attributes of our data: 
table(simul_labtrack$time)
#> 
#>           Birth First Trimester Third Trimester 
#>              18              85             100
table(simul_labtrack$SAMPLE_TYPE)
#> 
#>     Blue - Top Whole Blood Lavender - Top DNA Isolate 
#>                         23                         18 
#> Lavender - Top EDTA Plasma          Red - Top 1 Serum 
#>                         72                         40 
#>       Urine 1.5mL Aliquots 
#>                         50


#Filter the data by our criteria. Using a longer form and dplyr to make this easy to read. 
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

simul_labtrack %>% filter(SAMPLE_TYPE=="Blue - Top Whole Blood") %>% 
  filter(time=="Third Trimester") ->WB_candidates

#Count how many participants we have here, and see how many are maternal samples. 
CountuniqueIDs(WB_candidates$ID)
#> [1] 3
CountuniqueMothers(WB_candidates$ID)
#> [1] 3
```

We see that there are three participants in this mini labtracking
dataset fitting our criteria, and that all of them are maternal samples.

There are lots of applications for these helper functions when setting
up biosample datasets, as well as among the demographic and other data
in MADRES. If you have requests for new functions or code snippets you
find yourself copying all the time, reach out and we can add it to this
package.

Thanks for checking out MADRES! Helen Foley
