library(shiny)

ui <- fluidPage(
  titlePanel("Reactivity Demo"),
  numericInput("nrows", "Upload Iris Data", value = 6, min = 1, max = 20), 
  actionButton("process", "Process"), 
  tableOutput("head_data")
)

server <- function(input, output, session){
  
  output$head_data <- renderTable({
    
    nrows <- isolate(input$nrows)
    
    head(iris, n = nrows)
  })
  
}

shinyApp(ui, server)

