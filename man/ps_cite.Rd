% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ps_cite.R
\name{ps_cite}
\alias{ps_cite}
\title{Get \code{BibTeX} Entries Associated with \pkg{peacesciencer} Data and Functions}
\usage{
ps_cite(x)
}
\arguments{
\item{x}{a character vector}
}
\value{
\code{ps_cite()} takes a character vector and scans the \code{ps_bib} data in
this package to return a \code{BibTeX} citation (or citations) for the researcher to use
to properly cite the material they are getting from this package. The citations
are returned as a full \code{BibTeX} entry (or entries) that they can copy-paste into their
own \code{BibTeX} file.
}
\description{
\code{ps_cite()} allows the user to get citations to scholarship that they
should include in their papers that incorporate the functions and data in this package.
}
\details{
The base functionality here is simple pattern-matching on keywords in \code{ps_bib}. This
simple pattern-matching is in base R. I assume the user has some familiarity with \code{BibTeX}.
}
\examples{

# You can cite the package
ps_cite("peacesciencer")

# You can do partial matching
ps_cite("democracy")

# Or more partial matching
ps_cite("alliance")

# You can also get all citations for a particular function
ps_cite("add_archigos()")

}
\author{
Steven V. Miller
}