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

# get the TetraDENSITY data 
data <- getData()

# subset the data
subset<-extract(data=data, 
  Class=NULL, Order='Primates', Family=NULL, Genus=NULL, Species=NULL, 
	x_coords=NULL, y_coords=NULL, Country=NULL, 
	Years=NULL, 
	Methods=NULL)

# load map on which the points are plotted
map<-getMap()

# plot records on the full world map
visualize(data=subset, map=map, CountryBorder=FALSE, GeographicZoom=FALSE)

# show country borders
visualize(data=subset, map=map, CountryBorder=TRUE, GeographicZoom=FALSE)

# zoom on the geographic area with the records
visualize(data=subset, map=map, CountryBorder=FALSE, GeographicZoom=TRUE)
}
