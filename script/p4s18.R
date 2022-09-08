library(shiny)

ui <- fluidPage(
  titlePanel("More Widgets"),
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:",
                  choices = c("rock", "pressure", "cars")),
      numericInput("obs", "Number of observations to view:", 10),
      helpText("Note: while the data view will show only the specified",
               "number of observations, the summary will still be based",
               "on the full dataset."),
      actionButton("update", "Update View")
    ),
    
    mainPanel(
      h4("Summary"),
      verbatimTextOutput("summary")
    )
  )
)

server <- function(input, output) {
  datasetInput <- eventReactive(input$update, {
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  }, ignoreNULL = FALSE)
  
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
}

shinyApp(ui, server)