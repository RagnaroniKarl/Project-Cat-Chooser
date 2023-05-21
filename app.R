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
                  h1("Welcome to CatChooser.com!", style = "color:orange", align = 'center', img(src = "cat-paw-1.jpg", height = 50, width = 100, align = 'left'), img(src = "cat-paw-3.jpg", height = 50, width = 100, align = 'right'))
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
                                       h3("Welcome to our web application, your ultimate destination for everything cat-related.", style = "color:orange"),
                                       br(),
                                       p("Whether you're a proud cat owner, a cat enthusiast, or someone looking to learn more about these fascinating creatures, you've come to the right place. CatChooser.com has many features you can use!"),
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
                                     h3("This is the section where we provide information about each cat breed from their look, their personalities, prices to their lifespan and much more.", style = "color:orange"),
                                     br(),
                                     p("We will show an image of the selected cat breed, display important information about that particular cat breed including : Description of the Breed, Average Lifespan, Average Weight and Size, Average Price, What that Cat Breed is good with (Dogs, Kids, etc)."),
                                     selectInput("catbreeds", h3("Select your cat breed :"),
                                                 choices = c("         ", "Abyssinian", "American Bobtail", "American Shorthair", "Balinese", "Bengal", "Bombay", "British Shorthair", "Devon Rex", "Exotic Shorthair", "Himalayan", "Maine Coon", "Norwegian Forest", "Persian", "Ragdoll", "Savannah", "Scottish Fold", "Siamese", "Sphynx"), selected = "         "),
                                     textOutput("selected_catbreeds"),
                                     br(),
                                     uiOutput("catbreedimage"), 
                                     br(),
                                     uiOutput("catbreedinfo"),
                            ),
                            #Vets near me tab!
                            tabPanel("Vetenarians Near Me", 
                                     h3("This is where you can find local vets in your area!", style = "color:orange"),
                                     br(),
                                     p("Below you will find a map with the locations of various vetenarians in the Geneva area. If you want to know more about a specific location, click on the icon and it will display the information about that particular vetenarian."),
                                     br(),
                                     p("The information will be a general rating out of five, regarding :"),
                                     br(),
                                     p(" * The name of the cabinet"),
                                     p(" * The address"),
                                     p(" * The telephone numbers"), 
                                     p(" * The website link if one exists."),
                                     br(),
                                     br(),
                                     leafletOutput("map"),
                            ),
                
                            
                            #Adoptions Centers
                            tabPanel("Adoption Centers Near Me", 
                                     h3("If you're looking for a new friend, this is the right place to look!", style = "color:orange")),
                                     br(),
                                     p("Presented below is a map highlighting the locations of several adoption centers in and around the Geneva area. By clicking on the respective icon, you can access detailed information about each adoption center, including the center's name, address, telephone numbers, their general rating out of 5, and a provided website link."),
                                     br(),
                                     leafletOutput("map")),
                            
                            #Random Cat Facts
                            tabPanel("About Cats", 
                                     h3("Interested in knowing more about cats, their history and more? You're in the right place!", style = "color:orange"),
                                     br(),
                                     br(),
                                     h4(strong("The History of Cats : ")),
                                     p("The relationship between humans and cats started around 10'000 years ago, in the Fertile Crescent where agriculture attracted rodents. This prompted wild cats or 'felix silvestris lybica' to go to the farms to hunt for this now abundant food supply. Thus the mutually benefitial relationship between humans and cats begun. Cats have been domesticated for thousands of years, with the earliest evidence of domesticated cats dating back to ancient Egypt around 4,000 years ago. In ancient Egypt, cats were highly revered and even worshipped, with the goddess Bastet depicted as a woman with the head of a cat. Cats were also seen as protectors of crops and were often kept in households to catch rodents and other pests. From Egypt, the domestication of cats spread to other parts of the world, including Europe and Asia. Cats were often kept on ships to control rat populations, which helped to prevent the spread of disease."),
                                     br(),
                                     img(src = "ancient-egypt.jpg", height = 160, width = 160, align = 'right'), 
                                     br(),
                                     p("In the Middle Ages, cats were often associated with witchcraft and were persecuted along with their human counterparts. However, during the Renaissance, cats regained their popularity as pets and were often depicted in art and literature. Today, cats are one of the most popular pets in the world, with an estimated 95 million domestic cats in the United States alone. They are known for their independent nature, playful personalities, and ability to provide comfort and companionship to their owners."),
                                     br(),
                                     h4(strong("The Feline Family : ")),
                                     p("The feline family, also known as Felidae, is a diverse group of carnivorous mammals that includes domestic cats, lions, tigers, cheetahs, leopards, jaguars, and many others. They are known for their sleek bodies, sharp claws, and keen senses, which make them skilled hunters and predators. Felines are found all over the world, from the African savannah to the forests of Asia and the Americas. They are solitary creatures and are typically active at night, using their excellent night vision to hunt for prey. The feline family is one of the most popular and beloved groups of animals, with domestic cats being one of the most common pets worldwide."),
                                     br(),
                                     img(src = "feline-family.jpg", height = 450, width = 300, align = 'center'),
                                     br(),
                                     h4(strong("Some Fun Facts about Cats :")),
                                     p("- Just like humans, cats can be either right- or left-handed (right- or left-pawed, we suppose). Also just like in humans, females tend to be right-handed, while lefties are predominantly male."),
                                     br(),
                                     p("- Yawning is a behavior that cats use to defuse tense situations. A cat that yawns is signaling to others that they wish to be done with the current interaction. Interestingly enough, that’s exactly what yawning signals in humans too, except it’s seen as way more aggressive when we do it."),
                                     br(),
                                     p("- In Scotland, there’s a tower commemorating a cat named Towser. All Towser did was catch 30,000 mice in her lifetime, undoubtedly saving people from countless diseases as a result."),
                                     br(),
                                     p("- All species of cats are capable of getting high on catnip, including big cats like lions, tigers, and leopards. After all, there’s nothing safer than having a hallucinating tiger running around."),
                                     br(),
                                     p("- Around 5% of cat owners hold birthday parties for their cats, and 47% of cat owners take pictures of their cats almost every day."),
                                     br(),
                                     p("- Cats are notoriously picky eaters — so much so, they’ll refuse a food that they don’t like to the point of starving to death. If your cat isn’t a fan of their new kibble, don’t try to wait them out because you might be waiting a long time indeed."),
                                     br(),
                                     p("- Cats can only move their jaws up and down, not sideways. As a result, they can’t chew large chunks of food. If you’re sharing scraps with your cat (and you really shouldn’t be), then make sure that the pieces are small enough for them to munch on easily."),
                                     br(),
                                     p("- It’s totally normal for cats to sleep as much as 20 hours a day. The only time that you should be concerned about your cat’s sleep is if it changes from its normal pattern. Cats who sleep much more than usual could be ill or depressed, and those who sleep less than usual may also be ill."),
                                     br(),
                                     p("- Felines don’t have collarbones, which is why they can squeeze through any opening that’s at least as big as their head."),
                                     br(),
                                     p("- There are over 200 cats that have a better job than you do. That’s right, they work at Disneyland! Their job is to catch and eat any rodents that may show up, helping to keep the park clean."),
                                     br(),
                                     p("- There have been several famous cat haters throughout history, including the likes of Genghis Khan, Napoleon Bonaparte, and of course, Adolf Hitler."),
                                     br(),
                                     p("- There’s a dispute as to exactly how many breeds of housecats there are. The International Cat Association recognizes 71 individual breeds, while the Cat Fanciers’ Association only recognizes 44."),
                                     br(),
                                     h3(strong("Thank you for reading!"), align = 'center')),
                            
                            #About us 
                            tabPanel("About Us",
                                     br(),
                                     br(),
                                     h3("Get to Know About Us and Meet Our Incredible Team", style = "color:orange"),
                                     br() ,
                                     br() ,
                                     p("Whether you're a proud cat owner, a cat enthusiast, or someone looking to learn more about these fascinating creatures, you've come to the right place. Our application is designed to provide you with a comprehensive experience when it comes to cat knowledge, veterinary services, and information about different cat breeds."),
                                     p("At CatChooser.com, we understand the special bond between humans and their feline companions. That's why we've created an application filled with reliable resources and informative content written by experts. Whether you're seeking advice on daily care, health, nutrition, or cat behavior, our goal is to empower you with the knowledge you need to provide the best care for your furry friends."),
                                     br(),
                                     h4("Key Features of Our Application:"),
                                     br(),
                                     p("1. Cat Adoption: One of the key features of our application is the ability to find cats available for adoption. We work closely with shelters and animal protection associations to help you find the perfect feline companion for your home. Discover the joy of giving a loving home to a cat in need."),
                                     p("2. Find Local Veterinarians: We understand that your cat's health is a top priority. That's why our application allows you to find veterinarians specialized in feline care near your location. Explore veterinarian profiles, read customer reviews, and conveniently book appointments online with just a few clicks."),
                                     p("3. Explore Cat Breeds: Our application offers a dedicated section on different cat breeds. Whether you're curious to discover the unique characteristics of certain breeds or want to learn more about the history and evolution of cats, our informative content will provide you with the answers you seek."),
                                     br(),
                                     h4("Join Our Community of Cat Lovers:"),
                                     br(),
                                     p("CatChooser.com is more than just an application…it's a community of cat lovers. Connect with fellow cat enthusiasts, share stories, and exchange valuable insights. Our goal is to create a space where cat lovers can come together to celebrate the wonderful world of these adorable felines."),
                                     br(),
                                     br(),
                                     h4("Meet Our Ailurophile Team:"),
                                     br(),
                                     p(""),
                                     div(class = "container",
                                         div(class = "row",
                                             
                                             # Colonne 1
                                             div(class = "col-md-4",
                                                 h3("Nelson Chikuru"),
                                                 img(src = "nelson-chikuru petite.jpeg", class = "img-responsive"),
                                                 h4("Marketing Manager:"),
                                                 p("Nelson develops and implements effective marketing strategies, manages campaigns, conducts market research, and oversees brand management. Nelson collaborates with internal teams and external partners for seamless coordination. It requires market knowledge, project management skills, and creative thinking."),
                                                 h4("Contacts :"),
                                                 p(a("Email : nelson.chikuru@etu.unige.ch", href = "mailto:nelson.chikuru@etu.unige.ch")),
                                                 p(a("Téléphone : +41 78 786 24 35", href = "tel:+41 78 786 24 35"))
                                             ),
                                             
                                             # Colonne 2
                                             div(class = "col-md-4",
                                                 h3("Karl Myers"),
                                                 img(src = "karl-mayers Petite.jpeg", class = "img-responsive"),
                                                 h4("Operation Manager :"),
                                                 p("Karl oversees and manages day-to-day operations, ensuring efficient processes, resource allocation, and timely execution of projects. He is responsible for optimizing productivity, streamlining workflows, and achieving operational objectives. It demand strong organizational, problem-solving, and leadership skills. He is also the proud owner of 4 wonderful cats."),
                                                 h4("Contacts :"),
                                                 p(a("Email : karl.myers@etu.unige.ch", href ="mailto:karl.myers@etu.unige.ch")),
                                                 p(a("Téléphone : +41 78 711 50 00", href = "tel:+41 78 711 50 00"))
                                             ),
                                             
                                             # Colonne 3
                                             div(class = "col-md-4",
                                                 h3("Hugo Francisco"),
                                                 img(src = "hugo-francisco Petite.jpeg", class = "img-responsive"),
                                                 h4("Web Architect :"),
                                                 p("Hugo designs and develops high-level architecture for web applications, ensuring scalability, performance, and security. He collaborates with cross-functional teams to define technical requirements and implement best practices. It requires expertise in web technologies, strong problem-solving skills, and a deep understanding of software architecture principles."),
                                                 h4("Contacts :"),
                                                 p(a("Email : hugo.francisco@etu.unige.ch", href = "mailto:hugo.francisco@etu.unige.ch")),
                                                 p(a("Téléphone : +33 6 25 34 52 20",href = "tel:+33 6 25 34 52 20"))
                                             )
                                         )
                                     )
                            )
                )
)

# )
#)


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
      
    } else if (input$catbreeds == "Exotic Shorthair") {
      
      img(height = 200, width = 300, src = "exotic-shorthair")
      
    } else if (input$catbreeds == "Himalayan") {
      
      img(height = 300, width = 300, src = "himalayan.jpg")
      
    } else if (input$catbreeds == "Maine Coon") {
      
      img(height = 200, width = 300, src = "maine-coon-2.webp")
      
    } else if (input$catbreeds == "Norwegian Forest") {
      
      img(height = 200, width = 300, src = "karl-ragnar.jpg")
      
    } else if (input$catbreeds == "Persian") {
      
      img(height = 200, width = 300, src = "persian.jpg")
      
    } else if (input$catbreeds == "Ragdoll") {
      
      img(height = 200, width = 300, src = "ragdoll.jpg")
      
    } else if (input$catbreeds == "Savannah") {
      
      img(height = 200, width = 300, src = "savannah.jpg")
      
    } else if (input$catbreeds == "Scottish Fold") {
      
      img(height = 200, width = 300, src = "scottish-fold.jpg")
      
    } else if (input$catbreeds == "Siamese") {
      
      img(height = 250, width = 350, src = "karl-tiggy-2.jpg")
      
    } else if (input$catbreeds == "Sphynx") {
      
      img(height = 200, width = 300, src = "sphynx.jpg")
      
    } else {
      
    }
    
    
  })
  
  
  #Information about the various cat breeds
  output$catbreedinfo <- renderUI({
    if(input$catbreeds == "Abyssinian"){
      
      
      p(style = "text-align : justify;",
        "The Abyssinian cat is believed to be the cat breed once owned by the kings of Ancient Egypt : the Pharaohs, however some people believe they are the result of Victorian English catbreeders where the name comes from, they were imported from Abyssinia, today's Ethiopia. The Abyssinian is a short haired cat that doesn't shed. It's color can best be described as a reddish-brown or 'ruddy' base with black ticking, a trait of tabby cats. It has either green or gold/sulfrur eyes", 
        br(), 
        br(), 
        "The Abyssinian has a lifespan of about 9 to 15 years. They can be between 30 and 40 cm in length. Luckily for those who are allergic to cats, they are somewhat hypoallergenic cats. They are friendly with kids and even get along with pets, they make generally good family cats. They tend to be more on the quiet end, with a low tendency to vocalize. The average price of an Abyssinian ranges from CHF500 to CHF1'200.", 
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
        a("The Cat Fanciers' Association : Abyssinian", href = "https://cfa.org/abyssinian/") )
      
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
        a("The Cat Fanciers' Association : American Bobtail Cat", href = "https://cfa.org/american-bobtail/"))
      
    } else if (input$catbreeds == "American Shorthair"){
      
      p(style = "text-align : justify;",
        "The American Shorthair is a cat that can trace its origins to the European settlers that moved to North America. They were valued on the ships for that rodent hunting abilities. Some were even belived to be present on the famous, to Americans of course, Mayflower ship. For this and many other reasons, they are one of the most popular cat breeds on the North American continent. For coloring, they can be white, silver (light grey), black, cream, brown and red. These colorings are found under mostly the tabby cat pattern (see image), however calico, tortoiseshell, bi-color and solid do exist. Their eyes can be gold, blue, copper or green.", 
        br(), 
        br(), 
        "The American Shorthair can live up to 15 to 20 years if well taken care of. They can be between 30 and 38 cm in legth and can weigh between 4.5 and 6.8 kilograms. American Shorthair cats are not hypoallergenic cats so people with allergies should beware. They are moderately prone to shedding and vocalizing and they are very family friendly cats being good with little kids and other pets. When it comes to price, the American Shorthair is more afforable than many other cats on this site, ranging from CHF500 to CHF800.", 
        br(), 
        br(), 
        h4("Health Issues : "),
        "The American Shorthair cat is especially lucky in terms of its health, unlike many other breeds, they are not prone to any breed specific issues which makes them lower maintenance cats.",
        br(),
        br(), 
        "If you want to learn more about the American Shorthair cat, please visit the following site: ",
        a("The Cat Fanciers' Association : American Shorthair Cat", href = "https://cfa.org/american-shorthair/"))
      
    } else if (input$catbreeds == "Balinese"){
      
      p(style = "text-align : justify;",
        "The Balinese looks like a long haired Siamese cat due to a genetic mutation that caused some Siamese to grow longer fur. For their colors, they have the distinctly Siamese look of the white or cream colored body with darker, usually dark brown or grey brown, accents on the face, ears, legs and tail. As for their eyes, they have deep blue eyes that all Siamese cats possess.",
        br(),
        br(),
        "The Balinese has a life expectancy of 12 to 20 years depending on the care of the owner. They can be about 45 cm long in length. When it goes to weight, they can weigh between 3.6 and about 5 kilos. Being related to the Siamese family, the Balinese is a rather noisy cat and they will shed a lot of fur. They are considered hypoallergenic cats so they're good for people with allergies. The average Balinese can cost you between CHF400 to CHF1'500.",
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
        a("The Cat Fanciers' Association : Balinese Cat", href = "https://cfa.org/balinese/"))
      
      
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
        a("The Cat Fanciers' Association : Bengal Cat", href = "https://cfa.org/bengal/"))
      
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
        a("The Cat Fanciers' Association : Bombay Cat", href = "https://cfa.org/bombay/"))
      
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
        a("The Cat Fanciers' Association : British Shorthair", href = "https://cfa.org/british-shorthair/"))
    } else if (input$catbreeds == "Devon Rex"){
      p(style = "text-align : justify;",
        "The Devon Rex is often compared to an alien. Its large  ears, giant eyes and rather angular face. It has a somewhat unique coat of fur that can be described as 'wavy'. In terms of fur colors and eye colors, it can have any of the standard cat colors. The breed was discovered in Devonshire, England in 1960 when a woman found a bizarre looking kitten. She thought the kitten was related to the Cornish Rex which is why the breed is called the Devon Rex.",
        br(),
        br(),
        "The average Devon Rex can live for between 9 to 15 years depending on quality of care from the owner. Its length can range up to about 45 cm and it can between 2.7 to 4 kilograms, making them a rather small breed of cat. They are a hypoallergenic breed of cat making them good for people with allergies. The Devon Rex is known to be very active, social and a friendly temperament.The average Devon Rex will cost you between CHF350 to CHF2'500.",
        h4("Health Issues : "),
        "The Devon Rex is unfortunately prone to a few health conditions :", 
        br(),
        br(),
        "Patellar luxation : A luxating patella happens when a knee cap is dislocated. Devon Rexes are believed to be genetically predisposed to the condition.",
        br(),
        br(),
        "Heart Problems : the Devon Rex is predisposed to hypertrophic cardiomyopathy, a type of heart condition.",
        br(),
        br(),
        "Devon Rex Myopathy : this is a muscle weakness condition that usually affects the head and the neck. Symptoms will generally appear between three weeks and six months of age. This is a hereditary and recessive gene for Devon Rexes.",
        "If you're interested in learning more about the Devon Rex, please check out the following site : ",
        a("The Cat Fanciers' Association : Devon Rex", href = "https://cfa.org/devon-rex/"))
    } else if (input$catbreeds == "Exotic Shorthair"){
      p(style = "text-align : justify;",
        "The Exotic Shorthair cat looks a lot like the Persian cat however it does not have the famous long fur of the Persian cat. This is why joked as the 'lazy person's Persian'. When it goes to colors, the Exotic Shorthair can have black, golden, silver, white, bicolor and Himalayan fur colors and its eyes can be gold, green or blue. The Exotic Shorthair came into being when breeders mixed various other breeds like the Persian, American Shorthair and other breeds to create the Exotic Shorthair in the 1950s.", 
        br(),
        br(),
        "The average Exotic Shorthair can live up to around 15 years of age depending on quality of care from the owner. The Exotic Shorthair can be up to 76 cm long and weigh up to around close to 7 kilograms. Like many cats on this list, the Exotic Shorthair isn't hypoallergenic. The Exotic Shorthair is comparatively low energy compared to other felines. This makes them good starter cats for busy people, first-time cat owners and older people. The average Exotic Shorthair can go for around CHF1'500 to CHF2'000 depending on the seller and pedigree.",
        h4("Health Issues : "),
        "Due to inbreeding, the Exotic Shorthair may have a few health conditions such as :",
        br(),
        br(),
        "Polycstic Kidney Disease : The kidneys will be enlarged and will not function properly. Cysts are typically seen in affected cats by their first year alive. This can lead to kidney failure.",
        br(), 
        br(),
        "Breathing problems : Due to their flattened faces, Exotic Shorthairs can suffer from breathing problems, espeically in warm, humid climates. An easy fix for this is to have air-conditioning.",
        br(),
        br(),
        "If you're interested in learning more about the Exotic Shorthair, please check out the following site : ",
        a("The Cat Fanciers' Association : Exotic Shorthair Cat", href = "https://cfa.org/exotic-shorthair/"))
    } else if (input$catbreeds == "Himalayan"){
      p(style = "text-align : justify;",
        "Created when breeders crossed Persian and Siamese cats, the Himalayan is best described as a long haired Siamese. They are actually a relatively young breed of cat, being less than 100 years. They are distinguishable by their white to cream coats and darker extremities like their faces, legs, ears and tail. These extremities can be chocolate, seal or lilac in coloring. As for their eyes, they have the iconic blue eyes of the Siamese cat.", 
        br(),
        br(),
        "A well taken care of Himalayan can live up to 15 years old. The Himalayan can weigh from 3 kilos all the way up to 5 kilograms and have be anywhere between 30 to 40 centimeters in length. They aren't hypoallergenic and their long fur makes them high-maintenance cats as they need daily brushing and care. They generally get along with little kids and pets. If you want to buy a Himalayan cat, it will cost you anywhere between CHF500 to CHF1'000.",
        h4("Health Issues : "),
        "The Himalayan cat is prone to many of the same health conditions as Persians and other Persian derived breeds.",
        br(),
        br(),
        "Polycstic Kidney Disease : The kidneys will be enlarged and will not function properly. Cysts are typically seen in affected cats by their first year alive. This can lead to kidney failure.",
        br(), 
        br(),
        "Respiratory Issues due to their flattened faces, they can have trouble breathing, especially in warm, humid climates. Air-conditioning will make it easier for them.", 
        br(),
        br(),
        "Feline Asthma : This is a serious illness that can be fatal. If you find your cat frequently coughing, having asthma attacks or other issues. Please consult a veterinarian.",
        br(),
        br(),
        "Progressive Retinal Atrophy : This is an inherited eye disorder that can lead to blindness in your cat",
        br(),
        br(),
        "If you're interested in learning more about the Himalayan Cat, please check out the following site : ",
        a("The Cat Fanciers' Association : Himalayan Cat", href = "https://cfa.org/persian/himalayan-persian-article-1999/"))
    } else if (input$catbreeds == "Maine Coon"){
      p(style = "text-align : justify;",
        "The Maine Coon is the biggest cat breed of them all. Having existed in the United States since the 1800s, they were found throughout the North Eastern US and were especially popular in the state of Maine which is where its name derives from. Its fur coat is long and shaggy and they have ears that ressemble those of a bobcat. They can be found in almost every color except Siamese looking colors like lavender and Himalayan. They can have all the standard cat eye colors such as gold, green, blue or even odd-eyed.", 
        br(),
        br(),
        "The life expectancy of a Maine Coon is about 12 to 15 years old. They are the biggest cat breed in both weight and length. Being around 4 kilos on the low end and getting up to 9 kilos or more for some males. They are also very long, measuring from 45 to 76 cm long. Despite their imposing look, they are considered 'Gentle Giants' because of their good, gentle nature. They are very loving. They are not hypoallergenic. They are also prone to moderate shedding and can be quite loud. A Maine Coon will cost you anywhere between CHF400 to CHF6'000.",
        h4("Health Issues : "),
        "The only condition that Maine Coons are really prone to is spinal muscular atrophy, a disease that causes degeneration of the spinal cord and atrophy of the hind legs.",
        br(),
        br(),
        "If you're interested in learning more about the Maine Coon, please check out the following site : ",
        a("The Cat Fanciers' Association : Maine Coon", href = "https://cfa.org/maine-coon-cat/"))
    }else if (input$catbreeds == "Norwegian Forest"){
      p(style = "text-align : justify;",
        "The Norwegian Forest cat is a breed that developed on its own to adapt to the freezing climate of the forests of Norway, which is where it gets its name from. They have long silky fur, lynx-like ears and 'toe feathers' to keep their paws warm in winter or in the snow. They can be found in most colors barring Siamese type colors and patterns. The same can be said about their eye color, the only important difference is that only white or partially white Norwegian Forest cats have blue eyes, the rest cannot.", 
        br(),
        br(),
        "When it goes to life expectancy, the Norwegian Forest cat, if well-taken care of, can live up to 16 years old. They can be quite large, heavy cats, weighing up to 8 kilos and as long as almost a meter head to tail. They form strong bonds with their families and are wonderful family cats as they tend to be very friendly, not noisy and go well with little kids and pets. They are not hypoallergenic. The average Norwegian Forest cat can cost you from CHF800 to CHF1'500.",
        h4("Health Issues : "),
        "The Norwegian Forest cat is prone to a few health problems, including the typical for cats hypertrophic cardiomyopathy :",
        br(),
        br(),
        "Hip dysplasia : This is the looseness of the hip joint, while this is uncommon in cats, it does affect some of the larger breeds like Norwegian Forests and Maine Coons.",
        br(),
        br(),
        "Glycogen storage disease type IV is caused by a defective enzyme and leads to organ dysfunction, muscle atrophy and death.",
        br(),
        br(),
        "If you're interested in learning more about Norwegian Forest cats, please click on the link below : ",
        a("The Cat Fanciers' Association : Norwegian Forest", href = "https://cfa.org/norwegian-forest-cat/norwegian-forest-cat-article/"),
        br(),
        h5("This is one of Karl's cats : Ragnar!", style = "color:red"),) 
    } else if (input$catbreeds == "Persian"){
      p(style = "text-align : justify;",
        "One of the most iconic breeds of all time, Persians have been around for thousands of years, tracing back its heritage to ancient Persia (modern day Iran). It is recognizable by its round, flat face and its large coat of fur. Just about any cat color possible can be found found in a Persian, including the Siamese looks. As for their eye colors, they can be found in gold, green, blue, hazel or even a red color. It is currently the most pedigreed cat in the United States and large parts of the world.", 
        br(),
        br(),
        "A healthy, well-taken care of Persian can live anywhere between 15 to 20 years of age. Their average weight is between 3 to 5 kilos and their average length is between 35 to 43 cm. They are cuddly, affectionate cats that are rather high maintenance because of their long fur coat. They are unsurprisingly not hypoallergenic. They are not always the best with little kids or other pets. The average Persian cat will cost you anywhere between CHF500 to CHF5'000",
        h4("Health Issues : "),
        " The Persian cat is prone to quite a few genetic disorders as well as hypertrophic cardiomyopathy :",
        br(),
        br(),
        "Progressive Retinal Atrophy : This is an inherited eye disorder that can lead to blindness in your cat", 
        br(),
        br(),
        "Polycstic Kidney Disease : The kidneys will be enlarged and will not function properly. Cysts are typically seen in affected cats by their first year alive. This can lead to kidney failure.",
        br(),
        br(),
        "Respiratory Issues due to their flattened faces, they can have trouble breathing, especially in warm, humid climates. Air-conditioning will make it easier for them.",
        "If you're interested in learning more about Persian cats, please click on the link below : ",
        a("The Cat Fanciers' Association : Persians ", href = "https://cfa.org/persian/"))
    } else if (input$catbreeds == "Ragdoll"){
      p(style = "text-align : justify;",
        "The Ragdoll cat is a unique cat for one of its traits. They go limp with pleasure when you pet them which is where they get their namesake from. It is one of the larger breeds of cats out there. They can look somewhat like a mix between Siamese and Persians, showing such colors as chocolate, red, seal, blue and cream. They only have blue eyes. Another cat 'developed' in the United States during the Post War Period, a breeder wanted to make a beautiful cat with a loving personality.",
        br(),
        br(),
        "The Ragdoll can live to be around 17 years old. They are on the larger end of cat breeds, weighing up to 9 kilos and measuring up to a meter in length, head to tail. They are not hypoallergenic cats. They make the perfect family cat, they love being cuddled and are very social and outgoing cats. A Ragdoll cat can cost you between CHF800 to CHF2'000",
        h4("Health Issues : "),
        "The Ragdoll is prone to most of the common cat health conditions like hypertrophic cardiomyopathy, weight issues and other such things but nothing specific to the breed",
        br(),
        br(), 
        "If you want to learn more about the Ragdoll cat, please feel free to click the link below : ",
        a("The Cat Fanciers' Association : Ragdoll cats", href = "https://cfa.org/ragdoll/"))
    } else if (input$catbreeds == "Savannah"){
      p(style = "text-align : justify;",
        "The Savannah cat is a breed created by mixing a regular domestic cat with a wild African Serval. The name originates from the place of origin of the Serval, the African Savannah. This breed is one of the newest breeds to be created, that being around the early 1980s. The cat looks very much like its wild brethen the Serval with a black/brown spotted tabby pattern (see image). Its eyes will be either amber or green.",
        br(),
        br(),
        "The Savannah cat can live to be around 20 years old in captivity and under good care. They can weigh anywhere between 5 and 11 kilos (depending on the generation of Savannah cat). Similarily they can measure between 50 and 55 cm depending on the generation. It is not hypoallergenic and is generally friendly however please see the warning after this part.",
        br(),
        br(),
        h4("Warning about the Savannah cat : "),
        "Instead of talking about their health, which is generally pretty good, we will talk about issues with owning a Savannah cat. In many juristrictions, it is illegal to own a Savannah cat due to its hybrid (and wild) ancestry. In places where you are allowed to own one, you may need a permit to own the Savannah cat. Since it is hybrid with a wild animal we recommend that you buy a kitten from a breeder that has made sure that the kitten is properly socialized with humans, pets and other such things.",
        br(),
        br(),
        "If you want to learn more about the elusive Savannah cat, please have a look at the site provided below (please note that the Cat Fanciers' Association does not have a page on the Savannah due to it not being a recognized breed yet) :  ",
        a("Wikipedia : Savannah Cat", href = "https://en.wikipedia.org/wiki/Savannah_cat"))
    } else if (input$catbreeds == "Scottish Fold"){
      p(style = "text-align : justify;",
        "The Scottish Fold is famous for its namesake trait : its folded ears. The ears fold forwards and downward. The origin of the fold is said to come from a genetic mutation found in a barn in Scotland in the early 1960s, hence where the Scottish part of the Scottish Fold name comes from. The Scottish Fold can be found in many colors such as : brown, black, grey, white, cream and even red. It is most commonly found with short hair however a rarer long hair Scottish Fold does exist.",
        br(),
        br(),
        "The Scottish Fold can weigh up to 5 kilos and can measure up to 76 cm in length. They are not hypoallergenic cats, they are quiet and don't shed much. The Scottish Fold is good with families and dogs because of its good temperament and affectionate personality. If you want to purchase a Scottish Fold, it can cost you between CHF250 to CHF500.",
        br(),
        br(),
        h4("Health Issues : "),
        "The Scottish Fold is prone to a few medical conditions. So if you have any concerns, please consult a vet.",
        br(),
        br(), 
        "The biggest concern when it comes to Scottish Folds is a genetic disease called 'osteochondrodysplasia' which affects bone development and cartilage, which is also associated to the same gene as the fold ears. Signs of this disease are : problems moving hind legs, stiff tails and stiff hind joints.",
        br(), 
        br(),
        "They are also prone to heart problems like hypertrophic cardiomyopathy",
        br(),
        br(),
        "And Polycystic kidney disease",
        br(),
        br(),
        "If you are curious and want to know more about the Scottish Fold, please have a look at the site linked below : ",
        a("The Cat Fanciers' Association : Scottish Fold", href = "https://cfa.org/scottish-fold/"))
    } else if (input$catbreeds == "Siamese"){
      p(style = "text-align : justify;",
        "The Siamese is easily one of the most iconic and recognizable cat breeds out there. Probably the most recognizable cat breed on Earth. Their name comes from their location of origin, Siam (today's Thailand). They were and still valued across the world by cat lovers. They are immediately recognizable by their light colored (usually white, cream or beige) body and their darker 'points' which can be seal, chocolate, blue or lilac. They are also famous for their big blue eyes!",
        br(),
        br(),
        "The average Siamese can live up to 15 years old. They can weigh up to around 6 and a half kilos and measure up to 60 cm. They are not hypoallergenic. Siamese tend to bond very strongly with their family and are very vocal and talkative cats. They can get depressed if left alone for long periods of time. The average Siamese cat can cost anywhere between CHF250 to CHF1'000.",
        br(),
        br(),
        h4("Health Issues : "),
        "The Siamese is prone to a few health issues. As always, they are prone to hypertrophic cardiomyopathy.",
        br(),
        br(),
        "The most striking condition for Siamese cat is their crossed-eyes. This is caused by the same gene that gives them their colored points, this means they have worse vision than other cat breeds so they are more prone to accidents at night and other vision related problems.",
        br(),
        br(),
        "Breathing problems, Siamese with wedge shaped heads are more prone to having asthma and bronchial disease.",
        br(),
        br(),
        "Amyloidosis : This is a liver or kidney problem that is caused by an abnormal protein that is deposited in the body's organs.",
        br(),
        br(),
        "If you are interested and want to learn more about the wonderful Siamese cat, please check out the following link : ",
        a("The Cat Fanciers' Association : Siamese Cat", href = "https://cfa.org/siamese"),
        h5("This is one of Karl's cats : Tiggy!", style = "color:red"),)
    } else if (input$catbreeds == "Sphynx"){
      p(style = "text-align : justify;", 
        "Without a doubt one of the more unique cat breeds, the Sphynx is named that way after the Ancient Egyptian sphynx. They are most striking because of their lack of fur but they do have some fur, like we humans have on our faces (peach fuzz). Funnily enough, they actually originated in Canada sometime in the 1960s. They don't really have a fur color and their eyes can be any feline eye color.",
        br(),
        br(),
        "The Sphynx cat can live to be between 8 and 14 years old. They can get to be around 5 and a half kilos in weight and can get around 40 cm long. They are not hypoallergenic despite not having any 'real' fur. They are actually quite affectionate and love the heat, making them good cuddlers. They really like snuggling under blankets where its warm. The averge Sphynx can cost you around CHF1'500 up to CHF3'000.",
        br(),
        br(),
        h4("Health Issues : "),
        "The Sphynx has a rather unique set of problems owners need to deal with on top of the usual hypertrophic cardiomyopathy.",
        br(),
        br(),
        "Due to their lack of fur, Sphynxes are best as indoor cats since they will get sunburnt if exposed to the sunlight for too long. In fact, it is probably worse for them than for humans.",
        br(),
        br(),
        "Urticaria pigmentosa : This is an itchy, hereditary skin condition that causes a rash.",
        br(),
        br(),
        "Periodontal disease or gum disorders.",
        br(),
        br(),
        "If you want to learn more about the Sphynx cat, please consult the following link : ",
        a("The Cat Fanciers' Association : Sphynx Cat", href = "https://cfa.org/sphynx")) 
    }
  })
  
  
  #Map of Geneva's veterinarians
  library(shiny)
  library(leaflet)
  
  # Définir l'interface utilisateur de l'application Shiny
  ui <- fluidPage(
    leafletOutput("map")
  )
  
  # Définir le serveur de l'application Shiny
  output$map <- renderLeaflet({
    
    # Exemple de données de vétérinaires
    veterinaries <- data.frame(
      name = c("AMACKER Véronique", "AMBERGER Christophe, PHILIP Laurence", "BORER Luc, BORER-GERMANN Stéphanie, BRIZARD Delphine, FOELLMI Jérôme", "BOSSHART Marc-Antoine, DAYER Geneviève", "CAMPBELL Robert", "CAPOZZI Alessandro", "CARQUILLAT Delphine, LUKA Gabor", "CASELLINI Martine", "CATHENOZ Yold-Lin, CHAPUS MICHAUD Amélie, PIALAT Dahlia", "GELEHRTER Mira", "GOTTLIEBEROVA Elena, PORCHET Marie-José", "GUERNE Alain, UEBERSAX Wolfgang", "HUGI Doris", "LAMBRIGGER Nadine", "LA NAIA Vincenzo", "LAURENT Sentha", "LEGRUM Mariam, VOUILLON Tanguy", "LUKA Pia", "MAILLARD VERHAGEN Ariane", "NEAGU Andrea", "PAPADOPOULOS Konstantinos, ZOTOU Natacha", "PEREZ ROMO Federico", "RITTER Corinne", "SPYCHER Rodolphe", "TER KUILE Pierre", "TORRES Alejandro"),
      place = c("Service à domicile", "Cabinet Vétérinaire et Centre d'Imagerie", "VetSpécialistes", "Cabinet vétérinaire des Sources", "Cabinet vétérinaire de Saint-Jean", "Cabinet vétérinaire du Clos de la Fonderie", "Cabinet vétérinaire de Vésenaz", "Cabinet vétérinaire de Caroll", "Cabinet vétérinaire de Riantbosson", "Cabinet vétérinaire de la Jonction", "Cabinet vétérinaire de Chêne-Bougeries", "Cabinet vétérinaire des Tuileries", "Cabinet vétérinaire des Deux-Communes", "Cabinet Vétérinaire de Bernex", "Cabinet vétérinaire Bestiaire du Rhône", "Cabinet vétérinaire des Promenades", "Cabinet vétérinaire de Collonge-Bellerive", "Cabinet vétérinaire des Hauts de Carouge", "Veto-Psy - vétérinaire comportementaliste", "VetTravel", "Cabinet vétérinaire de Champel", "Cabinet vétérinaire de la Versoix", "Cabinet vétérinaire de Villereuse", "Cabinet vétérinaire de Frontenex", "Cabinet vétérinaire des Pontets", "Cabinet vétérinaire des Acacias"),
      rating = c(5, 3.8, 4.5, 4.5, 4.3, 4.8, 4.2, 4.3, 4.6, 3.4, 4.7, 4.7, 4.6, 4.7, 4.9, 4.9, 4.7, 4.7, 4.3, 4.7, 4.8, 4, 4.2, 4.3, 4.1, 4.8),
      address = c("Route de Laconnex 100, 1287 Laconnex", "Rue de la Servette 96, 1202 Genève", "Rte de Ferney 194B, 1218 Grand-Saconnex", "Rue des Sources 10, 1205 Genève", "Rue de Saint-Jean 28, 1203 Genève", "Clos-de-la-Fonderie 23, 1227 Carouge", "Route d'Hermance 8, 1222 Vésenaz", "Chemin de la Caroline 18a, 1213 Petit-Lancy", "Chemin de Riantbosson 5, 1217 Meyrin", "38 Boulevard Carl-Vogt, 1205 Genève", "Rue de Chêne-Bougeries 31, 1224 Chêne-Bougeries", "Chemin des Tuileries 42, 1293 Bellevue", "Chemin des Deux-Communes 21, 1226 Thônex", "Chemin de la Distillerie 12, 1233 Bernex", "Chemin du 23-Août 4, 1205 Genève", "Boulevard des Promenades 22, 1227 Carouge", "Route d'Hermance 95, 1245 Collonge-Bellerive", "Route de Saint-Julien 19, 1227 Carouge", "Rue de la Coupe Gordon-Bennett 2, 1219 Aïre", "Coupe Gordon-Bennett 2, 1219 Le Lignon", "Rue Pedro-Meylan 1, 1208 Genève", "Rampe de la Gare 6, 1290 Versoix", "Rue de Villereuse 7, 1207 Genève", "Rue Viollier 10, 1207 Genève", "Case Postale 582, 1212 Grand-Lancy", "Rte des Acacias 18, 1227 Les Acacias"),
      latitude = c(46.1630375, 46.2133737, 46.2351041, 46.195877, 46.2043452, 46.1858175, 46.240613, 46.191012, 46.226302, 46.198451, 46.196273, 46.252776, 46.194043, 46.177563, 46.202942, 46.1820537, 46.252583, 46.1767047, 46.205218, 46.205145, 46.195716, 46.279749, 46.199889, 46.201207, 46.173957, 46.191710),
      longitude = c(6.0422094, 6.128216, 6.1223517, 6.144583, 6.1281351, 6.1458293, 6.198072, 6.108927, 6.083383, 6.134992, 6.190887, 6.143145, 6.201620, 6.077023, 6.134026, 6.1374464, 6.203052, 6.1335575, 6.103946, 6.104021, 6.163799, 6.166744, 6.158398, 6.164067, 6.123575, 6.136614),
      phone = c("079 341 47 72", "022 734 42 48", "022 708 11 33", "022 708 11 99", "022 340 27 27", "022 342 74 00", "022 752 67 67", "022 792 12 05", "022 719 10 10", "022 995 96 97", "022 349 63 33", "022 774 25 25", "022 348 58 00", "022 757 61 18", "022 320 43 43", "022 343 30 80", "022 752 34 11", "022 343 22 22", "079 154 35 79", "079 120 65 12", "022 736 00 06", "022 755 46 24", "022 736 44 00", "022 840 08 68", "022 884 18 28", "022 342 45 46"),
      website = c("non", "http://www.imavet.ch", "https://vetspecialistes.ch/", "non", "http://veto-stjean.ch", "http://www.veterinaire-carouge.com", "http://www.vetvesenaz.ch", "non", "http://www.vetriantbosson.ch", "non", "http://www.vet-chene-bougeries.ch", "non", "non", "https://vetbernex.ch/", "http://www.bestiaire.ch", "non", "https://vet-collonge-bellerive.ch/", "non", "http://www.veto-psy.ch", "http://www.vettravel.info", "https://www.vetchampel.ch/", "non", "http://www.vet-villereuse.ch", "non", "http://www.terkuile.tk", "https://www.cabinetveterinairedesacacias.com/")
    )
    
    # Créer une carte centrée sur Genève
    geneva_map <- leaflet() %>%
      setView(lng = 6.1432, lat = 46.2044, zoom = 12) %>%
      addTiles()
    
    # Ajouter les marqueurs de vétérinaires avec informations supplémentaires
    for (i in 1:nrow(veterinaries)) {
      name <- veterinaries$name[i]
      place <- veterinaries$place[i]
      rating <- veterinaries$rating[i]
      address <- veterinaries$address[i]
      latitude <- veterinaries$latitude[i]
      longitude <- veterinaries$longitude[i]
      phone <- veterinaries$phone[i]
      website <- veterinaries$website[i]
      
      popup_content <- paste0("<b>", name, "</b><br>",
                              "Rating : ", rating, "/5<br>",
                              "Place : ", place, "<br>",
                              "Adress : ", address, "<br>",
                              "Phone : ", phone, "<br>",
                              "Website : ", website, "<br>")
      
      geneva_map <- geneva_map %>%
        addMarkers(lng = longitude, lat = latitude, popup = popup_content)
    }
    
    # Afficher la carte
    geneva_map
  })
  
  
  #Map of adoption centers in and around Geneva
  library(shiny)
  library(leaflet)
  
  # Define the Shiny application user interface
  ui <- fluidPage(
    leafletOutput("map")
  )
  
  # Define the Shiny application server
  server <- function(input, output) {
    
    # Data for adoption centers
    adoption_centers <- data.frame(
      name = c("Refuge de l'espoir - Arthaz", "Société Protectrice des Animaux (SPA) Refuge Vailly", "SOS Chats", "Refuge de la SPA La Côte", "Centre et Refuge SVPA"),
      address = c("284 Rte de la Basse Arve, 74380 Arthaz Pont-Notre-Dame, France", "Av. de Cavoitanne 5, 1233 Bernex", "Chem. du Plantin 2, 1217 Meyrin, Suisse", "Chem. du Bochet 20, 1260 Nyon, Suisse", "Rte de Berne 318, 1000 Lausanne, Suisse"),
      rating = c(4.2, 4.3, 4.2, 4.3, 4.4),
      phone = c("+33 4 50 36 02 80", "+41 22 757 13 23", "+41 22 785 32 84", "+41 22 361 61 15", "+41 21 784 80 00"),
      website = c("www.dons.animaux-secours.fr", "www.sgpa.ch", "http://www.sos-chats.ch/", "https://www.spalacote.ch/", "http://www.svpa.ch/"),
      latitude = c(46.166053, 46.171801, 46.224682, 46.406120, 46.570829),
      longitude = c(6.245335, 6.051797, 6.085156, 6.213761, 6.711519)
    )
    
    # Render the leaflet map
    output$map <- renderLeaflet({
      
      # Create a map centered on Geneva
      geneva_map <- leaflet() %>%
        setView(lng = 6.1432, lat = 46.2044, zoom = 12) %>%
        addTiles()
      
      # Add markers for adoption centers with additional information
      for (i in 1:nrow(adoption_centers)) {
        name <- adoption_centers$name[i]
        address <- adoption_centers$address[i]
        rating <- adoption_centers$rating[i]
        phone <- adoption_centers$phone[i]
        website <- adoption_centers$website[i]
        latitude <- adoption_centers$latitude[i]
        longitude <- adoption_centers$longitude[i]
        
        popup_content <- paste0("<b>", name, "</b><br>",
                                "Address: ", address, "<br>",
                                "Rating: ", rating, "/5<br>",
                                "Phone: ", phone, "<br>",
                                "Website: ", website, "<br>")
        
        geneva_map <- geneva_map %>%
          addMarkers(lng = longitude, lat = latitude, popup = popup_content)
      }
      
      # Display the map
      geneva_map
    })
  }
}


# Run the application 
shinyApp(ui = ui, server = server)
