#ui.R

library(shiny)
library(shinydashboard)


shinyUI(
  
 dashboardPage(
    
    dashboardHeader(title = "Categories"),
    
    dashboardSidebar(
          sidebarMenu(
            menuItem("Categories", tabName = "dashboard", icon = icon("dashboard"))
            )
          ),
    
    dashboardBody(
      tabItems(
        # First tab content
        tabItem(tabName = "dashboard",
                fluidPage(
                  fluidRow(
                    box(width = 20, textOutput("comments")),
                    actionButton("str", "Continue"),
                    box(textOutput("categories"), 
                        radioButtons("rd",
                                     label="Select a category:",
                                     choices=c("Positive" = "positive", "Negative" = "negative", 
                                                  "None selected" = NA)))
                    )
                  ))
        )
      )
  )
)

                
        
