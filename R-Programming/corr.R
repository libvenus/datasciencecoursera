corr <- function(directory, threshold = 0) {
    totalCorrData  <- c()
    
    for(id in 1:332) {
        airData <- read.csv(paste(directory, "/", sprintf("%03d", id), ".csv", sep=''))
        nobs    <- sum(complete.cases(airData))
        if(nobs > threshold) {
            currCorrData  <- (cor(airData$sulfate, airData$nitrate, use="complete.obs"))
            totalCorrData <- append(totalCorrData, currCorrData, after = length(totalCorrData))
        }
    }
    
    return (totalCorrData)
}