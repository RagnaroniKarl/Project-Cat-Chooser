
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
  
  #Sidebar panel
  sidebarLayout(
    sidebarPanel(
      #h3("About us : "),
      #p("This is a web application", 
        #strong(" for our Data Science project,",),
        #" so we decided on this! CatChooser! We think it will be very useful for many people who are interested by cats."),
      #br(),
      #p("We are three people who are working on this project. So we'll see how everything goes!"),
      
      #dateInput("date",
                #h3("Input your Date here", style = "color:orange"),
                #value = "2023-04-23")
    ),
    
    #Main panel with tabs
    mainPanel(
      h1("This will be the main page of the site"),
      p("Please choose the feature/function you need to use currently!", style = "font-family: 'times"),
      tabsetPanel(type = "tab", 
                  tabPanel("Introduction", strong("This is the introduction page. Thank you for using our website!"), textOutput("introduction")),
                  tabPanel("Different Cat Breeds",p("This is the section that talks about the various cat breeds, their personalities, prices, lifespan and much more.
    We will show an image of the selected cat breed, display important information about that particular cat breed including : "), 
     br(),                      
    p("- Description of the Breed"),
    br(),
    p("- Average Lifespan"),
    br(),
    p("- Average Weight and Size"),
    br(),
    p("- Average Price"),
    br(),
    p("- What that Cat Breed is good with (Dogs, Kids, etc)."),  textOutput("breeds")),
                  tabPanel("Vetenarians Near Me", p("This is the page where you can find nearby vets for all of your cat's needs!"), textOutput("vets")),
                  tabPanel("Adoption Centers Near Me",p("This is the page where you can find the nearest adoption centers to find your next best friend!"), textOutput("adoption")),
                  tabPanel("About Us",p("This is the About Us page. Feel free to learn more about us, the reason behind this site and much more."), textOutput("aboutus"))),
      selectInput("catbreeds", h3("Select your cat breed :"),
                  choices = c("         ", "Abyssinian", "American Bobtail", "American Shorthair", "Balinese", "Bengal", "Birman", "Bombay", "British Shorthair", "Devon Rex", "Domestic Longhair", "Exotic Shorthair", "Himalayan", "Maine Coon", "Norwegian Forest", "Persian", "Ragdoll", "Savannah", "Scottish Fold", "Siamese", "Sphynx"), selected = "         "),
   textOutput("selected_catbreeds")
     )
  )
)

#outputs
server <- function(input, output) {
  
  introduction <- ({
    "This is the introduction page. Thank you for using our website!"
  })
  
  breeds <- ({
    p("This is the section that talks about the various cat breeds, their personalities, prices, lifespan and much more.
    We will show an image of the selected cat breed, display important information about that particular cat breed including :
    - Description of the Breed
    - Average Lifespan
    - Average Weight and Size
    - Average Price
    - What that Cat Breed is good with (Dogs, Kids, etc).")
  })
  
  vets <- ({
    "This is the page where you can find vets nearby for all of your cat's needs!"
  })
  
  adoption <- ({
    "This is the page where you can find the nearest adoption centers to find your next best friend!"
  })
  
  aboutus <- ({
    "This is the About Us page. Feel free to learn more about us, the reason behind this site and more"
  })
  
  output$introduction <- renderPrint({
    introduction
  })
  
  output$breeds <- renderPrint({
    breeds
  })
  
  output$vets <- renderPrint({
    vets
  })
  
  output$adoption <- renderPrint({
    adoption
  })
  
  output$aboutus <- renderPrint({
    aboutus
  })
  
  output$selected_catbreeds <- renderText({
    paste("You have selected the ", input$catbreeds)
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

