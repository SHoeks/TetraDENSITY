# TetraDENSITY
This package was made to explore the TetraDENSITY data set (see https://doi.org/10.1111/geb.12756).

## Usage

```R
# Unload pkg (if currently loaded)
detach("package:TetraDENSITY", unload=TRUE);

# Uninstall previous installation (when applicable)
remove.packages('TetraDENSITY')

# Install TetraDENSITY
library('devtools')
install_github("SHoeks/TetraDENSITY", auth_token = "95549175eda407ee050320d01251783d881d535a")

# Load TetraDENSITY
library('TetraDENSITY')

# Test TetraDENSITY functions
data<-getData()
map<-getMap()
getStats(data)
visualize(data = data, map = map, CountryBorder = FALSE, GeographicZoom = TRUE)
extract(data)
```
