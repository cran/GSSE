\name{test_stat}
\alias{test_stat}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Kolmogorov-Smirnov Test Statistic
}
\description{
This function is used to calculate the Kolmogorov-Smirnov statistic: \eqn{ D(F_1, F_2) = \sup_{x}|F_1(x) - F_2(x)| }.
}
\usage{
test_stat (F1, F2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{F1 }{vector of one distribution function value.}
  \item{F2 }{vector of the other distribution function value.}
}

\details{
 It is necessary to point out that \code{F1} and \code{F2} are based on common grids. Other technical details can be found in Wang et al. (2015). 
}
\value{
This function returns a list of prediction values for classes, 
	\item{out }{value of Kolmogorov-Smirnov statistics.}
}
\references{
Wang, Y., Liang, B., Tong, X., Marder, K., Bressman, S., Orr-Urtreger, A., Giladi, N. & Zeng, D. (2015). Efficient estimation of nonparametric genetic risk function with censored data. \emph{Biometrika}, \bold{102}(3), 515-532.
}

\seealso{ \code{\link{Permutation_Test}()} }
%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{

 X = seq(0.01, 1, 0.05);
 Func_1 = function(x){ x + runif(length(x), min=0, max=1) };
 Func_2 = function(x){ x + 2*runif(length(x), min=0, max=1) };
 
 U1 = Func_1(X);
 U2 = Func_2(X);
 
 test_stat (F1 = U1, F2 = U2);

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
