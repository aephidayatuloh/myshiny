library(shiny)

ui <- fluidPage(
  titlePanel("Page Title"), 
  h1("My First Heading"), 
  p("My first paragraph"),
  sidebarLayout(
    sidebarPanel(), 
    mainPanel()
  )
)

server <- function(input, output){
  
}

shinyApp(ui, server)
