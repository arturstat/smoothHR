# smoothHR
Smooth Hazard Ratio Curves Taking a Reference Value.

## Description
Provides flexible hazard ratio curves allowing non-linear relationships between continuous predictors and survival. To better understand the effects that each continuous covariate has on the outcome, results are expressed in terms of hazard ratio curves, taking a specific covariate value as reference. Confidence bands for these curves are also derived.

## Installation
If you want to use the release version of the **smoothHR** package, you can install the package from CRAN as follows:
```r
install.packages(pkgs="smoothHR");
```
If you want to use the development version of the **smoothHR** package, you can install the package from GitHub via the [**remotes**](https://remotes.r-lib.org) package:
```r
remotes::install_github(
  repo="arturstat/smoothHR",
  build=TRUE,
  build_manual=TRUE
);
```

## Authors
Artur Araújo and Luís Meira-Machado <lmachado@math.uminho.pt> \
Maintainer: Artur Araújo <artur.stat@gmail.com>

## Funding
This research was financed by **FEDER** Funds through *Programa Operacional Factores de Competitividade* -- **COMPETE**; by Portuguese Funds through **FCT** -- *Fundação para a Ciência e a Tecnologia*, in the form of grants PTDC/MAT/104879/2008 and Est-C/MAT/UI0013/2011; and by the Spanish Ministry of Industry and Innovation, Grant MTM2011-28285-C02-01.

## References
Cadarso-Suarez, C. and Meira-Machado, L. and Kneib, T. and Gude, F. (2010). Flexible hazard ratio curves for continuous predictors in multi-state models: an application to breast cancer data. *Statistical Modelling*, **10**(3), 291-314. [doi:10.1177/1471082X0801000303](https://doi.org/10.1177/1471082X0801000303)

Eilers, Paul H. and Marx, Brian D. (1996). Flexible smoothing with B-splines and penalties. *Statistical Science*, **11**(2), 89-121. [doi:10.1214/ss/1038425655](https://doi.org/10.1214/ss/1038425655)

Hosmer, D. W. and Lemeshow, S. and May, S. (2008). *Applied Survival Analysis: Regression Modeling of Time to Event Data: Second Edition*, John Wiley and Sons Inc., New York, NY.

Hurvich, C. M. and Simonoff, J. S. and Tsai, Chih-Ling (1998). Smoothing parameter selection in nonparametric regression using an improved Akaike information criterion. *JRSSB*, **60**(2), 271–293. [doi:10.1111/1467-9868.00125](https://doi.org/10.1111/1467-9868.00125)

Meira-Machado, L. and Cadarso-Suárez, C. and Gude, F. and Araújo, A. (2013). smoothHR: An R Package for Pointwise Nonparametric Estimation of Hazard Ratio Curves of Continuous Predictors. *Computational and Mathematical Methods in Medicine*, **2013**, 11 pages. [doi:10.1155/2013/745742](https://doi.org/10.1155/2013/745742)
