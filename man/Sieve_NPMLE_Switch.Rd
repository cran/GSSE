\name{Sieve_NPMLE_Switch}
\alias{Sieve_NPMLE_Switch}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Sieve_NPMLE_Switch function
}
\description{
This function is used to estimate the genotype-specific distribution of time-to-event outcomes with the Sieve-NPMLE switch algorithm.
}
\usage{
Sieve_NPMLE_Switch (Y, p0G, Delta, px, Grid, Knot, degree, maxiter=400, ep=1e-05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{observed event times or censoring times.}
  \item{p0G}{probabilities of being a carrier.}
  \item{Delta}{indicators of event.}
  \item{px}{grid points at which the distribution function values are estimated.}
  \item{Grid}{grid points used for plots. \code{Grid} could be either exactly the same as \code{px} or different from \code{px}. }
  \item{Knot}{number of knots.}
  \item{degree}{degree of the B-spline base functions.}
  \item{maxiter}{maximum number of iterations.}
  \item{ep}{convergence criterion, default is \code{ep= 1e-05}.}
}

\details{
This function is used to estimate the distribution of the age-at-onset of Parkinsons disease for carriers' and non-carriers' mutations in the leucine-rich repeat kinase 2, LRRK2, gene. Please refer to Wang et al. (2015) for more details.
}

\value{
This function returns a list of prediction values for classes
  \item{lamb1.hat}{estimated values of hazard function for the carrier group.}
  \item{lamb2.hat}{estimated values of hazard function for the non-carrier group.}
  \item{Lamb1}{estimated values of cumulative hazard function for the carrier group.}
  \item{Lamb2}{estimated values of cumulative hazard function for the non-carrier group.}
  \item{Converge}{convergence status.}

}

\references{
Wang, Y., Liang, B., Tong, X., Marder, K., Bressman, S., Orr-Urtreger, A., Giladi, N. & Zeng, D. (2015). Efficient estimation of nonparametric genetic risk function with censored data. \emph{Biometrika}, \bold{102}(3), 515-532.
}

%% ~Make other sections like Warning with \section{Warning}{....} ~
\seealso{ \code{\link{p0G_Func}()}, \code{\link{Sieve_NPMLE_Bootstrap}()} and \code{\link{Permutation_Test}()}. }

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
px = seq(0.01, 3.65, 0.01);

SieveNPMLE_result = Sieve_NPMLE_Switch( Y=Y, Delta=Delta, p0G=p0G,
                                        px=px, Grid=Grid,
                                        Knot=6, degree=3  );

# 'Sieve_NPMLE_Switch' only returns values of hazard function 
# or cumulative hazard function of mutation groups, in practice, we only 
# need to do a little bit more as follows for calculating the 
# cumulative distribution values of mutation groups. 

Lambda_1.hat = cumsum( SieveNPMLE_result$lamb1.hat );
Lambda_2.hat = cumsum( SieveNPMLE_result$lamb2.hat );

F_carr_func = function(x){ 1 - exp(- max( Lambda_1.hat[Y <= x] ) ) }
F_non_func  = function(x){ 1 - exp(- max( Lambda_2.hat[Y <= x] ) ) }

est.f1 = apply(matrix(fix_t1, ncol=1), 1, F_carr_func );
est.f2 = apply(matrix(fix_t2, ncol=1), 1, F_non_func  );

estp = data.frame( fix_t1 = fix_t1, F_carr_t1 = est.f1,
                   fix_t2 = fix_t2, F_non_t2 = est.f2  );

print(estp);

# plot estimated curves

F_carr = apply( matrix(px, ncol=1), 1, F_carr_func );
F_non = apply( matrix(px, ncol=1), 1, F_non_func );

plot( px, F_carr, type='s', lty=1, ylim=c(0, 1), xlab="Y",
      ylab="Estimated Cumulative Distribution Function", col='blue' );
lines(px, F_non, type='s', lty=2, col='red');
legend("topleft", legend=c("Carrier group", "Non-Carrier group"),
       lty=c(1,2), col=c("blue","red") );

}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
