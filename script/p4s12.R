library(shiny)

ui <- fluidPage(
  div(class = "text-warning", 
      titlePanel("Hello Shiny!")
  ),
  sidebarLayout(
    sidebarPanel(
      div(class = "text-primary", 
          sliderInput(inputId = "bins", 
                      label = HTML("<i>Number of bins:</i>"),
                      min = 1, max = 50, value = 30)
      ), 
      actionButton("go_btn", "Update", 
                   class = "btn btn-info btn-block text-white")
    ),
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    input$go_btn
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = isolate(input$bins) + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
  })
}

shinyApp(ui = ui, server = server)