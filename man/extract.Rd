\name{extract}
\alias{extract}
\title{extract function}
\description{This function allows you to subset the database by taxa, spatial window, country, sampling years and sampling method. All arguments left as NULL will be ignored for subsetting.
}
\usage{
extract(
  data,
  Class = NULL,
  Order = NULL,
  Family = NULL,
  Genus = NULL,
  Species = NULL,
  x_coords = c(NULL, NULL),
  y_coords = c(NULL, NULL),
  Country = NULL,
  Years = c(NULL, NULL),
  Methods = NULL
)
}
\arguments{
\item{data}{TetraDENSITY database obtained through getData()}
\item{Class}{Taxonomic class}
\item{Order}{Taxonomic order}
\item{Family}{Taxonomic family}
\item{Genus}{Taxonomic genus}
\item{Species}{Binomial name}
\item{x_coords}{vector with minimum and maximum longitude in decimal degrees}
\item{y_coords}{vector with minimum and maximum latitude in decimal degrees}
\item{Country}{vector with the name of the countries of interest}
\item{Years}{vector with first and last year of the period of interest}
\item{Methods}{vector with the list of method categories of interest (as described in the TetraDENSITY documentation)}
}
\examples{
library(TetraDENSITY)
TetraDATA <- getData()
subset<-extract(TetraDATA,
Class='Mammalia', Order='Primates', Family='Atelidae', Genus=NULL, Species=NULL,
x_coords=c(-80,-30), y_coords=c(-24,10), Country=c('Brazil', 'Venezuela', 'Peru', 'Colombia'),
Years=c(1985,2015), Methods=NULL)
  
}
