
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
                            
                            tabPanel("Introduction",
                                     div(
                                       style = "text-align: justify;",
                                       h3("Welcome to our web application, your ultimate destination for everything cat-related.", style = "color:green"),
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
                                     img(src = "kitten-adoption.jpg", height = 290, width = 590, align = 'left')
                            ),
                            
                            
                            
                            
                            #Cat Breeds Tab 
                            tabPanel("Different Cat Breeds",
                                     h3("This is the section where we provide information about each cat breed from their look, their personalities, prices to their lifespan and much more.", style = "color:green"),
                                     br(),
                                     p("We will show an image of the selected cat breed, display important information about that particular cat breed including : Description of the Breed, Average Lifespan, Average Weight and Size, Average Price, What that Cat Breed is good with (Dogs, Kids, etc)."),
                                     selectInput("catbreeds", h3("Select your cat breed :"),
                                                 choices = c("         ", "Abyssinian", "American Bobtail", "American Shorthair", "Balinese", "Bengal", "Bombay", "British Shorthair", "Devon Rex", "Domestic Longhair", "Exotic Shorthair", "Himalayan", "Maine Coon", "Norwegian Forest", "Persian", "Ragdoll", "Savannah", "Scottish Fold", "Siamese", "Sphynx"), selected = "         "),
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
                            tabPanel("About Us",h3("Get to know about us and meet incredible the team", style = "color:green"))),
                
                
                
                
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
  #Information about the various cat breeds
  output$catbreedinfo <- renderUI({
    if(input$catbreeds == "Abyssinian"){
      
      
      p(style = "text-align : justify;",
        "The Abyssinian cat is believed to be the cat breed once owned by the kings of Ancient Egypt : the Pharaohs, however some people believe they are the result of Victorian English catbreeders where the name comes from, they were imported from Abyssinia, today's Ethiopia. The Abyssinian is a short haired cat that doesn't shed. It's color can best be described as a reddish-brown or 'ruddy' base with black ticking, a trait of tabby cats. It has either green or gold/sulfrur eyes", 
        br(), 
        br(), 
        "The Abyssinian has a lifespan of about 9 to 15 years. They can be between 30 and 40 cm in length. Unfortunately for some, it is a somewhat hypoallergenic cat. They are friendly with kids and even get along with pets, they make generally good family cats. They tend to be more on the quiet end, with a low tendency to vocalize. The average price of an Abyssinian ranges from CHF500 to CHF1'200.", 
        br(), 
        br(), 
        h4("Health Issues : "),
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
      
      p(style = "text-align : justify;", 
        "The American Bobbtail cat is immediately recognizable by its short tai, generally between one third to one half the size of a regular cat tail, and lynx-like features. In terms of their colors, they have all the standard cat colors like grey, black, orange and white however breeders prefer to give them the colors that make them look like their wild counterparts. It is believed that they came into existance in the late 1960s because of efforts by breeders. When it goes to their eye color, they can have all the standard colors such as green, blue, gold/sulfur and copper.", 
        br(), 
        br(), 
        "The American Bobtail cat has an expected lifespan of 13 to 18 years. They can be up to 76 cm in length, male American Bobtail cats will be larger than their female counterparts. They can weigh up to 7.25 kilograms. They are not hypoallergenic cats. American Bobtails are prone to moderate shedding and can be moderately talkative. The average price for an American Bobtail cat is between CHF600 and CHF1200.", 
        br(), 
        br(), 
        h4("Health Issues : "),
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
      
      p(style = "text-align : justify;",
        "The American Shorthair is a cat that can trace its origins to the European settlers that moved to North America. They were valued on the ships for that rodent hunting abilities. Some were even belived to be present on the famous, to Americans of course, Mayflower ship. For this and many other reasons, they are one of the most popular cat breeds on the North American continent. For coloring, they can be white, silver (light grey), black, cream, brown and red. These colorings are found under mostly the tabby cat pattern (see image), however calico, tortoiseshell, bi-color and solid do exist. Their eyes can be gold, blue, copper or green.", 
        br(), 
        br(), 
        "The American Shorthair can live up to 15 to 20 years if well taken care of. They can be between 30 and 38 cm in legth and can weigh between 4.5 and 6.8 kilograms. American Shorthair cats are not hypoallergenic cats so people with allergies should go well with them. They are moderately prone to shedding and vocalizing and they are very family friendly cats being good with little kids and other pets. When it comes to price, the American Shorthair is more afforable than many other cats on this site, ranging from CHF500 to CHF800.", 
        br(), 
        br(), 
        h4("Health Issues : "),
        "The American Shorthair cat is especially lucky in terms of its health, unlike many other breeds, they are not prone to any breed specific issues which makes them lower maintenance cats.",
        br(),
        br(), 
        "If you want to learn more about the American Shorthair cat, please visit the following site: ",
        a("The Cat Fanciers' Association", href = "https://cfa.org/american-shorthair/"))
      
    } else if (input$catbreeds == "Balinese"){
      
      p(style = "text-align : justify;",
        "The Balinese looks like a long haired Siamese cat due to a genetic mutation that caused some Siamese to grow longer fur. For their colors, they have the distinctly Siamese look of the white or cream colored body with darker, usually dark brown or grey brown, accents on the face, ears, legs and tail. As for their eyes, they have deep blue eyes that all Siamese cats possess.",
        br(),
        br(),
        "The Balinese has a life expectancy of 12 to 20 years depending on the care of the owner. They can be about 45 cm long in length. When it goes to weight, they can weigh between 3.6 and about 5 kilos. Being related to the Siamese family, the Balinese is a rather noisy cat and they will shed a lot of fur. They are considered hypoallergenic cats. The average Balinese can cost you between CHF400 to CHF1'500.",
        br(),
        br(),
        h4("Health Issues : "),
        "The Balinese, being related to the Siamese is prone to many of the same health conditions as the Siamese. Such health conditions are :",
        br(),
        br(), 
        "Eye problems : Progressive Retinal Atrophy is one of the most common health condition found in Balinese cats. They are also prone to being cross-eyed.",
        br(),
        br(),
        "Liver Amyloidosis (This is when the amyloid proteins are deposited in the liver and reduces liver function and can lead to liver failure",
        br(),
        br(),
        "Respiratory Issues",
        br(),
        br(),
        "Neurological issues : They are prone to Hyperesthesia syndrome which makes them groom themselves excessively and Nystagmus which results in rapid eye movement.",
        br(),
        br(),
        "Heart problems",
        br(),
        br(),
        "If you have worries about your cat's health, please consult our vetenarian page to find a practician to help you!",
        br(),
        br(), 
        "If you want to learn more about the Balinese, please consult the following site : ",
        a("The Cat Fanciers' Association", href = "https://cfa.org/balinese/"))
      
      
    } else if (input$catbreeds == "Bengal"){
      
      p(style = "text-align : justify;",
        "The Bengal cat is a relatively new cat breed, being created when a breeder crossed a Domestic Shorthair with an Asian Leopard cat in the early 1960s. Thanks to its relation to the Asian Leopard cat, the Bengal has inherited many features of that cat. Such features are their leopard-like spots on their fur. These spots can come in many colors including rust, chocolate brown or black. Meanwhile, their coat can be a golden color, sand, orange, rust or brown. It is said that some Bengal cats have fur that shimmers in the sunlight. Their eyes can be either gold or green.",
        br(),
        br(), 
        "The Bengal can live up to 15 years if well taken care of. They can be about 45 cm in length and weigh around 5.5 kilos but some can weigh up to 9 kilos. They are not hypoallergenic cats. They are moderately talkative and go well with pets and little kids. The Bengal cat is on the more expensive end of cat breeds, ranging from CHF1'500 to CHF3'000",
        br(),
        br(),
        h4("Health Issues : "),
        "The Bengal is prone to a few health conditions :",
        br(),
        br(), 
        "Autosomal recessive disorder : this causes early blindness in young cats",
        br(),
        br(),
        "Entropion : the rolling in of the eyelids",
        br(),
        br(),
        "Feline infectious peritonitis, a deadly disease that results from infection by the coronavirus",
        br(),
        br(),
        "If you have worried about your cat's health and how to take care of them, please consult our vetenarian page to find a practician to help you!",
        br(),
        br(),
        "If you are interested in learning more about the Bengal cat, please consult the following site : ",
        a("The Cat Fanciers' Association", href = "https://cfa.org/bengal/"))
      
    } else if (input$catbreeds == "Bombay"){
      
      p(style = "text-align : justify;",
        "The Bombay cat looks like a miniature panther. It has a short black coat of fur and big golden eyes. The Bombay came to be when someone crossed an American Shorthair with a Burmese cat. Apparently the name comes from the breeder who 'created' the Bombay cat. The name is a reference to the famous black panther of India which was the inspiration for the Bombay cat.",
        br(), 
        br(),
        "The Bombay cat can live up to 20 years of age. As for length and weight, the Bombay cat can weigh up to around 7 kilos and be around 50 cm in length. Bombay cats are famously needy cats, they need a lot of attention and playtime. They are also very social and friendly cats so they do well with little kids and pets. However, for those who work a lot, the Bombay cat is not a good fit as they'll get depressed if left alone for long periods of time. They don't shed much and aren't particularily noisy. They are another breed of cat that aren't hypoallergenic. The price for a Bombay cat can range from CHF400 to CHF650.",
        br(),
        br(),
        h4("Health Issues : "),
        "While the Bombay is generally a healthy cat, they are still prone to a few conditions.",
        br(),
        br(),
        "Hypertrophic cardiomyopathy which is the thickening of the heart walls",
        br(),
        br(),
        "Excessive eye tearing or drainage",
        br(),
        br(),
        "Respiratory issues and congestion, this is common with breeds with smaller noses",
        br(),
        br(),
        "If you're interested in learning more about the Bombay cat, please check out the following site : ",
        a("The Cat Fanciers' Association", href = "https://cfa.org/bombay/"))
      
    } else if (input$catbreeds == "British Shorthair"){
      p(style = "text-align : justify;",
        "The British Shorthair is best known for their round heads, round cheeks, large round eyes and firm chins. The British Shorthair has a long history, being present during the first cat show in England in 1871. The name is because the cat was developed naturally without human intervention and is likely Britain's most iconic cat breed. It is a breed famous for being one of the 'blue' cats. However, white, black, orange, tabby, calico, tortoiseshell, silver and many more colors are also present but 'blue' is still by far the most popular. Its fur coat is short and very dense, a striking feature in British Shorthairs. Its eyes can be blue, gold, green, hazel and many others. It is one of the few cats that can have different colors for each eye.",
        br(),
        br(),
        "The average British Shorthair can live for between 12 to 16 years depending on quality of care from the owner. Its length can range from 55 to 65 cm and it can weigh up to 7.7 kilograms with males being larger than females. They aren't hypoallergenic, they're calm, quiet family cats with very little problems. The average British Shorthair can cost you anywhere between CHF400 to CHF3'500, a very wide range.",
        h4("Health Issues : "),
        "The British Shorthair is remarkably not prone to any genetic illnesses they are still prone to some standard issues in particular heart problems",
        br(),
        br(),
        "If you're interested in learning more about the British Shorthair, please check out the following site : ",
        a("The Cat Fanciers' Association", href = "https://cfa.org/british-shorthair"))
    }
    
    
  })
  
  #})
  
  
  
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)
