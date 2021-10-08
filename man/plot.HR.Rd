\encoding{UTF-8}
\name{plot.HR}
\alias{plot.HR}
\title{Flexible hazard ratio curves taking a specific covariate value as reference}
\description{Plots flexible hazard ratio curves allowing non-linear relationships between continuous predictors and survival.
To better understand the effects that each continuous covariate has on the outcome, results are expressed in terms of hazard ratio curves,
taking a specific covariate value as reference. Confidence bands for these curves are also derived.
}
\usage{\method{plot}{HR}(x, predictor, prob=NULL, pred.value=NULL, conf.level=0.95, round.x=NULL,
ref.label=NULL, col, main, xlab, ylab, lty, xlim, ylim, xx, ...)}

\arguments{
	\item{x}{An object of class HR}
	\item{predictor}{Variable named in the formula or included as a predictor in the \code{coxfit}.
		Usually a continuous predictor of survival for which the results are expressed in terms of hazard ratio curves,
		taking a specific covariate value as reference.}
	\item{prob}{Value between 0 and 1. If \code{prob=0} the reference value will be the minimum of the hazard ratio curve.
		If \code{prob=1} the reference value will be the maximum of the hazard ratio curve.
		For values between 0 and 1 the reference value will be the corresponding quantile of the variable \code{predictor}.}
	\item{pred.value}{Value from the variable \code{predictor} to be taken as the reference value.}
	\item{conf.level}{Level of confidence. Defaults to 0.95 (corresponding to 95\%).}
	\item{round.x}{Rounding of numbers in the plot.}
	\item{ref.label}{Label for the reference covariate. By default is the name of the covariate.}
	\item{col}{Vector of dimension 3 for the colors to plot.}
	\item{main}{These arguments to title have useful defaults here.}
	\item{xlab}{The range of x and y values with sensible defaults.}
	\item{ylab}{The range of x and y values with sensible defaults.}
	\item{lty}{Vector of dimension 2 for the line type.}
	\item{xlim}{The range of x and y values with sensible defaults.}
	\item{ylim}{The range of x and y values with sensible defaults.}
	\item{xx}{Vector of values (from the variable \code{predictor}) to be shown in the x axis.}
	\item{\dots}{Other arguments.}
}

%\details{
%%  ~~ If necessary, more details than the description above ~~
%}

\value{No value is returned.}

\author{Artur Araújo and Luís Meira-Machado}

\references{
Cadarso-Suarez, C. and Meira-Machado, L. and Kneib, T. and Gude, F. (2010). Flexible hazard ratio curves for continuous predictors in multi-state models: an application to breast cancer data. \emph{Statistical Modelling}, \bold{10}(3), 291-314. \doi{10.1177/1471082X0801000303}

Meira-Machado, L. and Cadarso-Suárez, C. and Gude, F. and Araújo, A. (2013). smoothHR: An R Package for Pointwise Nonparametric Estimation of Hazard Ratio Curves of Continuous Predictors, \emph{Computational and Mathematical Methods in Medicine}, \bold{2013}, 11 pages. \doi{10.1155/2013/745742}
}

%\note{
%%  ~~further notes~~
%}

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
plot(hr1, predictor="bmi", prob=0, conf.level=0.95)

# Example 2
hr2 <- smoothHR( data=whas500, time="lenfol", status="fstat", formula=~age+hr+gender+diasbp+
pspline(bmi)+pspline(los) )
plot(hr2, predictor="los", pred.value=7, conf.level=0.95, xlim=c(0,30), round.x=1,
ref.label="Ref.", xaxt="n")
xx <- c(0, 5, 10, 15, 20, 25, 30)
axis(1, xx)
}

\keyword{hplot}
\keyword{methods}
\keyword{survival}
