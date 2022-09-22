library(shiny)
# install.packages("shinymanager")
library(shinymanager)

credentials <- data.frame(
  user = c("shiny", "shinymanager"), # mandatory
  password = c("azerty", "12345"), # mandatory
  start = c("2019-04-15"), # optinal (all others)
  expire = c(NA, "2022-12-31"),
  admin = c(FALSE, TRUE),
  stringsAsFactors = FALSE
  )

create_db(
  credentials_data = credentials,
  sqlite_path = "database.sqlite"
  )

ui <- fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "bins", label = "Number of bins:",
                  min = 1, max = 50, value = 30)
      ),
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
)

ui <- secure_app(ui, enable_admin = TRUE)

server <- function(input, output, session) {
  result_auth <- secure_server(
    check_credentials = check_credentials("database.sqlite")
  )
  user <- reactive(result_auth$user)
  
  output$distPlot <- renderPlot({
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
  })
}

shinyApp(ui = ui, server = server)