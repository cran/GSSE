\name{Simulated_data}
\alias{Simulated_data}
\docType{data}
\title{
  Simulated Parkinson's disease data
}
\description{
This is an artificial data set used for the illustration of the current R-package. There are 4 columns, 268 rows in this data set.
}
\usage{data("Simulated_data")}
\format{
  A data frame with 268 observations on the following 4 columns with.
  \describe{
    \item{\code{FamID}}{a factor with levels \code{Child}, \code{Parent} and \code{Sibling}}
    \item{\code{Y}}{a factor with levels \code{No} and \code{Yes}}
    \item{\code{delta}}{a numeric vector}
    \item{\code{p0G}}{a numeric vector, probability distribution value.}
  }
}

\source{
This is a simulated data set based on  the real data analysis results in Wang et al. (2015).
}
\references{
Wang, Y., Liang, B., Tong, X., Marder, K., Bressman, S., Orr-Urtreger, A., Giladi, N. & Zeng, D. (2015). Efficient estimation of nonparametric genetic risk function with censored data. \emph{Biometrika}, \bold{102}(3), 515-532.

Marder, K., Wang, Y., Alcalay, R. N., Mejia-Santana, H., Tang, M. X., Lee, A., ... & Miravite, J. (2015). Age-specific penetrance of LRRK2 G2019S in the Michael J. Fox Ashkenazi Jewish LRRK2 Consortium. \emph{Neurology}, \bold{85}(1), 89--95.

Qin, J., Garcia, T., Ma, Y., Tang, M., Marder, K. & Wang, Y. (2014). Combining isotonic regression and EM algorithm to predict genetic risk under monotonicity constraint. \emph{The Annals of Applied Statistics} \bold{8}(2), 1182-1208.
}

\seealso{ \code{\link{Sieve_NPMLE_Switch}()}, \code{\link{Sieve_NPMLE_Bootstrap}()}, \code{\link{EM_PAVA_Func}()}. }
\examples{
data("Simulated_data")
}

\keyword{datasets}
