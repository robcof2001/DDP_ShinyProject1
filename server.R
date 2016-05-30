# Load libraries
library(shiny)
library(RCurl)
library(caret)
library(lattice)

# Read data csv
m <- read.csv("mpg.csv")

# Train model with model glm
modFit <- train(mpg ~ cyl + disp + horse + weight + accel + year + origin, method="glm", data=m)

# Server
shinyServer(
  function(input, output) {
    output$prediction <- renderPrint ({
      cyl = input$cyl
      disp = input$disp
      horse = input$horse
      weight = input$weight
      accel = input$accel
      year = input$year
      origin = input$origin
      predict(modFit,data.frame(cyl, disp, horse, weight, accel, year, origin))})
  }
)