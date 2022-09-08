library(shiny)
library(shinydashboard)

ui<- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  dashboardBody(),
  title = "Dashboard example"
)
server = function(input, output) { }

shinyApp(ui, server)