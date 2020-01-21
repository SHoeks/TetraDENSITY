getMap <- function(){

  dir = paste0(.libPaths()[grep('TetraDENSITY',lapply(.libPaths(),list.files))][1],'/','TetraDENSITY')
  nc = sf::st_read(paste0(dir,'/LAND_UNIT.shp'), stringsAsFactors = F)

  return(nc)
}



