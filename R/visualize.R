# extract function
visualize<-function(data, map, CountryBorder=FALSE, GeographicZoom=TRUE){


  layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
  par(mar=c(5, 3, 1, 1))


  #MAP
  #	if(GeographicDistribution) {
  backCol='grey90'
  bordCol='black'
  colP=rgb(0.0, 0.4, 0.8, 0.6)
  xl=c(-180, 180)
  yl=c(-90, 90)
  cxP=2
  buff=0.5 #space around points for zoom option
  xl[1]=ifelse(GeographicZoom==TRUE, min(data$Longitude, na.rm=TRUE)-buff, xl[1])
  xl[2]=ifelse(GeographicZoom==TRUE, max(data$Longitude, na.rm=TRUE)+buff, xl[2])
  yl[1]=ifelse(GeographicZoom==TRUE, min(data$Latitude, na.rm=TRUE)-buff, yl[1])
  yl[2]=ifelse(GeographicZoom==TRUE, max(data$Latitude, na.rm=TRUE)+buff, yl[2])

  plot(map$geometry, col=backCol, border=ifelse(CountryBorder==FALSE, backCol, bordCol), xlim=xl, ylim=yl)
  points(data$Longitude, data$Latitude, col=colP, cex=cxP, pch=19)
  #}

  #if(ValueDistribution) {
  #Histogram density values
  #make values comparable
  data$Dens2<-ifelse(data$Density_unit=='ind/ha', data$Density*100,
                     ifelse(data$Density_unit=='pairs/km2', data$Density*3,
                            ifelse(data$Density_unit=='males/ha', data$Density*100*2, data$Density)))
  colBars='deepskyblue4'
  hist(data$Dens2, col=colBars, xlab='Density (ind/km2)', las=1, main='')
  #}

  #if(SamplingYearsDistribution) {
  #Histogram sampling years

  data$Year<-as.character(data$Year)
  data$Year<-ifelse(grepl("-", data$Year), data$Year, paste0(data$Year, '-', data$Year))
  data$Year[data$Year=='-']<-'999-999'
  tmp<-strsplit(as.character(data$Year), "-")
  tmp<-matrix(unlist(tmp), ncol=2, nrow=length(tmp), byrow=TRUE)
  data$Year1<-suppressWarnings(as.numeric(tmp[,1]))
  data$Year1[data$Year1==999]<-NA
  data$Year2<-suppressWarnings(as.numeric(tmp[,2]))
  data$Year2[data$Year2==999]<-NA
  data$midYear<-rowMeans(data[,c('Year1', 'Year2')])

  colBarsY='darkolivegreen'
  hist(data$midYear, col=colBarsY, xlab='Sampling years', las=1, main='')
  #}
}
