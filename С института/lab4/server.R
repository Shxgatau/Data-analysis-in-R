require(rvest)
a = "https://xkcd.com/"

shinyServer(function(input, output) {
  output$comic <- renderUI({
    #outfile <- tempfile(fileext = '.png')
    #png(outfile, width = 400, height = 300)
    b = paste(a,input$num,sep="")
    br = read_html(b)
    res <- html_attr(html_node(br, "#comic img"), "src")
    res = paste("https:",res,sep="")
    tags$img(src=res, width = 400, height = 300)
    #list(src = res,
       #  contentType = 'image/png',
       #  width = 400,
        # height = 300,
        # alt="This is alternate text")
  })
})