#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
  
  output$main_plot <- renderPlot({
    hist(rnorm(input$observations,mean=0,sd=1),
         probability = TRUE,
         breaks = as.numeric(input$n_breaks),
         xlab = "Observations",
         main = "Standard Normal Distribution")
    
    
    if (input$density) {
      dens <- density(rnorm(input$observations,mean=0,sd=1),
                      kernel = input$kernel,
                      adjust = input$bw_adjust)
      lines(dens, col = "blue")
    }
    
  })
})