library(shiny)

shinyUI(
  fluidPage(
    titlePanel("Predict Miles/Gallon!"),

    sidebarLayout(position = "right", fluid = TRUE,
      sidebarPanel(
        plotOutput("mpgPlot1"),
        br(),
        helpText("Pick predictor values:"),
        sliderInput("wt", label = h5("Weight (1000 lbs)"), min = 1, max = 6, value = 1),
        sliderInput("qsec", label = h5("1/4 mile time"), min = 12, max = 24, value = 12),
        radioButtons("am", label = h5("Transmission"), choices = list("automatic" = 0, "manual" = 1),selected = 1),
        #submitButton("Submit"),
        br(),
        helpText("Predicted Miles Per Gallon:"),
        verbatimTextOutput("predictedMpg")
      ),
      mainPanel(
        
        div("This application is based on Motor Trend Car Road Test results performed back in
           1974 by the Motor Trend US magazine. It comprises of fuel consumption and 10 aspects
           of automobile design and performance for 32 automobiles (1973–74 models). 
           The dataset is loaded into mtcars data-frame.", style = "color:blue"),
        br(),
        div("The mtcars dataset is comprised of following variables:", style = "color:blue"),
        tableOutput("strmtcars"),
        div("However it has been found in various analysis that mpg is mostly dependent on wt, qsec and am.
            So our prediction will take only those variables into consideration ", style = "color:blue"),
        plotOutput("mpgPlot")
      )
    )
  )
)

