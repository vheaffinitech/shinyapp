library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Car dataset"),

  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    selectInput("variableX", label="Variable X :",
                choices = list("Cylinders" = "cyl", 
                               "Gears" = "gear",
                               "Mpg" = "mpg",
                               "Horsepower" = "hp",
                               "Weight" = "wt"),
                selected = "hp"),
    selectInput("variableY", label="Variable Y :",
                choices = list("Cylinders" = "cyl",  
                               "Gears" = "gear",
                               "Mpg" = "mpg",
                               "Horsepower" = "hp",
                               "Weight" = "wt"), 
                selected = "mpg"),
    textInput("optionalCaption", 
              label = "Optional caption :", 
              value = "")
  ),

  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("carPlot"),
    h3("Instructions :"),
    p("Simply select two metrics on the left panels to populate the graph. Optionnaly you can type your own caption.")
  )
))
