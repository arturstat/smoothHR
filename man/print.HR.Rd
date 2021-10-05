\encoding{UTF-8}
\name{print.HR}
\alias{print.HR}
\title{print method for a Smooth Hazard Ratio Object}
\description{
	This class of objects is returned by the HR class of functions to represent smooth hazard ratio curve.
	Objects of this class have methods for \code{print}, \code{predict} and \code{plot}.
}
\usage{\method{print}{HR}(x, ...)}

\arguments{
	\item{x}{An object of class HR.}
	\item{\dots}{Other arguments.}
}

%\details{
%%  ~~ If necessary, more details than the description above ~~
%}

\value{No value is returned.}

\author{Artur Araújo and Luís Meira-Machado}

\references{
Meira-Machado, L. and Cadarso-Suárez, C. and Gude, F. and Araújo, A. (2013). smoothHR: An R Package for Pointwise Nonparametric Estimation of Hazard Ratio Curves of Continuous Predictors, \emph{Computational and Mathematical Methods in Medicine}, \bold{2013}, Article ID 745742, 11 pages. \href{https://dx.doi.org/10.1155/2013/745742}{doi:10.1155/2013/745742}
}

%\note{   %%  ~~further notes~~  %}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
	\code{\link{smoothHR}}.
}

\examples{
# Example 1
library(survival)
data(whas500)
fit <- coxph(Surv(lenfol, fstat)~age+hr+gender+diasbp+pspline(bmi)+pspline(los),
data=whas500, x=TRUE)
hr1 <- smoothHR(data=whas500, coxfit=fit)
print(hr1)

# Example 2
hr2 <- smoothHR( data=whas500, time="lenfol", status="fstat", formula=~age+hr+gender+diasbp+
pspline(bmi)+pspline(los) )
print(hr2)
}

\keyword{methods}
\keyword{print}
\keyword{survival}
