library(shiny)

ui <- fluidPage(
  # Define CSS inside a shiny
  tags$style('
       .h1-color {color: #5ba1eb;}
       .p-color {color: #4da34d; font-weight: bold;}
       .class-style {font-style: italic;}
       #id-text {
          color: #5880c4; 
          font-weight: bold; 
          font-style: italic; 
          font-size: 18px; 
          text-align: center;
        }
       '),
  
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
