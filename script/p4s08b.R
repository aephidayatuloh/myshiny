library(shiny)

ui <- fluidPage(
  titlePanel(title = NULL, windowTitle = "Page Title"), 
  h1("My First Heading"), 
  p("My first paragraph")
)

server <- function(input, output){
  
}

shinyApp(ui, server)