## Creates a dataframe 
library(timeDate)#for Easter
stat.hol <- function(start,end){
  dys <- seq(as.Date(start), as.Date(end),by="days")
  ldys <- length(dys)
  hols <- c("ny","fd","ef","vd","cd","bcd","ld","tg","rm","ch")
  lhols <- length(hols)
  df <- as.data.frame(matrix(rep(FALSE,ldys*lhols), nrow=ldys))
  colnames(df) <- hols
  df$date <- dys
  df$ny[month(df$date)==1 & day(df$date)==1] <- TRUE
  df$fd[month(df$date)==2 & wday(df$date,label=TRUE)=="Mon" & day(df$date)>7 & day(df$date)<=14] <- TRUE
  df$ef[df$date %in% as.Date(Easter(year(df$date[1]):year(tail(df$date,n=1))) - days(2))] <- TRUE #Easter FRIDAY
  df$vd[month(df$date)==5 & wday(df$date,label=TRUE)=="Mon" & day(df$date)>17 & day(df$date)<=24] <- TRUE
  df$cd[month(df$date)==7 & day(df$date)==1] <- TRUE
  df$bcd[month(df$date)==8 & wday(df$date,label = TRUE) == "Mon" & day(df$date) <= 7] <- TRUE
  df$ld[month(df$date)==9 & wday(df$date,label = TRUE) == "Mon" & day(df$date) <= 7] <- TRUE
  df$tg[month(df$date)==10 & wday(df$date,label=TRUE)=="Mon" & day(df$date)>7 & day(df$date)<=14] <- TRUE
  df$rm[month(df$date)==11 & day(df$date)==11] <- TRUE
  df$ch[month(df$date)==12 & day(df$date)==25] <- TRUE
  return(df)
 }

