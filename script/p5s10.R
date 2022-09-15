library(shiny)
library(shinyalert)

ui <- basicPage(
  actionButton("show", "Show modal dialog")
)

server <- function(input, output, session) {
  observeEvent(input$show, {
    shinyalert(type = "info", 
               title = "First Alert",
               callbackR = function(x){
                 if(isTRUE(x)){
                   shinyalert(type = "success", 
                              title = "Yeeay!")
                 }
               }
    )
  })
}

shinyApp(ui, server)