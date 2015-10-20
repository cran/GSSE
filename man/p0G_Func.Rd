\name{p0G_Func}
\alias{p0G_Func}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Probability Calculation of Relative's Mutation Status
}
\description{
This function is used to calculate the probability of a relative being a carrier.
}
\usage{
p0G_Func (p, status, relative, model)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{p}{population frequency of mutation.}
  \item{status}{proband's carrier status (\code{status} = 0, non-carrier; = 1, homozygous; = 2, heterozygous).}
  \item{relative}{relative's relationship to the proband (\code{relative} = 1, parents; = 2, sibling; = 3, offspring). }
  \item{model}{assumed genetic model ("dominant" or "recessive").}
}

\details{
 Technical details can be found in Wang et al. (2008).
}
\value{
The function \code{p0G_Func} returns the probability of a relative being a carrier under the given genetic model.
}
\references{
Wang, Y., Clark, L. N., Louis, E. D., Mejia-Santana, H., Harris, J., Cote, L. J., ... & Marder, K. (2008). Risk of Parkinson disease in carriers of parkin mutations: estimation using the kin-cohort method. \emph{Archives of neurology}, \bold{65}(4), 467-474.

Wang, Y., Liang, B., Tong, X., Marder, K., Bressman, S., Orr-Urtreger, A., Giladi, N. & Zeng, D. (2015). Efficient estimation of nonparametric genetic risk function with censored data. \emph{Biometrika}, \bold{102}(3), 515-532.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~
\seealso{ \code{\link{p0G_data}}, \code{\link{Sieve_NPMLE_Switch}()}, \code{\link{Sieve_NPMLE_Bootstrap}()}, \code{\link{EM_PAVA_Func}()} and

\code{\link{Permutation_Test}()}. }

\examples{

#  Example 1  #

 data("p0G_data");
 attach(p0G_data);

 n = dim(p0G_data)[1];
 Status = as.numeric( proband_pd == "Yes" );
 Relative = rep(1, n) + 1*(relative == "Sibling") + 2*(relative == "Child");

 detach(p0G_data);

 p0G = rep(0, n);

 for(i in 1:n)
 {
  p0G[i] = p0G_Func(p = 0.02, status = Status[i], relative = Relative[i], model="dominant");
 }

 data.frame(pd_status = Status, relatives = Relative, prob = p0G);

#  Example 2  #

 n = 50;
 status = sample(x=c(0,1), size = n, replace = TRUE, prob = c(0.6, 0.4) );
 relative = sample(x=1:3, size = n, replace = TRUE, prob = c(1/3, 1/3, 1/3) );

 p0G = rep(0, n);

 for(i in 1:n)
 {
  p0G[i] = p0G_Func(p = 0.2, status = status[i], relative = relative[i], model="dominant");
 }

 data.frame(status = status, relative = relative, p0G = p0G);

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
