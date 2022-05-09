shinyUI(fluidPage(
  titlePanel("Вэб Юмор!"),
  sidebarLayout(
    sidebarPanel(
      numericInput("num",
                   label = h3("Числовой ввод"),
                   value=1)
    ),
    mainPanel(
      h1("Ваш комикс"),
      uiOutput("comic")
    )
)))