library(shiny)
library(datasets)
library(ggplot2)
data("mtcars")

mtcars$am <- as.factor(mtcars$am)
fit <- lm(mpg ~ wt + qsec + am, data = mtcars)

#vardesc <- "mpg - Miles/(US) gallon br() cyl - Number of cylinders";
variabledescription <- c("mpg - Miles/(US) gallon", "cyl - Number of cylinders", "disp - Displacement (cu.in.)",
             "hp - Gross horsepower", "drat - Rear axle ratio", "wt - Weight (1000 lbs)",
             "qsec - 1/4 mile time", "vs - V/S", "am - Transmission (0 = automatic, 1 = manual)",
             "gear - Number of forward gears", "carb - Number of carburetors")
variabledescription <- as.data.frame(variabledescription)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$mpgPlot <- renderPlot({
    qplot(mpg, wt, data = mtcars, 
          color =  am, xlab = "Miles/(US) gallon", 
          ylab = "Weight (1000 lbs)", geom = c("point", "smooth"),
          main = "Miles/Gallon Vs Weight Vs Transmission(am)"
    )
  })
  output$strmtcars <- renderTable({
    head(variabledescription, n = 11)
  })
  
  output$predictedMpg <- renderText({
    predictedMpg <- predict(fit, newdata = data.frame(wt = input$wt, am = input$am, qsec = input$qsec))
    predictedMpg
  })
  
  output$mpgPlot1 <- renderPlot({
    pairs(mpg ~ wt + qsec + am, data = mtcars, pch = 22, cex.main = 1,
          main = "Miles/Gallon Vs Weight Vs Transmission(am) Vs 1/4 mile time"
    )
  })
})
