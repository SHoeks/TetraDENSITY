# Package test script
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
install.packages('TetraDENSITY_1.0.tgz', repos = NULL)
library('TetraDENSITY')


data<-getData()
