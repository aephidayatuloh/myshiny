library(shiny)

ui <- fluidPage(
  # Define CSS inside a shiny
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css")
  ),
  
  h1("My First Heading no style"), 
  p("My paragraph no style"),
  
  div(class = "class-style", 
      h1("My First Heading with style", class = "h1-color"), 
      p("My first paragraph with style", class = "p-color", style="font-size: 18px;")
  ), 
  textInput("id_default", label = "Text Label Default"), 
  div(class = "class-style", style = "font-family: times;", 
      textInput("id_style", label = "Text Label Italic")
  ),
  div(id = "id-text", "Styled Text")
)

server <- function(input, output){}

shinyApp(ui, server)
