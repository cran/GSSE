\name{Sieve_NPMLE_Bootstrap}
\alias{Sieve_NPMLE_Bootstrap}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Sieve_NPMLE_Bootstrap function
}
\description{
This function is used for calculating standard error estimates and 95\% confidence bands in quantile using the bootstrap method.
}
\usage{
Sieve_NPMLE_Bootstrap ( fam_ID, Y0, Delta0, p0G0, fix_t1, fix_t2,
                        Grid, Knot, degree=3, Bn, maxiter=400, ep=1e-05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{fam_ID}{family ID numbers.}
  \item{Y0}{observed event times or censoring times.}
  \item{Delta0}{indicators of event.}
  \item{p0G0}{probabilities of being a carrier.}
  \item{fix_t1}{a vector of fixed points at which the carrier's cumulative distribution function values are estimated. }
  \item{fix_t2}{a vector of fixed points at which the non-carrier's cumulative distribution function values are estimated. }
  \item{Grid}{a vector of grid points used for plotting the estimated distribution functions of carrier and non-carrier groups. }
  \item{Knot}{number of knots of the B-spline base functions. }
  \item{degree}{degree of the B-spline base functions. }
  \item{Bn}{number of bootstrap samples. }
  \item{maxiter}{maximum number of iterations.}
  \item{ep}{convergence criterion, default is ep= 1e-05.}
}

\details{
Using bootstrap for standard error estimation and 95\% confidence bands calculation. We do the Bootstrap resample according to \code{fam_ID}. 
}
\value{
This function returns a list
  \item{Boot.L1}{estimated cumulative hazard function for the carrier group.}
  \item{Boot.L2}{estimated cumulative hazard function for the non-carrier group.}
  \item{SE_F1_fix_t}{estimated standard errors for the carrier group at given points \code{fix_t1}.}
  \item{SE_F2_fix_t}{estimated standard errors for the non-carrier group at given points \code{fix_t2}.}

}
\references{
Wang, Y., Liang, B., Tong, X., Marder, K., Bressman, S., Orr-Urtreger, A., Giladi, N. & Zeng, D. (2015). Efficient estimation of nonparametric genetic risk function with censored data. \emph{Biometrika}, \bold{102}(3), 515-532.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{ \code{\link{p0G_Func}()}, \code{\link{Sieve_NPMLE_Switch}()}. }

\examples{

data("Simulated_data");

OID = Simulated_data[,1];
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

SieveNPMLE_result = Sieve_NPMLE_Switch( Y=Y, Delta=Delta, p0G=p0G, px=px,
                                        Grid=Grid, Knot=7, degree=3  );

Lambda_1.hat = cumsum( SieveNPMLE_result$lamb1.hat );
Lambda_2.hat = cumsum( SieveNPMLE_result$lamb2.hat );

F_carr_func = function(x){ 1 - exp( - max( Lambda_1.hat[Y <= x] ) ) }
F_non_func  = function(x){ 1 - exp( - max( Lambda_2.hat[Y <= x] ) ) }

est.f1 = apply(matrix(fix_t1, ncol=1), 1, F_carr_func );
est.f2 = apply(matrix(fix_t2, ncol=1), 1, F_non_func  );

# ---------------- #
#    Bootstrap     #
# ---------------- #

 Boot = Sieve_NPMLE_Bootstrap( fam_ID=OID, Y0=OY, Delta0=ODelta, p0G0=Op0G,
                               fix_t1=fix_t1, fix_t2=fix_t2, Grid = Grid,
                               Knot=6, degree =3, Bn=10  );

 SE1 = Boot$SE_F1_fix_t;
 SE2 = Boot$SE_F2_fix_t;

 estp = data.frame( fix_t1 = fix_t1, F1.hat = est.f1, SE_F1 = SE1,
                    fix_t2 = fix_t2, F2.hat = est.f2, SE_F2 = SE2  );

 print(estp)

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
