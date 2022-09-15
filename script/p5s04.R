library(shiny)

ui <- fluidPage(
  actionButton("show", "Show")
)

server <- function(input, output, session) {
  observeEvent(input$show, {
    showNotification(ui = "Message text notification 'default'", 
                     type = "default", session = session)
    showNotification(ui = "Message text notification 'message'", 
                     type = "message", session = session)
    showNotification(ui = "Message text notification 'warning'", 
                     type = "warning", session = session)
    showNotification(ui = "Message text notification 'error'", 
                     type = "error", session = session)
  })
}

shinyApp(ui, server)