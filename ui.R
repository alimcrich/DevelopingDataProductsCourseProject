library(shiny)
data(iris)

fluidPage(
  navbarPage("Iris Species Predictor Game",tabPanel("Predictor",
  sidebarPanel(
               h1(""),
               sliderInput("petalLength", "Petal Length", min=1.0, max=6.9, value = 3.3, step=0.1,post='cm'),
               sliderInput("petalWidth", "Petal Width", min=0.1, max=2.5, value=0.5, step=0.1, post='cm'),
               sliderInput("sepalLength", "Sepal Length", min=4.3, max=7.9, value=6, step=0.1, post='cm'),
               sliderInput("sepalWidth", "Sepal Width", min=2.0, max=4.4, value=3.0, step=0.1, post='cm'),
               selectInput("SpeciesInput", "Guess which species has this Petal Length and Width and Sepal Length and Width after looking at the plot",
                           choices = c("Setosa", "Versicolor", "Virginica")),
               actionButton(inputId="submit", label="Submit Species Guess"),
               actionButton(inputId = "reset",label = "Reset"
               )),
  mainPanel(
    plotOutput("irisPlot"),
    br(),
    textOutput("guessOutput"),
    br(),
    tableOutput("predictionOutput"), textOutput("correctOutput")
  )
  ),
  tabPanel("About",mainPanel(includeMarkdown("README.Rmd")))
  )
  
)
