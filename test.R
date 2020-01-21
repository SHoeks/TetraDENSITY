# unload pkg (if currently loaded)
detach("package:TetraDENSITY", unload=TRUE);

# uninstall previous installation
remove.packages('TetraDENSITY')

# install pkg
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
if(Sys.info()[["sysname"]]=="Windows") install.packages('../TetraDENSITY_0.1.1.zip', repos = NULL)
if(Sys.info()[["sysname"]]=="Darwin") install.packages('../TetraDENSITY_0.1.1.tgz', repos = NULL)

# source pkg
library('TetraDENSITY')

# test functions
data<-getData()
map<-getMap()
getStats(data)
visualize(data = data, map = map, CountryBorder = FALSE, GeographicZoom = TRUE)
extract(data)
