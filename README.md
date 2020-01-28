# TetraDENSITY
This package was made to explore the TetraDENSITY data set (see https://doi.org/10.1111/geb.12756).

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
