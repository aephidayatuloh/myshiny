library(shiny)

ui <- fluidPage(
  titlePanel("Observe Demo"),
  selectInput("variable", label = "Select Species", 
              choices = c("setosa", "virginica", "versicolor")),
  actionButton("go_btn", label = "Write Filtered Iris Data")
)

server <- function(input, output, session){
  
  observeEvent(input$go_btn, {
    x <- iris[iris$Species == input$variable, ]
    write.csv(x, paste0("observeEvent - ", input$variable, ".csv"))
  })
}

shinyApp(ui, server)