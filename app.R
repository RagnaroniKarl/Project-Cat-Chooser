

#package necessary to intall in order to run our app 

#install.packages("shiny")
#install.packages("leaflet")
#install.packages("shinydashboard")
#install.packages("shinythemes")
#install.packages("dplyr")
#install.packages("rvest")



#this is the cat chooser shiny page

library(shiny)
library(leaflet)
library(shinydashboard)
library(shinythemes)
library(rvest)
library(dplyr)

# Define UI for application that draws a histogram
ui <- fluidPage(theme = shinytheme("darkly"),
                
                
                # Application title
                titlePanel(
                  h1("Welcome to CatChooser.com!", style = "color:green", align = 'center'),
                ),
                
                #Sidebar panel
                #sidebarLayout(
                #sidebarPanel(),
                
                #Main panel with tabs
                #mainPanel(
                tabsetPanel(type = "tab", 
                            
                            
                            
                            #Introduction Tab  
                            
                            tabPanel("Introduction",
                                     div(
                                       style = "text-align: justify;",
                                       h4("Welcome to our web application, your ultimate destination for everything cat-related.", style = "color:green"),
                                       br(),
                                       p("Whether you're a proud cat owner, a cat enthusiast, or someone looking to learn more about these fascinating creatures, you've come to the right place."),
                                       br(),
                                       p("Our application is designed to provide you with a comprehensive experience when it comes to cat knowledge, veterinary services, and information about different cat breeds. Whether you're seeking advice on daily care, health, nutrition, or cat behavior, our application is filled with reliable resources and informative content written by experts."),
                                       br(),
                                       p("One of the key features of our application is the ability to find cats available for adoption. We work closely with shelters and animal protection associations to help you find the perfect feline companion for your home. We will display all local nearby vets on a map with information about them.", align = 'left'),
                                       br(),
                                       p("We understand that your cat's health is a top priority. That's why our application also allows you to find veterinarians specialized in feline care near your location. You can explore veterinarian profiles, read customer reviews, and book appointments online, all with just a few clicks."),
                                       br(),
                                       p("Additionally, our application offers a dedicated section on different cat breeds. Whether you're curious to discover the unique characteristics of certain breeds or want to learn more about the history and evolution of cats, our informative content will provide you with the answers you seek."),
                                       br(),
                                       p("Join our community of cat lovers today and dive into the wonderful world of these adorable felines. Download our application and access a wealth of information, trusted veterinary resources, and an opportunity to adopt a feline companion that will brighten your life."),
                                       br(),
                                       p("Welcome to the world of cats!")
                                     ),
                                     img(src = "kitten-adoption.jpg", height = 290, width = 590, align = 'right')
                            ),
                            
                            
                            
                            
                            #Cat Breeds Tab 
                            tabPanel("Different Cat Breeds",
                                     h4("This is the section where we provide information about each cat breed from their look, their personalities, prices to their lifespan and much more.", style = "color:green"),
                                     br(),
                                     p("We will show an image of the selected cat breed, display important information about that particular cat breed including : Description of the Breed, Average Lifespan, Average Weight and Size, Average Price, What that Cat Breed is good with (Dogs, Kids, etc)."),
                                     br(),
                                     selectInput("catbreeds", h3("Select your cat breed :"),
                                                 choices = c("         ", "Abyssinian", "American Bobtail", "American Shorthair", "Balinese", "Bengal", "Birman", "Bombay", "British Shorthair", "Devon Rex", "Domestic Longhair", "Exotic Shorthair", "Himalayan", "Maine Coon", "Norwegian Forest", "Persian", "Ragdoll", "Savannah", "Scottish Fold", "Siamese", "Sphynx"), selected = "         "),
                                     textOutput("selected_catbreeds"),
                                     br(),
                                     uiOutput(("catbreedimage")), 
                            ),
                            #Vets near me tab!
                            tabPanel("Vetenarians Near Me", p("This is the page where you can find nearby vets for all of your cat's needs")),
                            
                            
                            
                            
                            
                            
                            #Adoptions Centers
                            tabPanel("Adoption Centers Near Me",p("This is the page where you can find the nearest adoption centers to find your next best friend!")),
                            
                            #Random Cat Facts
                            tabPanel("Random Cat Facts", p("These are some random cat facts you may find very interesting!"),),
                            #About us 
                            tabPanel("About Us",p("This is the About Us page. Feel free to learn more about us, the reason behind this site and much more."))),
                
                
                
                
                # )
                #)
)

#outputs
server <- function(input, output) {
  
  #image display loop for cat breeds
  
  output$catbreedimage <- renderUI({
    if(input$catbreeds == "Abyssinian"){
      
      img(height = 240, width = 300, src = "abyssinian.jpg")
      
    } else if (input$catbreeds == "American Bobtail") {
      
      img(height = 200, width = 300, src = "american-bobtail.jpg")
      
    } else if (input$catbreeds == "American Shorthair") {
      
      img(height = 200, width = 300, src = "american-shorthair.jpg")
      
    } else if (input$catbreeds == "Balinese") {
      
      img(height = 200, width = 300, src = "balinese.jpg")
      
    } else if (input$catbreeds == "Bengal") {
      
      img(height = 200, width = 300, src = "bengal.jpg")
      
    } else if (input$catbreeds == "Birman") {
      
      img(height = 200, width = 300, src = "birman.jpg")
      
    } else if (input$catbreeds == "Bombay") {
      
      img(height = 200, width = 300, src = "bombay.jpg")
      
    } else if (input$catbreeds == "British Shorthair") {
      
      img(height = 200, width = 300, src = "british-shorthair.jpg")
      
    } else if (input$catbreeds == "Devon Rex") {
      
      img(height = 200, width = 300, src = "devon-rex.jpg")
      
    } else if (input$catbreeds == "Domestic Longhair") {
      
      img(height = 200, width = 300, src = "domestic-longhair.jpg")
      
    } else if (input$catbreeds == "Exotic Shorthair") {
      
      img(height = 200, width = 300, src = "exotic-shorthair")
      
    } else if (input$catbreeds == "Himalayan") {
      
      img(height = 200, width = 300, src = "himalayan.jpg")
      
    } else if (input$catbreeds == "Maine Coon") {
      
      img(height = 200, width = 300, src = "maine-coon.jpg")
      
    } else if (input$catbreeds == "Norwegian Forest") {
      
      img(height = 200, width = 300, src = "kitten-adoption.jpg")
      
    } else if (input$catbreeds == "Persian") {
      
      img(height = 200, width = 300, src = "persian.jpg")
      
    } else if (input$catbreeds == "Ragdoll") {
      
      img(height = 200, width = 300, src = "ragdoll.jpg")
      
    } else if (input$catbreeds == "Savannah") {
      
      img(height = 200, width = 300, src = "savannah.jpg")
      
    } else if (input$catbreeds == "Scottish Fold") {
      
      img(height = 200, width = 300, src = "scottish-fold.jpg")
      
    } else if (input$catbreeds == "Siamese") {
      
      img(height = 200, width = 300, src = "kitten-adoption.jpg")
      
    } else if (input$catbreeds == "Sphynx") {
      
      img(height = 200, width = 300, src = "sphynx.jpg")
      
    } else {
      
    }
    
    
  })
  
  #prints the name of the cat breed selected
  
  output$selected_catbreeds <- renderText({
    
    if(input$catbreeds == "         "){
      
    }else{
      
      paste("You have selected the ", input$catbreeds)
      
    }
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
