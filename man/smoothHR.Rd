\encoding{UTF-8}
\name{smoothHR}
\alias{smoothHR}
\title{Smooth Hazard Ratio Curves Taking a Reference Value}
\description{
	Provides flexible hazard ratio curves allowing non-linear relationships between continuous predictors and survival.
	To better understand the effects that each continuous covariate has on the outcome, results are expressed in terms of hazard ratio curves,
	taking a specific covariate value as reference. Confidence bands for these curves are also derived.
}
\usage{smoothHR(data, time=NULL, time2=NULL, status=NULL, formula=NULL, coxfit,
status.event=NULL)}

\arguments{
	\item{data}{A data.frame in which to interpret the variables named in the formula or in the arguments \code{time}, \code{time2}, \code{status} and \code{coxfit}.}
	\item{time}{For right censored data, this is the follow up time. For interval data, the first argument is the starting time for the interval.}
	\item{time2}{Ending time of the interval for interval censored or counting process data only.
		Intervals are assumed to be open on the left and closed on the right, (start, end].
		For counting process data, event indicates whether an event occurred at the end of the interval.}
	\item{status}{The status indicator, normally 0=alive, 1=dead. Other choices are TRUE/FALSE (TRUE = death) or 1/2 (2=death).
		For interval censored data, the status indicator is 0=right censored, 1=event at time, 2=left censored, 3=interval censored.
		Although unusual, the event indicator can be omitted, in which case all subjects are assumed to have an event.}
	\item{formula}{A formula object, with the terms on the right after the ~ operator.}
	\item{coxfit}{An object of class coxph. This argument is optional, being an alternative to the arguments  \code{time}, \code{time2}, \code{status} and \code{formula}.}
	\item{status.event}{The status indicator is a qualitative variable where usually the highest value is left for the event of interest (usually 0=alive, 1=dead).
		If that is not the case the \code{status.event} indicates which value denotes the event of interest.}
}

%\details{
%%  ~~ If necessary, more details than the description above ~~
%}

\value{
	An object of class \code{HR}. There are methods for \code{print}, \code{predict} and \code{plot}.
	\code{HR} objects are implemented as a list with elements:
	\item{dataset}{Dataset used.}
	\item{coxfit}{The object of class 'coxph' used.}
	\item{phtest}{Result from testing the proportional hazards assumption.}
}

\author{Artur Araújo and Luís Meira-Machado}

\references{
	Carmen Cadarso-Suarez, Luís Meira-Machado, Thomas Kneib and Francisco Gude. Flexible hazard ratio curves for continuous predictors in multi-state models: a P-spline approach. Statistical Modelling, 2010, 10:291-314.
}

%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}

\examples{
# Example 1
library(survival)
data(whas500)
fit <- coxph(Surv(lenfol, fstat)~age+hr+gender+diasbp+pspline(bmi)+pspline(los), data=whas500,
x=TRUE)
hr1 <- smoothHR(data=whas500, coxfit=fit)
print(hr1)

# Example 2
hr2 <- smoothHR( data=whas500, time="lenfol", status="fstat", formula=~age+hr+gender+diasbp+
pspline(bmi)+pspline(los) )
print(hr2)
}

\keyword{models}
\keyword{regression}
\keyword{survival}
