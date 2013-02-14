
allfiles<-list.files('./data')
interesting<-paste0('./data/',allfiles[3:5])

rawdf<-read.xls(file.choose(), pattern='Classification File',sheet=1, verbose=FALSE, blank.lines.skip=TRUE,header=TRUE,as.is=TRUE)

cleanQuasar<-rawdf[2:7,c(1,6,7,10,11)]

names(cleanQuasar)<-c('file','AverageLinearEngagement', 'St.Dev.LinearEngagement', 'AverageLinearWorkload',  'St.Dev.LinearWorkload')

lines<-sapply(interesting,function(x) readLines(x,3))

datafiles<-dir('./data')
filename<-paste0('./data/',datafiles[3])
sheetrange=c(1:13)
df<-data.frame(workbook=rep(filename,length(sheetrange)),sheet=sheetrange)
workbookloader <- function (filename,sheetrange) {
  readWorksheetFromFile(file=filename,sheet=sheetrange, header=TRUE,startRow=2, endCol= 11)
}
for(i in list){
  varname=paste0('./data/','quasar','_coladd_',i)
  datafiles<-dir('./data')
  filename<-paste0('./data/',datafiles[3])
  sheetout<-workbookloader(filename,sheetrange=i)
  save(sheetout,file=varname)
}

  
