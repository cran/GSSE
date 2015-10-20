\name{GSSE-package}
\alias{GSSE-package}
\alias{GSSE}
\docType{package}

\title{
Genotype-Specific Survival Estimation
}

\description{
The package `GSSE' (Genotype-Specific Survival Estimation) is made to implement a fully efficient sieve maximum likelihood method to estimate genotype-specific distribution of time-to-event outcomes under a nonparametric model. The package can handle missing genotypes in pedigrees.  We estimate time-dependent hazard ratio between two genetic mutation groups using B-splines and apply nonparametric maximum likelihood estimation to the reference baseline hazard function. The estimators are calculated via an expectation-maximization algorithm.
}

\details{
\tabular{ll}{
Package: \tab GSSE\cr
Type: \tab Package\cr
Version: \tab 0.1\cr
Date: \tab 2015-10-17\cr
License: \tab GPL (>= 2)\cr
}

The main function is \code{\link{Sieve_NPMLE_Switch}()}. See the documentation file with examples.
}

\author{
Baosheng Liang <liangbsunc@gmail.com>, Yuanjia Wang <yw2016@cumc.columbia.edu> and Donglin Zeng <dzeng@email.unc.edu>

Maintainer: Baosheng Liang <liangbsunc@gmail.com>
}

\references{
Wang, Y., Clark, L. N., Louis, E. D., Mejia-Santana, H., Harris, J., Cote, L. J., ... & Marder, K. (2008). Risk of Parkinson disease in carriers of parkin mutations: estimation using the kin-cohort method. \emph{Archives of neurology}, \bold{65}(4), 467-474.

Qin, J., Garcia, T., Ma, Y., Tang, M., Marder, K. & Wang, Y. (2014). Combining isotonic regression and EM algorithm to predict genetic risk under monotonicity constraint. \emph{The Annals of Applied Statistics} \bold{8}(2), 1182-1208.

Wang, Y., Liang, B., Tong, X., Marder, K., Bressman, S., Orr-Urtreger, A., Giladi, N. & Zeng, D. (2015). Efficient estimation of nonparametric genetic risk function with censored data. \emph{Biometrika}, \bold{102}(3), 515-532.
}

\keyword{ package }

