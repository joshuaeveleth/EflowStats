#' Function to return the MH14 hydrologic indicator statistic for a given data frame
#' 
#' This function accepts a data frame that contains columns named "discharge", "year_val" and "month_val" and 
#' calculates MH14, median of annual maximum flows. Compute the annual maximum flows from monthly maximum flows. 
#' Compute the ratio of annual maximum flow to median annual flow for each year. MH14 is the median of these ratios 
#' (dimensionless-temporal).
#' 
#' @param qfiletempf data frame containing a "discharge" column containing daily flow values
#' @return mh14 numeric value of MH14 for the given data frame
#' @export
#' @examples
#' qfiletempf<-sampleData
#' mh14(qfiletempf)
mh14 <- function(qfiletempf) {
  maxmonbymoyr <- aggregate(qfiletempf$discharge, list(qfiletempf$wy_val, 
                                                       qfiletempf$month_val), FUN = max, na.rm=TRUE)
  colnames(maxmonbymoyr) <- c("Year", "Month", "momax")
  maxmonbyyrr <- aggregate(maxmonbymoyr$momax, list(maxmonbymoyr$Year), 
                           FUN = max, na.rm=TRUE)
  colnames(maxmonbyyrr) <- c("Year", "yrmax")
  medflowbyyr <- aggregate(qfiletempf$discharge, list(qfiletempf$wy_val), 
                           FUN = median, na.rm=TRUE)
  colnames(medflowbyyr) <- c("Year", "yrmed")
  ratiomaxmed <- maxmonbyyrr$yrmax/medflowbyyr$yrmed
  mh14 <- round(median(ratiomaxmed),digits=2)
  return(mh14)
}