#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Random Normal Numbers"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            radioButtons("distribution",
                         label = c("normal", "exponential"),
                         choices = c("Norm", "Exp")
                         ),
            sliderInput("nrRandom",
                        "Number of random variables:",
                        min = 1,
                        max = 50,
                        value = 10
                        ),
            submitButton("Apply")
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            h2("Select amount of random variables which should be generated."),
            h3("If you don't trust R, the table below shows all generated numbers."),
            "You selected:", textOutput("dist"),
            tableOutput("summary"),
            plotOutput("histPlot"),
            tableOutput("dataValues")
        )
    )
))
