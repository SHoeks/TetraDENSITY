# TetraDENSITY
R package created to load, visualize and explore the TetraDENSITY data set.

## Information
- Detailed information (package vignette) is presented at {URL_vignette}.
- See https://doi.org/10.1111/geb.12756 for the TetraDENSITY publication.

## Usage
```R
# Install TetraDENSITY
library('devtools')
install_github("SHoeks/TetraDENSITY")

# Load TetraDENSITY
library('TetraDENSITY')

# Use TetraDENSITY functions
data<-getData()
map<-getMap()
getStats(data)
visualize(data = data, map = map, CountryBorder = FALSE, GeographicZoom = TRUE)
extract(data)
```
