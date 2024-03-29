% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{tss_rivalries}
\alias{tss_rivalries}
\title{Thompson et al. (2021) Strategic Rivalries, 1494-2020}
\format{
A data frame with 264 observations on the following 12 variables.
\describe{
\item{\code{tssr_id}}{a numeric vector for the rivalry number}
\item{\code{rivalry}}{a character vector for the rivalry name}
\item{\code{ccode1}}{the Correlates of War state code for the state with the lowest Correlates of War state code in the rivalry}
\item{\code{ccode2}}{the Correlates of War state code for the state with the highest Correlates of War state code in the rivalry}
\item{\code{start}}{a numeric vector for the start year of the rivalry}
\item{\code{end}}{a numeric vector for the end year of the rivalry}
\item{\code{positional}}{a numeric vector that is 1 if Thompson et al. (2021) say the rivalry has a positional element (\code{NA} otherwise)}
\item{\code{spatial}}{a numeric vector that is 1 if Thompson et al. (2021) say the rivalry has a spatial element (\code{NA} otherwise)}
\item{\code{ideological}}{a numeric vector that is 1 if Thompson et al. (2021) say the rivalry has an ideological element (\code{NA} otherwise)}
\item{\code{interventionary}}{a numeric vector that is 1 if Thompson et al. (2021) say the rivalry has an interventionary element (\code{NA} otherwise)}
\item{\code{principal}}{a numeric vector that is 1 if Thompson et al. (2021) say the rivalry is the primary (principal) rivalry for the rivals (\code{NA} otherwise)}
\item{\code{aprin}}{a numeric vector that is 1 if Thompson et al. (2021) say this is an asymmetric principal rivalry (\code{NA} otherwise)}
}
}
\usage{
tss_rivalries
}
\description{
A simple summary of all strategic (inter-state) rivalries from Thompson
et al. (2021). This is a simple spreadsheet entry job (with some light
cleaning) based on information provided from pages 34 to 46 in their
book.
}
\details{
Information gathered from chapter 2 of Thompson et al. (2021).
Ongoing rivalries are right-bound at 2020. In several cases, start dates
of 1494 and 1816 originally had a "P" attached to them, indicating they
were ongoing before that particular year. This is captured in the "raw"
spreadsheet included in the "data-raw" directory, though this is adjusted
in this finished data product.

This file adjusts for what is assuredly two print errors in Thompson et al.
(2021). In print, Thompson et al. (2021) say the Italy-Turkey rivalry
extends from 1884-1843 and say the Mauritania-Morocco rivalry extends
from 1060-1969. They had meant an end year of 1943 in the first case and
a start year of 1960 in the second case. This is fixed in this version.

Venice never appears in any data set in the Correlates of War ecosystem
of data, but I gave it a country code of 324 for the sake of these data
(and the previous Thompson and Dreyer (2012) version of it). You'll never
use this, but it's worth saying out loud that's what I did.

Thompson et al. (2021) dedicate their book to expanding on the various
types of rivalry. Users who know the Thompson and Dreyer (2012) version
will see a few differences here. First, rivalries no longer have formal
primary, secondary, or tertiary types. Instead, rivalries have
there/not there markers for whether a particular element of a rivalry type
is present in the rivalry. From what I've read so far of Thompson et al.
(2021), along with their ordering of the information in Chapter 2, it reads
like they've just made informal what was otherwise a more formal classification
component to the Thompson and Dreyer (2012) rivalry data. Positional rivalries
seem to be an informal "type 1" as Thompson et al. (2021) discuss it, not
at all dissimilar to how the classic alliance scholarship treats defense as
a "type 1" pledge. No matter, this book is already more explicit that
positional and spatial rivalries are clearly different from ideological
and interventionary rivalries, and certainly the interventionary rivalries.

"Principal" and "asymmetric principal" rivalries are a new classification in
Thompson et al. (2021), relative to Thompson and Dreyer (2012). "Principal"
rivalries exist where 1) the two rivals have no other rivalry or 2) the two
rivals elevate this rivalry as their primary rivalry among other rivalries.
Asymmetric principal rivalries are when only one of the two rivals sees the
other as its primary rival. Consider two U.S.-Russian rivalries as
illustrative. Tge rivalry with the Soviet Union (\code{tssr_id = 100}) was
the primary rivalry for the U.S. (and the Soviet Union). However, the U.S.
presently sees China as its main rival (\code{tssr_id = 211}). The ongoing
rivalry with Russia (\code{tssr_id = 246}) is one where Russia sees the U.S.
as its primary rival but the U.S. does not see Russia the same way.
}
\references{
Miller, Steven V. 2019. "Create and Extend Strategic (International) Rivalry Data in R".
URL: \url{http://svmiller.com/blog/2019/10/create-extend-strategic-rivalry-data-r/}

Thompson, William R., Kentaro Sakuwa, and Prashant Hosur Suhas. 2021.
\emph{Analyzing Strategic Rivalries in World Politics: Types of Rivalry,
Regional Variation, and Escalation/De-escalation}. Springer.
}
\keyword{datasets}
