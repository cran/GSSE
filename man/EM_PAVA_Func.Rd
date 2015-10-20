\name{EM_PAVA_Func}
\alias{EM_PAVA_Func}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
EM-PAVA function
}
\description{
This function is used to estimate the genotype-specific distribution of time-to-event outcomes using EM-PAVA algorithm (Qin et al. 2014).
}
\usage{
EM_PAVA_Func (q, x, delta, timeval, p, ep = 1e-05, maxiter = 400)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{q}{matrix of 2 columns, where the first and second columns are the probabilities of belonging to the carrier \code{p0G} and non-carrier groups \code{1 - p0G}, respectively.}
  \item{x}{observed event time or censoring time.}
  \item{delta}{indicator of event.}
  \item{timeval}{grid points at which the distribution function values are estimated.}
  \item{p}{number of groups.}
  \item{ep}{convergence criterion. Here, \code{ep = 1e-5} is used as the default value.}
  \item{maxiter}{maximum number of EM iterations. }
}

\details{
 Technical details can be found in Qin et al. (2014).
}
\value{
Returns a list of prediction values for classes
	\item{Fest}{estimated values at the points of \code{timeval}.}
	\item{Fest.all}{estimated values of cumulative distribution function on both carrier and non-carrier groups.}
}
\references{
Qin, J., Garcia, T., Ma, Y., Tang, M., Marder, K. & Wang, Y. (2014). Combining isotonic regression and EM algorithm to predict genetic risk under monotonicity constraint. \emph{The Annals of Applied Statistics} \bold{8}(2), 1182-1208.
}

\seealso{ \code{\link{p0G_Func}()}, \code{\link{Sieve_NPMLE_Switch}()} }
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

Grid = seq(0.01, 3.65, 0.01);
fix_t1 = c(0.288, 0.693, 1.390);
fix_t2 = c(0.779, 1.860, 3.650);

EMpava_result = EM_PAVA_Func ( q = rbind(p0G,1-p0G), x = Y, delta = Delta, 
                               timeval = Grid, p = 2, ep = 1e-4 );

all = sort(c(Grid, Y));

F_carr_func = function(x){  EMpava_result$Fest.all[1, which.max(all[all <= x]) ]  };
F_non_func  = function(x){  EMpava_result$Fest.all[2, which.max(all[all <= x]) ]  };

PAVA_F1.hat_fix_t = apply( matrix(fix_t1, ncol=1), 1, F_carr_func );
PAVA_F2.hat_fix_t = apply( matrix(fix_t2, ncol=1), 1, F_non_func );

PAVA_F.hat_fix_t = data.frame( fix_t1 = fix_t1, PAVA_F1.hat = PAVA_F1.hat_fix_t,
                               fix_t2 = fix_t2, PAVA_F2.hat = PAVA_F2.hat_fix_t  );

print(PAVA_F.hat_fix_t);

# plot estimated curves

F_carr = apply( matrix(Grid, ncol=1), 1, F_carr_func );
F_non = apply( matrix(Grid, ncol=1), 1, F_non_func );

plot( Grid, F_carr, type = 's', lty = 1, 
      xlab = "Y", ylab = "Estimated Cumulative Distribution Function",
      ylim = c(0,1), col = 'blue' );
lines(Grid, F_non, type='s', lty=2, col='red');
legend("topleft", legend=c("Carrier group", "Non-Carrier group"),
       lty=c(1,2), col=c("blue", "red") );

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
