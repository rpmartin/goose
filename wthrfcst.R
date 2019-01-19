get.fcast <- function(){
library(stringr)
library(XML)
system("phantomjs scrape.js")
html.file = "scraped.html"
raw.df = readHTMLTable(html.file, header=T, which=1,stringsAsFactors=F)
lst <- c(t(raw.df))
fnd.fcst <- function(data){
  grepl("Forecast", data, fixed=TRUE) 
}
index <- lapply(lst,fnd.fcst)
fc.vec <- lst[unlist(index)]
fc.vec <-gsub("Forecast", ",", fc.vec)
fc.vec <-gsub("°C", ",", fc.vec)
fc.vec <-gsub("Feels like", ",", fc.vec)
fc.vec <-gsub("24h Rain", ",", fc.vec)
fc.vec <-gsub("mmPOP...", "", fc.vec)
lst <- sapply(fc.vec,str_split,pattern=",")
rowMax <- max(sapply(lst, length))
fcast.df <- do.call(rbind, lapply(lst, function(x){
    length(x) <- rowMax
    x
    })) 
rownames(fcast.df) <- NULL
colnames(fcast.df) <- c("Day","Max","Min","FL","Rain")
fcast.df <- as.data.frame(apply(fcast.df,2,as.numeric))
fcast.df[is.na(fcast.df)] <- 0
return(fcast.df)
}
