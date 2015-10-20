\name{p0G_data}
\alias{p0G_data}
\docType{data}
\title{
Data Set for Illustration of the `p0G' Calculation
}
\description{
This is a small data set used for illustration of the `p0G' calculation. There are 2 columns, 20 rows in this data set.
}
\usage{data("p0G_data")}
\format{
  A data frame with 20 observations on the following 2 columns with
  \describe{
    \item{\code{relative}}{a factor with levels \code{Child}, \code{Parent} and \code{Sibling},}
    \item{\code{proband_pd}}{a factor with levels \code{No} and \code{Yes}.}
  }
}

\source{
This data set is a tiny subset of the data set of a Parkinson disease research project supported by Michael J. Fox Foundation.
}
\references{

Wang, Y., Clark, L. N., Louis, E. D., Mejia-Santana, H., Harris, J., Cote, L. J., ... & Marder, K. (2008). Risk of Parkinson disease in carriers of parkin mutations: estimation using the kin-cohort method. \emph{Archives of neurology}, \bold{65}(4), 467-474.

Wang, Y., Liang, B., Tong, X., Marder, K., Bressman, S., Orr-Urtreger, A., Giladi, N. & Zeng, D. (2015). Efficient estimation of nonparametric genetic risk function with censored data. \emph{Biometrika}, \bold{102}(3), 515-532.

}

\seealso{ \code{\link{p0G_Func}()} }

\examples{
data("p0G_data")
}
\keyword{datasets}
