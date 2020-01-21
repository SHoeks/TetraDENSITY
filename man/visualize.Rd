\name{visualize}
\alias{visualize}
\title{extract function}
\usage{
visualize(data = data, CountryBorder = FALSE, GeographicZoom = TRUE)
}
\arguments{
\item{data}{TetraDENSITY database obtained through getData() or any of its subset obtained through extract()}

\item{CountryBorder}{Highlight country borders in the map}

\item{GeographicZoom}{Zoom map to the geographic area with density estimates}
}
\description{
This function prints some descriptive statistics of the subset of the database
}
\examples{
visualize(data)
}
