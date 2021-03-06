#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("cerulean"),
   
   # Application title
   titlePanel("Recordings"),
   
   # Sidebar layout with input and output definitions ----
   sidebarLayout(
     
     # Sidebar panel for inputs ----
     sidebarPanel(
       
       # Input: Choose dataset ----
       selectInput("dataset", "Choose a dataset:",
                   choices = c("rock", "pressure", "cars")),
       
       # Button
       downloadButton("downloadData", "Download")
       
     ),
     # Main panel for displaying outputs ----
     mainPanel(
       
       tableOutput("table")
       
     )
     
   )
)

# Define server logic to display and download selected file ----
server <- function(input, output) {
  
  # Reactive value for selected dataset ----
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })
  
  # Table of selected dataset ----
  output$table <- renderTable({
    datasetInput()
  })
  
  # Downloadable csv of selected dataset ----
  output$downloadData <- downloadHandler(
    filename = function() {
      paste(input$dataset, ".csv", sep = "")
    },
    content = function(file) {
      write.csv(datasetInput(), file, row.names = FALSE)
    }
  )
  
}

# Create Shiny app ----
shinyApp(ui, server)



