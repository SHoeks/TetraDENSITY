#' extract function
#'
#' This function prints some descriptive statistics of the subset of the database
#' @param data TetraDENSITY database obtained through getData() or any of its subset obtained through extract()
#' @examples
#' getStats(data)

getStats<-function(data) {

  data$Dens2<-ifelse(data$Density_unit=='ind/ha', data$Density*100,
                     ifelse(data$Density_unit=='pairs/km2', data$Density*3,
                            ifelse(data$Density_unit=='males/ha', data$Density*100*2, data$Density)))

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

  data$Sp<-paste(data$Genus, data$Species)

  n<-nrow(data)
  nOr<-length(unique(data$Order))
  nFm<-length(unique(data$Family))
  nGn<-length(unique(data$Genus))
  nSp<-length(unique(data$Sp))
  nCn<-length(unique(data$Country))
  YearMin<-min(data$Year1, na.rm=TRUE)
  YearMax<-max(data$Year2, na.rm=TRUE)
  DensMed<-median(data$Dens2)
  DensMin<-min(data$Dens2)
  DensMax<-max(data$Dens2)
  options(scipen = 999)
  out<-data.frame(Var=c('Nrecords', 'nOrders', 'nFamilies', 'nGenera', 'nSpecies', 'nCountries', 'YearMin', 'YearMax', 'DensMed_km2', 'DensMin_km2', 'DensMax_km2'),
                  Value=c(n, nOr, nFm, nGn, nSp, nCn, YearMin, YearMax, DensMed, DensMin, DensMax)
  )
  out[,2]<-round(out[,2],3)
  return(out)
}
