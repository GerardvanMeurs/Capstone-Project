library(shiny)
library(shinythemes)

shinyUI(
  navbarPage(
    "Next Word - Coursera Data Science Capstone Project",
    theme = shinytheme("darkly"),
    tabPanel(
      "Predictor",
      pageWithSidebar(
        headerPanel("Next word predictor ..."),
        sidebarPanel(
          textInput(inputId = "sentence", label = "Enter some words"),
          h6(em("Only English text, no special characters")),
          submitButton("Predict!")
        ),
        mainPanel(
          h5("You entered"),
          verbatimTextOutput("sentence"),       
          h5("Prediction"),
          verbatimTextOutput("prediction"),
          h5("Status"),
          verbatimTextOutput("status")
        ))
    ),
    
    
    tabPanel(
      "Help",
	  p("Predictions are based on the occurrence of word combinations in a sample of English texts (HCCorpora: blogs, news and twitter"),
	  p("entries)."),
	  br(),	
	  p("In this app the user enters a short sentence of several words. After clicking the Predict!-button, these words are used to look"),
	  p("up the most frequent occurring next word"),
	  br(),
	  p("In case this sentence contains 3 or more words, only the last 3 words are used to look for the highest occurring 4-word-combination"),
	  p("(also called: quadgrams) with these 3 words from the user-sentence. In case this sentence contains 2 words (or in case the"),
	  p("3-word-lookup in the quadgrams didn't find a match) these 2 words are used to look for the highest occurring 3-word-combination"),
	  p("(also called trigrams) with these 2 words from the user-sentence. And in case the user entered only 1 word (or in case the previous"),
	  p("3- and 2-word searches failed) this word is used to look for the highest occurring 2-word-combination (also called: bigrams)) with"),
	  p("this paticular word."),
	  br(),
	  p("If all look ups fail to result in a prediction, the predicted string is left empty, and the status is set to 'no prediction found'")
     ),
    
    
    tabPanel(
      "About",
      h3("Coursera Data Science Curriculum"),
      h3("Capstone Project - Next word predictor"),
      br(),
      h4("Author: Gerard van Meurs"),
      br(),
      h4("June 14, 2019"),
      br(),
      p("Source code of this application is available at",
        a(href = "https://","https://github.com/GerardvanMeurs/Capstone-Project"))
    )
  )
)