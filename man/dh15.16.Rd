% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dh15.16.R
\name{dh15.16}
\alias{dh15.16}
\title{Function to return the DH15 and DH16 hydrologic indicator statistics for a given data frame}
\usage{
dh15.16(qfiletempf)
}
\arguments{
\item{qfiletempf}{data frame containing a "discharge" column containing daily flow values}
}
\value{
dh15.16 list containing DH15 and DH16 for the given data frame
}
\description{
This function accepts a data frame that contains a column named "discharge" and calculates 
DH15; High flow pulse duration. Compute the average duration for flow events with flows above a threshold equal 
to the 75th percentile value for each year in the flow record. DH15 is the median of the yearly average durations 
(days/year-temporal). and 
DH16; Variability in high flow pulse duration. Compute the standard deviation for the yearly average high pulse 
durations. DH16 is 100 times the standard deviation divided by the mean of the yearly average high pulse durations 
(percent-spatial).
}
\examples{
qfiletempf<-sampleData
dh15.16(qfiletempf)
}

