library(shiny)
library(shinyalert)

ui <- basicPage(
  actionButton("show", "Show modal dialog")
)

server <- function(input, output, session) {
  observeEvent(input$show, {
    r1 <- sample(1:5, 1)
    r2 <- sample(c(1:5)[-r1], 1)
    
    shinyalert(
      title = "Display Image", 
      imageUrl = paste0("images/p", r1, ".jpg"),
      callbackR = function(x){
        if(isTRUE(x)){
          shinyalert(imageUrl = paste0("images/p", r2, ".jpg"), 
                     title = "Yeeay!")
          }
        }
    )
  })
}

shinyApp(ui, server)