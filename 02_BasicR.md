Introduction to R
================
Escapa I.F.
2023-05-24

<br></br> <br></br>

# Objects

``` r
4+4
```

    ## [1] 8

``` r
20 * 250
```

    ## [1] 5000

``` r
5^2
```

    ## [1] 25

``` r
x <- 4+4 
#Look at the workspace!
x 
```

    ## [1] 8

``` r
#Look at the console!
x <- 4+10
y <- 5
```

``` r
nums.vector <- c(7, 8, 45, 3, 2, 67)
cols.vector <- c("red", "blue", "green", "pink")
my.list  <- list(x, y, nums.vector, cols.vector)
my.matrix <- cbind(x, y, nums.vector, cols.vector)
```

    ## Warning in cbind(x, y, nums.vector, cols.vector): number of rows of result is
    ## not a multiple of vector length (arg 4)

``` r
class(nums.vector)
```

    ## [1] "numeric"

``` r
class(cols.vector)
```

    ## [1] "character"

``` r
class(my.list)
```

    ## [1] "list"

``` r
class(my.matrix)
```

    ## [1] "matrix" "array"

``` r
my.list
```

    ## [[1]]
    ## [1] 14
    ## 
    ## [[2]]
    ## [1] 5
    ## 
    ## [[3]]
    ## [1]  7  8 45  3  2 67
    ## 
    ## [[4]]
    ## [1] "red"   "blue"  "green" "pink"

``` r
my.matrix
```

    ##      x    y   nums.vector cols.vector
    ## [1,] "14" "5" "7"         "red"      
    ## [2,] "14" "5" "8"         "blue"     
    ## [3,] "14" "5" "45"        "green"    
    ## [4,] "14" "5" "3"         "pink"     
    ## [5,] "14" "5" "2"         "red"      
    ## [6,] "14" "5" "67"        "blue"

# Data Frames and indexing

``` r
mtcars #built-in data frame, go to the help window to learn about it
```

    ##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    ## Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
    ## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
    ## Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    ## Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
    ## Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
    ## Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
    ## Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
    ## Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    ## Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    ## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
    ## Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
    ## Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
    ## Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
    ## Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
    ## Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
    ## Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
    ## Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
    ## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
    ## Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
    ## Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
    ## Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    ## Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
    ## AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
    ## Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
    ## Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
    ## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
    ## Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
    ## Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
    ## Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
    ## Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
    ## Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
    ## Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

``` r
cars <- mtcars
```

``` r
cars$mpg
```

    ##  [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2 10.4
    ## [16] 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4 15.8 19.7
    ## [31] 15.0 21.4

``` r
cars[,1]
```

    ##  [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2 10.4
    ## [16] 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4 15.8 19.7
    ## [31] 15.0 21.4

``` r
cars[17,]
```

    ##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
    ## Chrysler Imperial 14.7   8  440 230 3.23 5.345 17.42  0  0    3    4

# Data Import/Export

``` r
mydata <- read.csv("data_input/Example01.csv")
mydata
```

    ##   Strain Media Bio.1 Bio.2 Bio.3 Bio.4
    ## 1     WT   TSB 0.305 0.320 0.304 0.315
    ## 2   MutA   TSB 0.161 0.156 0.171 0.187
    ## 3   MutB   TSB 0.285 0.297 0.279 0.277
    ## 4  MutAB   TSB 0.020 0.023 0.015 0.028
    ## 5     WT   CDM 0.210 0.226 0.201 0.219
    ## 6   MutA   CDM 0.059 0.055 0.073 0.085
    ## 7   MutB   CDM 0.061 0.053 0.080 0.086
    ## 8  MutAB   CDM 0.010 0.004 0.025 0.020

``` r
mydata$Average <-rowMeans(mydata[c("Bio.1", "Bio.2", "Bio.3","Bio.4")])
```

``` r
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.2     ✔ readr     2.1.4
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.4.2     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ## ✔ purrr     1.0.1     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
write_csv(mydata, "data_output/Example01_Edited.csv")
```

``` r
write_rds(mydata, "data_output/Example01_Edited.rds")
mydata_Edited <- read_rds("data_output/Example01_Edited.rds")
```

# Learn more here

<https://r4ds.had.co.nz>

<https://rstudio.com/resources/cheatsheets/>
