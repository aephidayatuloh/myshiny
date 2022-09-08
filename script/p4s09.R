library(shiny)

ui <- fluidPage(
  titlePanel(title = NULL, windowTitle = "Page Title"), 
  h1("My First Heading"), 
  HTML("<p>My first paragraph</p>")
)

server <- function(input, output){
  
}

shinyApp(ui, server)