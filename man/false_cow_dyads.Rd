% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{false_cow_dyads}
\alias{false_cow_dyads}
\title{False Correlates of War Directed Dyad-Years}
\format{
A data frame the following four variables.
\describe{
\item{\code{ccode1}}{a numeric vector for the Correlates of War state code for the first state}
\item{\code{ccode2}}{a numeric vector for the Correlates of War state code for the second state}
\item{\code{year}}{a numeric vector for the year}
\item{\code{in_ps}}{a constant that equals 1 if these data would appear in \code{create_dyadyears()} if you were not careful to remove them.}
}
}
\usage{
false_cow_dyads
}
\description{
This is a simple data set that communicates directed dyads in the Correlates of War data that appear in the same year,
but not in any particular day in the year. They are used in an anti-join in the \code{create_dyadyears()} function in this package.
}
\details{
Think of the directed Suriname and Republic of Vietnam dyad here as illustrative here. The Republic of Vietnam exits the
Correlates of War state system on April 30, 1975 whereas Suriname enters the state system on November 25, 1975. Both appear in the same
year, but not at the same time.
}
\keyword{datasets}
