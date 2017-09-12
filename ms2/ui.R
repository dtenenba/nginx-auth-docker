cat(file=stderr(), "uitop catting to stderr\n")
cat(file=stdout(), "uitop catting to stdout\n")


shinyUI(pageWithSidebar(
  headerPanel("Shiny Client Data"),
  sidebarPanel(
    uiOutput("headers")
  ),
  mainPanel(
    h3("Headers passed into Shiny"),
    verbatimTextOutput("summary"),
    h3(paste("Value of specified header", Sys.getenv("HAHA", "nothing"))),
    verbatimTextOutput("value")
  )
))

cat(file=stderr(), "uibot catting to stderr\n")
cat(file=stdout(), "uibot catting to stdout\n")
flush.console()
