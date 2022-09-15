library(shiny)

ui <- fluidPage(
  tags$head(
    tags$script('
                // This recieves messages of type "testmessage" from the server.
                Shiny.addCustomMessageHandler("testmessage",
                  function(message) {
                    alert(JSON.stringify(message));
                  }
                );
                ')
  ),
  actionButton("show", "Show")
)

server <- function(input, output, session) {
  # An observer is used to send messages to the client.
  # The message is converted to JSON
  observeEvent(input$show, {
    session$sendCustomMessage(type = 'testmessage',
                              message = 'this is a welcome message')
  })
}

shinyApp(ui, server)