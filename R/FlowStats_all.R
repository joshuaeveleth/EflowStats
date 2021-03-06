#' Function to run HIT/HAT statistics for a given data set
#' 
#' This function accepts a data frame of daily flow data and returns a data frame of 
#' calculated HIT/HAT statistics
#' 
#' @param data data frame of daily flow data
#' @param peakData data frame of annual peaks
#' @param drain_area drainage area for a given site
#' @param stats list of requested stat groups
#' @return Output data frame of calculated statistics
#' @export
#' @examples
#' sites<-"02177000"
#' \dontrun{
#' drain_area<-getDrainageArea(sites)
#' qfiletempf<-sampleData
#' FlowStatsAll(qfiletempf,drain_area)
#' }
FlowStatsAll <- function(data,drain_area,stats="magStat,flowStat,timStat,rateStat,otherStat,durStat",peakData=0) {
  dfOut <- vector()
  if (length(peakData)==1){
    peakData <- aggregate(data$discharge,by=list(data$wy_val),max)
    colnames(peakData) <- c("wy_val","discharge")
    peakData <- data[paste(data$wy_val,data$discharge) %in% paste(peakData$wy_val,peakData$discharge),]
    peakData$logval <- log10(peakData$discharge)
  }
  thresh_60<-getPeakThresh(data,peakData,.6)
  thresh_40<-getPeakThresh(data,peakData,.4)
  if (grepl("otherStat",stats)) {
    otherstat <- OtherStats(data)
    dfOut <- c(dfOut,otherstat)
  }
  if (grepl("magStat",stats)) {
    ma1v<-ma1(data)
    ma2v<-ma2(data)
    ma3v<-ma3(data)
    ma4v<-unlist(ma4.11(data)[1])
    ma5v<-unlist(ma4.11(data)[2])
    ma6v<-unlist(ma4.11(data)[3])
    ma7v<-unlist(ma4.11(data)[4])
    ma8v<-unlist(ma4.11(data)[5])
    ma9v<-unlist(ma4.11(data)[6])
    ma10v<-unlist(ma4.11(data)[7])
    ma11v<-unlist(ma4.11(data)[8])
    ma12v<-ma12.23(data)[1,1]
    ma13v<-ma12.23(data)[2,1]
    ma14v<-ma12.23(data)[3,1]
    ma15v<-ma12.23(data)[4,1]
    ma16v<-ma12.23(data)[5,1]
    ma17v<-ma12.23(data)[6,1]
    ma18v<-ma12.23(data)[7,1]
    ma19v<-ma12.23(data)[8,1]
    ma20v<-ma12.23(data)[9,1]
    ma21v<-ma12.23(data)[10,1]
    ma22v<-ma12.23(data)[11,1]
    ma23v<-ma12.23(data)[12,1]
    ma24v<-ma24.35(data)[1,1]
    ma25v<-ma24.35(data)[2,1]
    ma26v<-ma24.35(data)[3,1]
    ma27v<-ma24.35(data)[4,1]
    ma28v<-ma24.35(data)[5,1]
    ma29v<-ma24.35(data)[6,1]
    ma30v<-ma24.35(data)[7,1]
    ma31v<-ma24.35(data)[8,1]
    ma32v<-ma24.35(data)[9,1]
    ma33v<-ma24.35(data)[10,1]
    ma34v<-ma24.35(data)[11,1]
    ma35v<-ma24.35(data)[12,1]
    ma36v<-unlist(ma36.40(data)[1])
    ma37v<-unname(unlist(ma36.40(data)[2]))
    ma38v<-unname(unlist(ma36.40(data)[3]))
    ma39v<-unlist(ma36.40(data)[4])
    ma40v<-unlist(ma36.40(data)[5])
    ma41v<-unlist(ma41.45(data,drain_area)[1])
    ma42v<-unlist(ma41.45(data,drain_area)[2])
    ma43v<-unname(unlist(ma41.45(data,drain_area)[3]))
    ma44v<-unname(unlist(ma41.45(data,drain_area)[4]))
    ma45v<-unlist(ma41.45(data,drain_area)[5])
    ml1v<-unlist(ml1.12(data)[1])
    ml2v<-unlist(ml1.12(data)[2])
    ml3v<-unlist(ml1.12(data)[3])
    ml4v<-unlist(ml1.12(data)[4])
    ml5v<-unlist(ml1.12(data)[5])
    ml6v<-unlist(ml1.12(data)[6])
    ml7v<-unlist(ml1.12(data)[7])
    ml8v<-unlist(ml1.12(data)[8])
    ml9v<-unlist(ml1.12(data)[9])
    ml10v<-unlist(ml1.12(data)[10])
    ml11v<-unlist(ml1.12(data)[11])
    ml12v<-unlist(ml1.12(data)[12])
    ml13v<-ml13(data)
    ml14v<-unlist(ml14.16(data)[1])
    ml15v<-unlist(ml14.16(data)[2])
    ml16v<-unlist(ml14.16(data)[3])
    ml17v<-ml17(data)
    ml18v<-ml18(data)
    ml19v<-ml19(data)
    ml20v<-ml20(data)
    ml21v<-ml21(data)
    ml22v<-ml22(data,drain_area)
    mh1v<-unlist(mh1.12(data)[1])
    mh2v<-unlist(mh1.12(data)[2])
    mh3v<-unlist(mh1.12(data)[3])
    mh4v<-unlist(mh1.12(data)[4])
    mh5v<-unlist(mh1.12(data)[5])
    mh6v<-unlist(mh1.12(data)[6])
    mh7v<-unlist(mh1.12(data)[7])
    mh8v<-unlist(mh1.12(data)[8])
    mh9v<-unlist(mh1.12(data)[9])
    mh10v<-unlist(mh1.12(data)[10])
    mh11v<-unlist(mh1.12(data)[11])
    mh12v<-unlist(mh1.12(data)[12])
    mh13v<-mh13(data)
    mh14v<-mh14(data)
    mh15v<-unname(unlist(mh15.17(data)[1]))
    mh16v<-unname(unlist(mh15.17(data)[2]))
    mh17v<-unname(unlist(mh15.17(data)[3]))
    mh18v<-mh18(data)
    mh19v<-mh19(data)
    mh20v<-mh20(data,drain_area)
    mh21v<-mh21(data)
    mh22v<-mh22(data)
    mh23v<-mh23(data)
    mh24v<-mh24(data)
    mh25v<-mh25(data)
    mh26v<-mh26(data)
    mh27v<-mh27(data)
  dfOut <- c(dfOut,ma1v,ma2v,ma3v,ma4v,ma5v,ma6v,ma7v,ma8v,ma9v,ma10v,ma11v,ma12v,
             ma13v,ma14v,ma15v,ma16v,ma17v,ma18v,ma19v,ma20v,ma21v,ma22v,ma23v,ma24v,ma25v,ma26v,ma27v,ma28v,
             ma29v,ma30v,ma31v,ma32v,ma33v,ma34v,ma35v,ma36v,ma37v,ma38v,ma39v,ma40v,ma41v,ma42v,ma43v,ma44v,
             ma45v,ml1v,ml2v,ml3v,ml4v,ml5v,ml6v,ml7v,ml8v,ml9v,ml10v,ml11v,ml12v,ml13v,ml14v,ml15v,ml16v,
             ml17v,ml18v,ml19v,ml20v,ml21v,ml22v,mh1v,mh2v,mh3v,mh4v,mh5v,mh6v,mh7v,mh8v,mh9v,mh10v,mh11v,
             mh12v,mh13v,mh14v,mh15v,mh16v,mh17v,mh18v,mh19v,mh20v,mh21v,mh22v,mh23v,mh24v,mh25v,mh26v,mh27v)
  }
  if (grepl("flowStat",stats)) {
    fl1v<-unname(unlist(fl1.2(data)[1]))
    fl2v<-unname(unlist(fl1.2(data)[2]))
    fl3v<-fl3(data)
    fh1v<-unname(unlist(fh1.2(data)[1]))
    fh2v<-unname(unlist(fh1.2(data)[2]))
    fh3v<-fh3(data) 
    fh4v<-fh4(data) 
    fh5v<-fh5(data)
    fh6v<-fh6(data)
    fh7v<-fh7(data)
    fh8v<-fh8(data)
    fh9v<-fh9(data)
    fh10v<-fh10(data)
    if (!is.na(thresh_60)) {
    fh11v<-fh11(data,thresh_60)
    } else {fh11v<-NA}
  dfOut <- c(dfOut,fl1v,fl2v,fl3v,fh1v,fh2v,fh3v,fh4v,fh5v,fh6v,fh7v,fh8v,fh9v,fh10v,fh11v)
  }
  if (grepl("durStat",stats)) {
    dl1v<-dl1(data)
    dl2v<-dl2(data)
    dl3v<-dl3(data)
    dl4v<-dl4(data)
    dl5v<-dl5(data)
    dl6v<-dl6(data)
    dl7v<-dl7(data)
    dl8v<-dl8(data)
    dl9v<-dl9(data)
    dl10v<-dl10(data)
    dl11v<-dl11(data)
    dl12v<-dl12(data)
    dl13v<-dl13(data)
    dl14v<-unname(dl14(data))
    dl15v<-unname(dl15(data))
    dl16v<-unname(unlist(dl16.17(data)[1]))
    dl17v<-unname(unlist(dl16.17(data)[2]))
    dl18v<-dl18(data)
    dl19v<-dl19(data)
    dl20v<-dl20(data)
    dh1v<-dh1(data)
    dh2v<-dh2(data)
    dh3v<-dh3(data)
    dh4v<-dh4(data)
    dh5v<-dh5(data)
    dh6v<-dh6(data)
    dh7v<-dh7(data)
    dh8v<-dh8(data)
    dh9v<-dh9(data)
    dh10v<-dh10(data)
    dh11v<-dh11(data)
    dh12v<-dh12(data)
    dh13v<-dh13(data)
    dh14v<-unname(dh14(data))
    dh15v<-unname(unlist(dh15.16(data)[1]))
    dh16v<-unname(unlist(dh15.16(data)[2]))
    dh17v<-dh17(data)
    dh18v<-dh18(data)
    dh19v<-dh19(data)
    dh20v<-dh20(data)
    dh21v<-dh21(data)
    if (!is.na(thresh_60)) {
    dh22v<-dh22(data,thresh_60)
    } else {dh22v<-NA}
    if (!is.na(thresh_60)) {
    dh23v<-dh23(data,thresh_60)
    } else {dh23v<-NA}
    if (!is.na(thresh_60)) {
    dh24v<-dh24(data,thresh_60)
    } else {dh24v<-NA}
  dfOut <- c(dfOut,dl1v,dl2v,dl3v,dl4v,
             dl5v,dl6v,dl7v,dl8v,dl9v,dl10v,dl11v,dl12v,dl13v,dl14v,dl15v,dl16v,dl17v,dl18v,dl19v,dl20v,
             dh1v,dh2v,dh3v,dh4v,dh5v,dh6v,dh7v,dh8v,dh9v,dh10v,dh11v,dh12v,dh13v,dh14v,dh15v,
             dh16v,dh17v,dh18v,dh19v,dh20v,dh21v,dh22v,dh23v,dh24v)
  }
  if (grepl("timStat",stats)) {
    ta1v<-unname(unlist(ta1.2(data)[1]))
    ta2v<-unname(unlist(ta1.2(data)[2]))
    if (!is.na(thresh_60)) {
    ta3v<-ta3(data,thresh_60)
    } else {ta3v<-NA}
    tl1v<-unname(unlist(tl1.2(data)[1]))
    tl2v<-unname(unlist(tl1.2(data)[2]))
    if (!is.na(thresh_40)) {
    tl3v<-tl3(data,thresh_40)
    } else {tl3v<-NA}
    if (!is.na(thresh_40)) {
    tl4v<-tl4(data,thresh_40)
    } else {tl4v<-NA}
    th1v<-unname(unlist(th1.2(data)[1]))
    th2v<-unname(unlist(th1.2(data)[2]))
    if (!is.na(thresh_60)) {
    th3v<-th3(data,thresh_60)
    } else {th3v<-NA}
  dfOut <- c(dfOut,ta1v,ta2v,ta3v,tl1v,tl2v,tl3v,tl4v,th1v,th2v,th3v)
  }
  if (grepl("rateStat",stats)) {
    ra1v<-ra1(data)
    ra2v<-ra2(data)
    ra3v<-ra3(data)
    ra4v<-ra4(data)
    ra5v<-ra5(data)
    ra6v<-ra6(data)
    ra7v<-ra7(data)
    ra8v<-unname(unlist(ra8.9(data)[1]))
    ra9v<-unname(unlist(ra8.9(data)[2]))
  dfOut <- c(dfOut,ra1v,ra2v,ra3v,ra4v,ra5v,ra6v,ra7v,ra8v,ra9v)
  }
  
  Output<-dfOut
  return(Output)
  
}
