library(shiny)
library(shinyalert)

ui <- basicPage(
  actionButton("show", "Show modal dialog")
)

server <- function(input, output, session) {
  observeEvent(input$show, {
    shinyalert(type = "info", 
      title = "Info message",
      text = "This is an info message!"
    )
  })
}

shinyApp(ui, server)