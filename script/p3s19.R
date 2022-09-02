library(shiny)

ui <- fluidPage(
  titlePanel("Update Widgets"), 
  textInput("text_", label = NULL, placeholder = "Empty text input"),
  numericInput("numeric_", label = NULL, value = 5), 
  actionButton("go_btn", "Update Widgets")
)

server <- function(input, output, session){
  
  observeEvent(input$go_btn, {
    updateTextInput(session = session, inputId = "text_", value = "Updated!")
    updateNumericInput(session, "numeric_", value = 10)
  })
}

shinyApp(ui, server)