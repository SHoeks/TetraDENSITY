#' getData
#'
#' This function downloads the TetraDENSITY database
#' @examples
#' data<-getData()

getData = function(){
  # url to get csv from
  url='https://ndownloader.figshare.com/files/20334360'

  # os specific seperator
  switch(Sys.info()[['sysname']],Windows= {sep = '\\'}, Linux  = {sep = '/'}, Darwin = {sep = '/'})

  # download csv
  download.file(url,paste0(tempdir(),sep,'TetraDENSITY_v.1.csv'),method = "libcurl")

  # read and return
  return(read.csv(paste0(tempdir(),sep,'TetraDENSITY_v.1.csv'),sep=','))

}
