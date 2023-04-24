
#this is the cat chooser shiny page

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
                tags$style(".container-fluid {
                             background-color: #47ADF0;
              }"),


    # Application title
    titlePanel(
      h1("Welcome to CatChooser.com!", style = "color:red"),
    ),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          h3("About us : "),
          p("This is a web application", 
            strong(" for our Data Science project,",),
            " so we decided on this! CatChooser! We think it will be very useful for many people who are interested by cats."),
          br(),
          p("We are three people who are working on this project. So we'll see how everything goes!"),
          
          dateInput("date",
           h3("Input your Date here", style = "color:orange"),
           value = "2023-04-23")
        ),

        # Show a plot of the generated distribution
        mainPanel(
          h1("This will be the main page of the site"),
          p("Please choose the feature/function you need to use currently!", style = "font-family: 'times"),
          tabsetPanel(type = "tab", 
                      tabPanel("First Tab", verbatimTextOutput("item")),
                      tabPanel("Second Tab", verbatimTextOutput("item2")),
                      tabPanel("Third Tab")),
          selectInput("select", h3("Select your cat breed :"),
                      choices = list("Select your breed..." = 1, "Abyssinian" = 2, "American Bobtail" = 3, "American Shorthair" = 4, "Balinese" = 5, "Bengal" = 6, "Birman" = 7, "Bombay" = 8, "British Shorthair" = 9, "Devon Rex" = 10, "Domestic Longhair" = 11, "Exotic Shorthair" = 12, "Himalayan" = 13, "Maine Coon" = 14, "Norwegian Forest" = 15, "Persian" = 16, "Ragdoll" = 17, "Savannah" = 18, "Scottish Fold" = 19, "Siamese" = 20, "Sphynx" = 21), selected = 1)
                      )
        )
        )
    

# Define server logic required to draw a histogram
server <- function(input, output) {

  item <- ({
    "This is some text"
  })
  
  item2 <- ({
    "This is some more text"
  })
  
  output$item <- renderPrint({
    item
  })
  
  output$item2 <- renderPrint({
    item2
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
