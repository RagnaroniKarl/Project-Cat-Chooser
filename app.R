

#package necessary to intall in order to run our app 

#install.packages("shiny")
#install.packages("leaflet")
#install.packages("shinydashboard")
#install.packages("shinythemes")




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
                  h1("Welcome to CatChooser.com!", style = "color:#00FF80", align = 'center', img(src = "cat-paw-1.jpg", height = 50, width = 100, align = 'left'), img(src = "cat-paw-3.jpg", height = 50, width = 100, align = 'right'))
                ),
                
                #Sidebar panel
                #sidebarLayout(
                  #sidebarPanel(),
                  
                  #Main panel with tabs
                  #mainPanel(
                    tabsetPanel(type = "tab", 
                                
                                
                                
                                #Introduction Tab  
                                
                                tabPanel("Introduction", h3("Welcome to our web application, your ultimate destination for everything cat-related.", style = "color:green"),
                                    br(),
                                    p("Whether you're a proud cat owner, a cat enthusiast, or someone looking to learn more about these fascinating creatures, you've come to the right place."),
                                    br(),
                                    p("Our application is designed to provide you with a comprehensive experience when it comes to cat knowledge, veterinary services, and information about different cat breeds. Whether you're seeking advice on daily care, health, nutrition, or cat behavior, our application is filled with reliable resources and informative content written by experts."),
                                    br(), 
                                    p("One of the key features of our application is the ability to find cats available for adoption. We work closely with shelters and animal protection associations to help you find the perfect feline companion for your home. We will display all local nearby vets on a map with information about them.", align = 'left', img(src = "kitten-adoption.jpg", height = 200, width = 200, align = 'right')),
                                    
                                    br(),
                                    p("We understand that your cat's health is a top priority. That's why our application also allows you to find veterinarians specialized in feline care near your location. You can explore veterinarian profiles, read customer reviews, and book appointments online, all with just a few clicks."),
                                    br(),
                                    p("Additionally, our application offers a dedicated section on different cat breeds. Whether you're curious to discover the unique characteristics of certain breeds or want to learn more about the history and evolution of cats, our informative content will provide you with the answers you seek.
                                    Join our community of cat lovers today and dive into the wonderful world of these adorable felines. Download our application and access a wealth of information, trusted veterinary resources, and an opportunity to adopt a feline companion that will brighten your life.

                                    Welcome to the world of cats!")),
                                
                                
                                
                                
                                #Cat Breeds Tab 
                                tabPanel("Different Cat Breeds",
                                         h3("This is the section where we provide information about each cat breed from their look, their personalities, prices to their lifespan and much more.", style = "color:green"),
                                         br(),
    p("We will show an image of the selected cat breed, display important information about that particular cat breed including : Description of the Breed, Average Lifespan, Average Weight and Size, Average Price, What that Cat Breed is good with (Dogs, Kids, etc)."),
                                         selectInput("catbreeds", h3("Select your cat breed :"),
                                                choices = c("         ", "Abyssinian", "American Bobtail", "American Shorthair", "Balinese", "Bengal", "Birman", "Bombay", "British Shorthair", "Devon Rex", "Domestic Longhair", "Exotic Shorthair", "Himalayan", "Maine Coon", "Norwegian Forest", "Persian", "Ragdoll", "Savannah", "Scottish Fold", "Siamese", "Sphynx"), selected = "         "),
                                         textOutput("selected_catbreeds"),
                                         br(),
                                         uiOutput(("catbreedimage")), 
                                         br(),
                                         uiOutput("catbreedinfo"),
                                ),
                                #Vets near me tab!
                                tabPanel("Vetenarians Near Me", h3("This is where you can find local vets in your area!", style = "color:green")),
                               
                                
                                
                                
                                
                                
                                #Adoptions Centers
                                tabPanel("Adoption Centers Near Me", h3("If you're looking for a new friend, this is the right place to look!", style = "color:green")),
                                
                                #Random Cat Facts
                                tabPanel("Random Cat Facts", h3("Here are some random cat facts you may find very interesting!", style = "color:green"),),
                                
                                #About us 
                                tabPanel("About Us",h3("This is the About Us page. We will talk a bit about why we made this site and other such details.", style = "color:green"))),
                    
                    
                    
                    
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
  
  #output$selected_catbreeds <- renderText({
    
    #if(input$catbreeds == "         "){
      
    #}else{

    #paste("You have selected the ", input$catbreeds, ".")
      
    #}
    #I decided to torture my retarded ass here...
    output$catbreedinfo <- renderUI({
      if(input$catbreeds == "Abyssinian"){
        
        p("The Abyssinian cat is believed to be the cat breed once owned by the kings of Ancient Egypt : the Pharaohs, however some people believe they are the result of Victorian English catbreeders where the name comes from, they were imported from Abyssinia, today's Ethiopia. The Abyssinian is a short haired cat that doesn't shed. It's color can best be described as a reddish-brown or 'ruddy' base with black ticking, a trait of tabby cats. It has either green or gold/sulfrur eyes", 
        br(), 
        br(), 
        "The Abyssinian has a lifespan of about 9 to 15 years. They can be between 30 and 40 cm in length. Unfortunately for some, it is a somewhat hypoallergenic cat. They are friendly with kids and even get along with pets, they make generally good family cats. They tend to be more on the quiet end, with a low tendency to vocalize. The average price of an Abyssinian ranges from CHF500 to CHF1'200.", 
        br(), 
        br(), 
        "The Abyssinian is generally healthy however they do have a few common problems, three in particular :", 
        br(), 
        br(), 
        "Periodontal disease: an infection of the tissues that hold the teeth in place", 
        br(), 
        br(), 
        "Patellar luxation: hereditary tendency to experience dislocation of a kneecap", 
        br(), 
        br(), 
        "Progressive retinal atrophy: a degenerative eye disease that can lead to blindness.", 
        br(), 
        br(), 
        "If you have worries about your cat's health, please consult our vetenarian page to find a practician to help you!", 
        br(), 
        br(), 
        "If you want to learn more about the Abyssinian cat, please visit the following site : ", 
        a("The Cat Fanciers' Association", href = "https://cfa.org/abyssinian/") )
        
      } else if (input$catbreeds == "American Bobtail"){
        
        p("The American Bobbtail cat is immediately recognizable by its short tai, generally between one third to one half the size of a regular cat tail, and lynx-like features. In terms of their colors, they have all the standard cat colors like grey, black, orange and white however breeders prefer to give them the colors that make them look like their wild counterparts. It is believed that they came into existance in the late 1960s because of efforts by breeders. When it goes to their eye color, they can have all the standard colors such as green, blue, gold/sulfur and copper.", 
          br(), 
          br(), 
          "The American Bobtail cat has an expected lifespan of 13 to 18 years. They can be up to 76 cm in length, male American Bobtail cats will be larger than their female counterparts. They can weigh up to 7.25 kilograms. They are not hypoallergenic cats. American Bobtails are prone to moderate shedding and can be moderately talkative. The average price for an American Bobtail cat is between CHF600 and CHF1200.", 
          br(), 
          br(), 
          "Like most cats, they are relatively healthy but have some common health conditions associated with the breed :", 
          br(), 
          br(), 
          "Polycystic kidney disease (PKD) : A condition characterized by the development of cystst on one or both kidneys.", 
          br(), 
          br(), 
          "Hypertrophic cardiomyopathy : The thickening of the heart muscle. ", 
          br(), 
          br(), 
          "If you have worries about your cat's health, please consult our vetenarian page to find a practician to help you!", 
          br(), 
          br(), 
          "If you want to learn more about the American Bobtail cat, please visit the following site : ", 
          a("The Cat Fanciers' Association", href = "https://cfa.org/american-bobtail/"))
        
      } else if (input$catbreeds == "American Shorthair"){
        
        p("The American Shorthair is a cat that can trace its origins to the European settlers that moved to North America. They were valued on the ships for that rodent hunting abilities. Some were even belived to be present on the famous, to Americans of course, Mayflower ship. For this and many other reasons, they are one of the most popular cat breeds on the North American continent. For coloring, they can be white, silver (light grey), black, cream, brown and red. These colorings are found under mostly the tabby cat pattern (see image), however calico, tortoiseshell, bi-color and solid do exist. Their eyes can be gold, blue, copper or green.", 
          br(), 
          br(), "The American Shorthaire can live up to 15 to 20 years if well taken care of. They can be between 30 and 38 cm in legth and can weigh between 4.5 and 6.8 kilograms. American Shorthair cats are not hypoallergenic cats so people with allergies should go well with them. They are moderately prone to shedding and vocalizing and they are very family friendly cats being good with little kids and other pets. When it comes to price, the American Shorthair is more afforable than many other cats on this site, ranging from CHF500 to CHF800.", 
          br(), 
          br(), 
          "The American Shorthair cat is especially lucky in terms of its health, unlike many other breeds, they are not prone to any breed specific issues which makes them lower maintenance cats.",
          br(),
          br(), 
          "If you want to learn more about the American Shorthair cat, please visit the following site: ",
          a("The Cat Fanciers' Association", href = "https://cfa.org/american-shorthair/"))
        
      } else if (input$catbreeds == "Balinese"){
        
        p("")
        
      } else if (input$catbreeds == "Bengal"){
        
        p("")
        
      } else if (input$catbreeds == "Birman"){
        
        p("")
        
      }
      
      
    })
    
  #})
  
  
  
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)