\encoding{UTF-8}
\name{predict.HR}
\alias{predict.HR}
\title{predict method for an object of class 'HR'.}
\description{predict method for an object of class 'HR'.}
\usage{\method{predict}{HR}(object, predictor, prob=NULL, pred.value=NULL, conf.level=0.95,
prediction.values=NULL, round.x=NULL, ref.label=NULL, ...)}

\arguments{
	\item{object}{An object of class HR.}
	\item{predictor}{Variable named in the formula or included as a predictor in the \code{coxfit}.
		Usually a continuous predictor of survival for which the results are expressed in terms of hazard ratio curves,
		taking a specific covariate value as reference.}
	\item{prob}{Value between 0 and 1. If \code{prob=0} the reference value will be the minimum of the hazard ratio curve.
		If \code{prob=1} the reference value will be the maximum of the hazard ratio curve.
		For values between 0 and 1 the reference value will be the corresponding quantile of the variable \code{predictor}.}
	\item{pred.value}{Value from the variable \code{predictor} to be taken as the reference value.}
	\item{conf.level}{Level of confidence. Defaults to 0.95 (corresponding to 95\%).}
	\item{prediction.values}{Vector of values ranging between minimum and maximum of the variable \code{predictor}.}
	\item{round.x}{Rounding of numbers in the predict.}
	\item{ref.label}{Label for the reference covariate. By default is the name of the covariate.}
	\item{\dots}{Other arguments.}
}

%\details{
%%  ~~ If necessary, more details than the description above ~~
%}

\value{Returns a matrix with the prediction values.}

\author{Artur Araújo and Luís Meira-Machado}

\references{
Cadarso-Suarez, C. and Meira-Machado, L. and Kneib, T. and Gude, F. (2010). Flexible hazard ratio curves for continuous predictors in multi-state models: an application to breast cancer data. \emph{Statistical Modelling}, \bold{10(3)}, 291-314. \href{https://dx.doi.org/10.1177/1471082X0801000303}{doi:10.1177/1471082X0801000303}

Meira-Machado, L. and Cadarso-Suárez, C. and Gude, F. and Araújo, A. (2013). smoothHR: An R Package for Pointwise Nonparametric Estimation of Hazard Ratio Curves of Continuous Predictors, \emph{Computational and Mathematical Methods in Medicine}, \bold{2013}, Article ID 745742, 11 pages. \href{https://dx.doi.org/10.1155/2013/745742}{doi:10.1155/2013/745742}
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
predict(hr1, predictor="bmi", prob=0, conf.level=0.95)

# Example 2
hr2 <- smoothHR( data=whas500, time="lenfol", status="fstat", formula=~age+hr+gender+diasbp+
pspline(bmi)+pspline(los) )
pdval <- c(1, 2, 3, 4, 5, 6, 7, 8, 10, 12, 15, 18, 22, 25)
predict(hr2, predictor="los", pred.value=7, conf.level=0.95, prediction.values=pdval,
ref.label="Ref.")
}

\keyword{methods}
\keyword{survival}
