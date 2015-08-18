library(shiny)
library(datasets)
library("ggplot2")
carData <- mtcars

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
	formulaText <- reactive(function() {
	    paste( input$variableY," ~ ",input$variableX )
	})
  
  showRegression <- reactive(function(){
    input$regression
  })
	
	output$caption <- reactiveText(function() {
	    t <- input$optionalCaption
      if (t != "") {
        t
      } else {
        formulaText()
      }
	})
	
	output$carPlot <- reactivePlot(function() {
	    #plot(as.formula(formulaText()),data = carData))
	    p <- ggplot(carData, aes_string(x=input$variableX, y=input$variableY)) +
	        geom_point(shape=1) +
	        geom_smooth()
      print(p)
	})
})
