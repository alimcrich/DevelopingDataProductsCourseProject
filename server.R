if(!("randomForest" %in% rownames(installed.packages()))) {
  install.packages("randomForest")
}
library(randomForest)

buildRandomForestModel <- function() {
  set.seed(71)
  iris.rf <- randomForest(Species ~ ., data=iris, importance=TRUE,
                          proximity=TRUE)
  return(iris.rf)
}

predictIris <- function(trainedModel, inputs) {
  
  prediction <- predict(trainedModel, newdata=inputs, type = "prob")
  return(prediction)
}

shinyServer(
  function(input, output, session){

    #output$irisPlot <- renderPlot({
    #  plot(iris$Petal.Length, iris$Petal.Width, pch=21, 
    #      bg=c("red","green3","blue")[unclass(iris$Species)], main="Edgar Anderson's Iris Data", 
    #      xlab="Petal Length", ylab="Petal Width")
    #  abline(v=input$petalLength)
    #  abline(h=input$petalWidth)
    #  legend("topleft", title="Species", c("Setosa", "Versicolor", "Virginica"),
    #        fill=c("red", "green3", "blue"), )
    #})
    output$irisPlot <- renderPlot({
      upper.panel<-function(x, y){
        points(x,y, pch=19, col=c("red", "green3", "blue")[iris$Species])
        if ((all(x>=2.0)) && (all(x<=4.4)) && (all(y <= 7.9)) && (all(y >= 4.3))){
          abline(h=input$sepalLength)
          abline(v=input$sepalWidth)
        }
        else if ((all(y>=2.0)) && (all(y<=4.4)) && (all(x <=2.5)) && (all(x >= 0.1))){
          abline(v=input$petalWidth)
          abline(h=input$sepalWidth)
        }
        else if ((all(y>=2.0)) && (all(y<=4.4)) && (all(x <= 6.9)) && (all(x >= 1.0))){
          abline(v=input$petalLength)
          abline(h=input$sepalWidth)
        }
        else if ((all(x>=1.0)) && (all(x<=6.9)) && (all(y <= 7.9)) && (all(y >= 4.3))){
          abline(h=input$sepalLength)
          abline(v=input$petalLength)
        }
        else if ((all(x>=0.1)) && (all(x<=2.5)) && (all(y <= 7.9)) && (all(y >= 4.3))){
          abline(h=input$sepalLength)
          abline(v=input$petalWidth)
        }
        else if ((all(x>=0.1)) && (all(x<=2.5)) && (all(y <= 6.9)) && (all(y >= 1.0))){
          abline(h=input$petalLength)
          abline(v=input$petalWidth)
        }
      }
      pairs(iris[,1:4], lower.panel = NULL, 
            upper.panel = upper.panel)
      par(xpd=TRUE)
      legend(0.1, 0.3, as.vector(unique(iris$Species)),  
             fill=c("red", "green3", "blue"))
      })
    
    output$guessOutput <- renderText({paste("For petal length ", input$petalLength, "cm and petal width ", 
                                        input$petalWidth, "cm, with sepal length ", input$sepalLength, 
                                      " cm and sepal width", input$sepalWidth,"cm, you guessed that the species is ", 
                                      input$SpeciesInput)})
    builtModel <- reactive({
      buildRandomForestModel()
    })
    
    observeEvent(
      eventExpr = input[["submit"]],
      handlerExpr = {
        withProgress(message = "Just a moment whilst we're predicting...", value = 0, {
          myModel <- builtModel()
        })
        Sepal.Length <- input$sepalLength
        Sepal.Width <- input$sepalWidth
        Petal.Length <- input$petalLength
        Petal.Width <- input$petalWidth
        myEntry <- data.frame(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
        
        myPrediction <- predictIris(myModel, myEntry)
        output$predictionOutput <- renderTable(myPrediction)
        output$correctOutput <- renderText({if (c("Setosa", "Versicolor", "Virginica")[which.max(myPrediction)] == input$SpeciesInput)
          {
          "Correct!"
        }
          else{
            paste("Incorrect. The right guess was " , c("Setosa", "Versicolor", "Virginica")[which.max(myPrediction)])
          }})
      })

    observeEvent(input[["reset"]], {
      updateNumericInput(session, "sepalWidth", value = round(mean(iris$Sepal.Width), 1))
      updateNumericInput(session, "sepalLength", value = round(mean(iris$Sepal.Length), 1))
      updateNumericInput(session, "petalWidth", value = round(mean(iris$Petal.Width), 1))
      updateNumericInput(session, "petalLength", value = round(mean(iris$Petal.Length), 1))
    })
})