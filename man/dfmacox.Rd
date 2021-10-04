\encoding{UTF-8}
\name{dfmacox}
\alias{dfmacox}
\title{Degrees of freedom in multivariate additive Cox models}
\description{Provides the degrees of freedom for flexible continuous covariates in multivariate additive Cox models.}
\usage{dfmacox(time, time2=NULL, status, nl.predictors, other.predictors,
smoother, method, mindf=NULL, maxdf=NULL, ntimes=NULL, data)}

\arguments{
	\item{time}{For right censored data, this is the follow up time. For interval data, the first argument is the starting time for the interval.}
	\item{time2}{Ending time of the interval for interval censored or counting process data only.
		Intervals are assumed to be open on the left and closed on the right, (start, end].
		For counting process data, event indicates whether an event occurred at the end of the interval.}
	\item{status}{The status indicator, normally 0=alive, 1=dead. Other choices are TRUE/FALSE (TRUE = death) or 1/2 (2=death).
		For interval censored data, the status indicator is 0=right censored, 1=event at time, 2=left censored, 3=interval censored.
		Although unusual, the event indicator can be omitted, in which case all subjects are assumed to have an event.}
	\item{nl.predictors}{Vector with covariates to be introduced in the additive Cox model with a nonlinear effect.}
	\item{other.predictors}{Vector with remaining covariates to be introduced in the additive Cox model.
		This will include qualitative covariates or continuous covariates with a linear effect.}
	\item{smoother}{Smoothing method to be used in the additive Cox model.
		Possible options are ‘ns’ for natural spline smoothing or ‘pspline’ for penalized spline smoothing.}
	\item{method}{The desired method to obtain the optimal degrees of freedom.
		If method ="AIC", then the AIC = (loglik -df) is used to choose the "optimal" degrees of freedom.
		The corrected AIC of Hurvich et. al. (method="AICc") and the BIC criterion (method = "BIC") can also be used.}
	\item{mindf}{Vector with minimum degrees of freedom for each nonlinear predictor.
		By default this value is a vector of of the same length of nl.predictors all with value 1, if smoother is 'ns';
		a vector with the same length of nl.predictors all with value 1.5, if smoother is 'pspline'.}
	\item{maxdf}{Vector with maximum degrees of freedom for each nonlinear predictor.
		By default, when penalized spline is used (smoother='pspline'),
		the corrected AIC from Hurvich obtained in the corresponding univariate additive Cox model is used.
		When penalized spline is used (smoother='ns') a vector with the same length of nl.predictors all with values 1.5.}
	\item{ntimes}{Internel procedure which involves repetion of some convergence steps to attain the optimal degrees of freedom. By deafault is 5.}
	\item{data}{A data.frame in which to interpret the variables named in the arguments \code{time}, \code{time2}, and \code{status}.}
}

%\details{
%%  ~~ If necessary, more details than the description above ~~
%}

\value{
	An object of class \code{list}, basically a list including the elements:
	\item{df}{Degrees of freedom of the 'nl.predictors'.}
	\item{AIC}{Akaike’s Information Criterion score of the fitted model.}
	\item{AICc}{Corrected Akaike’s Information Criterion score of the fitted model.}
	\item{BIC}{Bayesian Information Criterion score of the fitted model.}
	\item{myfit}{Fitted (additive Cox) model based on the chosen degrees of freedom.}
	\item{method}{The method used for obtaining the degrees of freedom.}
	\item{nl.predictors}{Vector with the nonlinear predictors.}
}

\author{Artur Araújo and Luís Meira-Machado}

\references{
	Eilers, Paul H. and Marx, Brian D. (1996). Flexible smoothing with B-splines and penalties. Statistical Science, 11(2), 89-121.

	Hurvich, C.M. and Simonoff, J.S. and Tsai, Chih-Ling (1998). Smoothing parameter selection in nonparametric regression using an improved Akaike information criterion, JRSSB, 60(2), 271–293.
}

%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
# Example 1
library(survival)
data(whas500)
mydf_ns <- dfmacox(time="lenfol", status="fstat", nl.predictors=c("los", "bmi"),
other.predictors=c("age", "hr", "gender", "diasbp"), smoother="ns", data=whas500)
print(mydf_ns)

# Example 2
mydf_ps <- dfmacox(time="lenfol", status="fstat", nl.predictors=c("los", "bmi"),
other.predictors=c("age", "hr", "gender", "diasbp"), smoother="pspline", data=whas500)
print(mydf_ps)
}

\keyword{models}
\keyword{regression}
\keyword{survival}
