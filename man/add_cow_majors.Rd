% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_cow_majors.R
\name{add_cow_majors}
\alias{add_cow_majors}
\title{Add Correlates of War major power information to a dyad-year or state-year data frame}
\usage{
add_cow_majors(data)
}
\arguments{
\item{data}{a dyad-year data frame (either "directed" or "non-directed") or a state-year data frame.}
}
\value{
\code{add_cow_majors()} takes a dyad-year data frame or state-year data frame and adds information
about major power status for the given state or dyad in that year. If the data are dyad-year, the function
returns two columns for whether the first state (i.e. \code{ccode1}) or the second state (i.e. \code{ccode2}) are major powers
in the given year, according to the Correlates of War. 1 = is a major power. 0 = is not a major
power. If the data are state-year, the functions returns just one column (\code{cowmaj}) for whether the
state was a major power in a given dyad-year.
}
\description{
\code{add_cow_majors()} allows you to add Correlates of War major power variables
to a dyad-year or state-year data frame.
}
\details{
The function leans on attributes of the data that are provided by the \code{create_dyadyear()} or
\code{create_stateyear()} function. Make sure that function (or data created by that function) appear at the top
of the proverbial pipe.
}
\examples{

# just call `library(tidyverse)` at the top of the your script
library(magrittr)

cow_ddy \%>\% add_cow_majors()


}
\references{
Correlates of War Project. 2017. "State System Membership List, v2016." Online, \url{https://correlatesofwar.org/data-sets/state-system-membership}
}
\author{
Steven V. Miller
}
