pollutantmean <- function(directory, id = 1:332) {
    intAirData <- NA
    for(i in id) {
        airData    <- read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep=''))
        intAirData <- rbind(intAirData, airData)
    }
    mean(intAirData[[pollutant]], na.rm = T)
}