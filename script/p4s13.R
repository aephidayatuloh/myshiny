library(shiny)

ui <- fluidPage(
  # Define CSS inside a shiny
  HTML('<style>
       h1 {
          color: #5ba1eb;
       }
       p {
          color: #4da34d;
       }
       </style>'),
  
  h1("My First Heading"), 
  p("My first paragraph")
)

server <- function(input, output){
  
}

shinyApp(ui, server)
