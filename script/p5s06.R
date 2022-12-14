library(shiny)

ui <- basicPage(
  actionButton("show", "Show modal dialog")
)

server <- function(input, output, session) {
  observeEvent(input$show, {
    showModal(modalDialog(
      title = "Important message",
      "This is an important message!",
      easyClose = TRUE
    ))
  })
}

shinyApp(ui, server)