#server.R
#------------------------------------
  
library(shiny)
library(shinydashboard)

show.text <- function(the.file="input.csv"){
  data <- read.csv(the.file,stringsAsFactors=FALSE)
  nrows <- dim(data)[1]
  ncols <- dim(data)[2]
  
  for(i in 1:nrows){
    if(is.na(data[i,3]) | data[i,3] == "" ){
       return( list(index=i,text=data[i,2],data=data) )
    }
  }
}

add.categories <- function(category){
  return(category)
}


shinyServer(function(input, output, session) {
  
  rvs<- reactiveValues()
  rvs$index <- NULL
  rvs$aux <- show.text()
  
   observeEvent(input$str, {
     
     ## 2. Add the new category
     rvs$data[rvs$index,3] <- input$rd
     # 3. Rewrite the csv with the new category
     write.csv(rvs$data, "input.csv", row.names = FALSE)
     rvs$aux <- show.text()
   })
  
  output$comments<-renderText({
    rvs$data <- rvs$aux$data
    rvs$index <- rvs$aux$index
    rvs$aux$text
  })
})
