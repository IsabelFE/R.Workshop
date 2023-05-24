Introduction to R
================
Escapa I.F.
2023-05-24

<br></br> <br></br>

# R Studio

Download from <https://posit.co/download/rstudio-desktop/>

R Studio is an IDE (Integrated development environment) for R

- console
- script window
- workspace (environment)
- lower right window:
  - file directory
  - packages
  - help
  - plots

# Using Python on RStudio (Advanced)

Markdown files on RStudio can be used as Project Notebooks even with
code in other languages (Python, Perl…).

This installs the devtools version of the reticulate package
<https://rstudio.github.io/reticulate/index.html>:

``` r
if (!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
(devtools::install_github("rstudio/reticulate"))
```

In order to use your desired Python environment you need to define the
path in the .Rprofile for the project.

``` r
file.edit(".Rprofile")
```

In the opened .Rprofile file paste this: Sys.setenv(RETICULATE_PYTHON =
“/opt/miniconda3/bin/python”)

You should substitute the path to your own Python environment in your
computer. If you don’t know the path, open the Terminal, activate your
desired Python environment and use **which python** to find the path.

You need to run this chunk of code at the begging of each .Rmd file in
your project

``` r
#Sys.getenv("RETICULATE_PYTHON") #This forces R to search in the path we set up in the .Rprofile  
library(reticulate)
py_config() #This is to see what python is being used. It should be your desired environment
```

    ## python:         /Users/isabelfe/miniconda3/bin/python
    ## libpython:      /Users/isabelfe/miniconda3/lib/libpython3.10.dylib
    ## pythonhome:     /Users/isabelfe/miniconda3:/Users/isabelfe/miniconda3
    ## version:        3.10.11 | packaged by conda-forge | (main, May 10 2023, 19:01:19) [Clang 14.0.6 ]
    ## numpy:           [NOT FOUND]
    ## 
    ## NOTE: Python version was forced by RETICULATE_PYTHON_FALLBACK

Now you can run in the document several types of code chunks:

- R code using {r}

``` r
R.Version()$version.string
```

    ## [1] "R version 4.3.0 (2023-04-21)"

- Python code (with your desired Python environment activated) using
  {bash}

``` bash
which python
```

    ## /Users/isabelfe/miniconda3/bin/python

This Python code is not interactive, you cannot run commands that
require you to interact during their execution. If you want to use
Python interactively use this function to start a Python session in the
Console:

``` r
repl_python()
```

You can also just run code interactively on the RStudio Terminal.
