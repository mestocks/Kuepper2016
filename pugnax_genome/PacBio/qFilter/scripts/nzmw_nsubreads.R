#data <- read.table("output.ext", header = T)

par(mfrow = c(1, 2))

nuniq <- function(x) {

    nunq <- length(unique(x))
    
    nunq
}

# 1 movie per file
#moviesPerFile <- tapply(data$movieName, data$h5name, nuniq)

zmwPerMovie <- tapply(data$zmwName, data$movieName, nuniq)
#data$movie.zmw <- paste(data$movieName, data$zmwName, sep = "_")
#subReadsPerzmw <- tapply(data$subReadName, data$movie.zmw, nuniq)

#data$movZmwRead

#hist(zmwPerMovie, breaks = 25)
#hist(subReadsPerzmw, breaks = 50)
