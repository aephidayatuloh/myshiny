library(shiny)

ui <- fluidPage(
  titlePanel("Observe Demo"), 
  selectInput("variable", label = "Select Variable", 
              choices = c("setosa", "virginica", "versicolor")), 
  actionButton("go_btn", "Process!"), 
  sliderInput("nbins", "Number of Bins", min = 3, max = 15, value = 5), 
  verbatimTextOutput("summary"), 
  plotOutput("plot_hist")
)

server <- function(input, output, session) {

  reactive_data <- eventReactive(input$go_btn, {
    iris[iris$Species == input$variable, ]
  })
  
  output$summary <- renderPrint({
    summary(reactive_data()$Sepal.Width)
  })
  
  output$plot_hist <- renderPlot({
    hist(reactive_data()$Sepal.Width, breaks = input$nbins + 1)
  })
}

shinyApp(ui, server)
