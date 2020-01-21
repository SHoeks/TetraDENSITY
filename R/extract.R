# extract function
extract<-function(data, Class=NULL, Order=NULL, Family=NULL, Genus=NULL, Species=NULL, x_coords=c(NULL,NULL), y_coords=c(NULL,NULL), Country=NULL, Years=c(NULL,NULL), Methods=NULL) {

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

  if(!is.null(Class)) {data<-data[data$Class %in% Class,]}
  if(!is.null(Order)) {data<-data[data$Order %in% Order,]}
  if(!is.null(Family)) {data<-data[data$Family %in% Family,]}
  if(!is.null(Genus)) {data<-data[data$Genus %in% Genus,]}
  if(!is.null(Species)) {data<-data[data$Sp %in% Species,]}# | data$AcceptedName_COL %in% Species
  if(!is.null(Country)) {data<-data[data$Country %in% Country,]}
  if(!is.null(x_coords)) {data<-data[data$Longitude >= x_coords[1] & data$Longitude <= x_coords[2],]}
  if(!is.null(y_coords)) {data<-data[data$Latitude >= y_coords[1] & data$Latitude <= y_coords[2],]}
  if(!is.null(Years)) {data<-data[data$Year1 >= Years[1] & data$Year2 <= Years[2],]}
  if(!is.null(Methods)) {data<-data[data$Method %in% Methods,]}

  return(data)
}
