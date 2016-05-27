#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    vec <- reactive({
        if(input$distribution == "Norm")
            rnorm(input$nrRandom)
        else
            rexp(input$nrRandom)
    }) 
    
    output$dist <- renderText(input$distribution)
    
    output$dataValues <- renderTable(data.frame(randValues = vec()))
    
    output$histPlot <- renderPlot({
        # draw the histogram
        hist(vec(), col = 'darkgray', border = 'white')
        
    })
    
    output$summary <- renderTable({
        
        data.frame(min = min(vec()),
                   median = median(vec()),
                   mean = mean(vec()),
                   max = max(vec()),
                   sd = sd(vec())
        )
    })
    
})
