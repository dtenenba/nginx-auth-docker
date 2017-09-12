library(shiny)

cat(file=stderr(), "srvtop catting to stderr\n")
cat(file=stdout(), "srvtop catting to stdout\n")


print("hi there")
flush.console()
print("after flush")

shinyServer(function(input, output, session) {

  output$summary <- renderText({
    ls(env=session$request)
  })

  output$headers <- renderUI({
    selectInput("header", "Header:", ls(env=session$request))
  })

  output$value <- renderText({
    if (nchar(input$header) < 1 || !exists(input$header, envir=session$request)){
      return("NULL");
    }
    return (get(input$header, envir=session$request));
  })
})

cat(file=stderr(), "srvbot catting to stderr\n")
cat(file=stdout(), "srvbot catting to stdout\n")

x = Sys.getenv()
for (key in names(x))
    cat(file=stderr(), key, "=", unname(x[key]), "\n")
# cat(file=stderr(), "environment is\n", Sys.getenv(), "\n")

flush.console()
