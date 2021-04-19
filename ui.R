#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(plotly)

shinyUI(bootstrapPage(
  headerPanel("Kernel Density Estimation (KDE)"),
  tags$a(href="https://binghuzk.shinyapps.io/KDE_APP", "Help documentation"),
  
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "n_breaks", 
                label = "Please enter an integer from 1 - 50 for # of bins: ", 
                value = "25", width = NULL, placeholder = NULL),
      sliderInput(inputId = "observations",
                  label = "Number of observations:",
                  min = 10,
                  max = 1000,
                  value = 500),
      checkboxInput(inputId = "density",
                    label = strong("Show density estimate"),
                    value = FALSE)
    ),
    
    mainPanel(
      # Display this only if the density is shown
      conditionalPanel(condition = "input.density == true",
                       sliderInput(inputId = "bw_adjust",
                                   label = "Bandwidth adjustment:",
                                   min = 0.2, max = 2, value = 1, step = 0.2)),
      
      
      conditionalPanel(condition = "input.density == true",
                       radioButtons(inputId = "kernel", label = h3("Type of Kernel:"),
                                    choices = list("Gaussian" = "gaussian",
                                                   "Epanechnikov" = "epanechnikov",
                                                   "Rectangular" = "rectangular",
                                                   "Triangular" = "triangular", 
                                                   "Biweight" = "biweight", 
                                                   "Optcosine" = "optcosine"), 
                                    selected = "Gaussian")
      ),
      
      plotOutput(outputId = "main_plot", height = "300px")
    ), 
                
    position = c("left", "right"),
    fluid = TRUE)
)
)