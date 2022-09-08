library(shiny)

ui <- HTML('
           <!DOCTYPE html>
            <html>
            <head>
            	<title>Page Title</title>
            </head>
            
            <body>
            <h1>My First Heading</h1>
            <p>My first paragraph.</p>
            </body>
            </html>
           ')

server <- function(input, output){
  
}

shinyApp(ui, server)
