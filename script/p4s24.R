library(shiny)
library(bslib)

ui <- fluidPage(
  HTML('
       <!DOCTYPE html>
       <html>
       <head>
       <title>Page Title</title>
       </head>
       
       <body>
       <div class="form-group shiny-input-container">
        <label class="control-label" for="text_id" id="text_id-label">Text Input</label>
        <input type="text" id="text_id" class="form-control">
       </div>
       <div id="out_text" class="shiny-text-output"></div>
       <div class="form-group shiny-input-container">
        <label class="control-label" for="num_id" id="num_id-label">Numeric Input</label>
        <input type="number" id="num_id" class="form-control" value="5">
       </div>
       <div id="out_num" class="shiny-text-output"></div>
       </body>
       </html>
       ')
)

server <- function(input, output) {
  output$out_text <- renderText({
    input$text_id
  })
  
  output$out_num <- renderText({
    input$num_id
  })
}

shinyApp(ui, server)