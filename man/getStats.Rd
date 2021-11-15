\name{getStats}
\alias{getStats}
\title{extract function}
\usage{
getStats(data)
}
\arguments{
\item{data}{TetraDENSITY database obtained through getData() or any of its subset obtained through extract()}
}
\description{
This function prints some descriptive statistics of the subset of the database
}
\examples{
library(TetraDENSITY)
TetraDATA <- getData()
getStats(TetraDATA)
}
