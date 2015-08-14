complete <- function(directory, id = 1:332) {
    report <- c()
    for(i in id) {
        airData   <- read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep=''))
        compCases <- complete.cases(airData)
        report    <- append(report, sum(compCases), after = length(report))
    }
    output <- data.frame(id = id, nods = report)
    #print(output)
}