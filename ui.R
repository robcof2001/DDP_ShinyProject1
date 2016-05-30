library(shiny)
library(caret)
library(lattice)
shinyUI (
  navbarPage("Predict Your Vehicle's MPG", 
    tabPanel ("Prediction",
                  sidebarPanel (
                      numericInput('cyl', 'Cylinders (values from 3 to 8)', 4, min = 3, max= 8, step = 1),
                      numericInput('disp', 'Displacement (values from 70 to 450)', 190, min = 70, max= 450, step = 10),
                      numericInput('horse', 'Horsepower (values from 50 to 230)', 100, min = 50, max= 230, step = 5),
                      numericInput('weight', 'Weight (values from 1650 to 5000)', 3000, min = 1650, max= 5000, step = 50),
                      numericInput('accel', 'Acceleration (values from 8 to 24)', 15, min = 8, max= 24, step = 1),
                      numericInput('year', 'Year (values from 70 to 82)', 75, min = 70, max= 82, step = 1),
                      numericInput('origin', 'Origin (values from 1 to 3)', 2, min = 1, max= 3, step = 1),
                      submitButton('Submit')
                  ),
                  mainPanel (
                    h3 ('Results of prediction'),
                    h4 ('Your Vehicle\'s Predicted MPG:'),
                    verbatimTextOutput("prediction")
                  )
    ), # end of "Prediction" tab panel
    
    tabPanel("About",
             mainPanel(
               includeMarkdown("About.Rmd")
             )
    ) # end of "About" tab panel
  )
)