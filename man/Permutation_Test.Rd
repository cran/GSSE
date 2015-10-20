\name{Permutation_Test}
\alias{Permutation_Test}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Permutation Test
}
\description{
Permutation test for the Sieve-NPMLE switch method with null hypothesis \eqn{H_0}: F_carr = F_non and alternative hypothesis \eqn{H_1}: F_carr is not equal to F_non.
}
\usage{
Permutation_Test (Grid, F_carr, F_non, OY, ODelta, Op0G, nperm)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Grid}{time points at which the distribution function values are estimated.}
  \item{F_carr}{a vector of distribution function values at given grid points of the carrier group.}
  \item{F_non}{a vector of distribution function values at given grid points of the non-carrier group.}
  \item{OY}{observed event times.}
  \item{ODelta}{observed indicators of right censoring. }
  \item{Op0G}{observed probability values of carrier and non-carrier groups.}
  \item{nperm}{replication number used in permutation.}
}

\details{
 Technical details can be found in Wang et al. (2015).
}
\value{
This function returns a list of prediction values for classes,
	\item{Test_Stat}{value of the Kolmogorov-Smirnov statistic with observed data.}
	\item{Pvalues}{p-value of the permutation test.}
  \item{Permutation.value}{values of Kolmogorov-Smirnov statistics under all permutations.}
}
\references{
Wang, Y., Liang, B., Tong, X., Marder, K., Bressman, S., Orr-Urtreger, A., Giladi, N. & Zeng, D. (2015). Efficient estimation of nonparametric genetic risk function with censored data. \emph{Biometrika}, \bold{102}(3), 515-532.
}

\seealso{ \code{\link{test_stat}()} and \code{\link{Sieve_NPMLE_Switch}()}. }

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{

data("Simulated_data");

OY = Simulated_data[,2];
ind = order(OY);
ODelta = Simulated_data[,3];
Op0G = Simulated_data[,4];

Y = OY[ind];
Delta = ODelta[ind];
p0G = Op0G[ind];

Grid = seq(0.2, 3.65, 0.05);
fix_t1 = c(0.288, 0.693, 1.390);
fix_t2 = c(0.779, 1.860, 3.650);
px = seq(0.1, 3, 0.1);

SieveNPMLE_result = Sieve_NPMLE_Switch( Y=Y, Delta=Delta, p0G=p0G,
                                        px=px, Grid=Grid, Knot=7,
                                        degree=3 );

Lambda_1.hat = cumsum( SieveNPMLE_result$lamb1.hat );
Lambda_2.hat = cumsum( SieveNPMLE_result$lamb2.hat );

F_carr_func = function(x){ 1 - exp( max( Lambda_1.hat[Y <= x] ) ) }
F_non_func  = function(x){ 1 - exp( max( Lambda_2.hat[Y <= x] ) ) }

F_carr = apply( matrix(px, ncol=1), 1, F_carr_func );
F_non = apply( matrix(px, ncol=1), 1, F_non_func );

# Permutation test #

Permutation_Test( Grid=Grid, F_carr=F_carr, F_non=F_non,
                  OY=OY, ODelta=ODelta, Op0G=Op0G,
                  nperm=10 );

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
