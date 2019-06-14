Capstone project presentation
Next Word Predictor
========================================================
author: Gerard van Meurs
date:  June 14, 2019
autosize: true

Content
========================================================

This presentation describes the Next Word Shiny-app:

- objectives
- methodology
- functionality

Objectives
========================================================

The goal of this exercise is to create a Shiny-app that deploys an R algorithm to predict the next word for a given short sentence. This app is published on shinyapps.io (https://gvmeurs.shinyapps.io/nxtWordPredictor/) to make it accessible by others.

Three different (English) sources were used as input-data to build the prediction-model: blogs, news and twitter-data from the HC Corpora.

Like in most data science projects, most time was invested in exploration, cleaning and sampling of the datasources.

For the text mining steps in this project the tidytext-package was used. 


Methodology
========================================================

* To limit processing time a sample of 25% of all three sources (blogs, news, twitter) was taken.

* All text was converted to lowercase words; punctuation, white space, special characters and profanity words were removed

* Stop words were not removed, as these occur quite often in typed text

* n-grams (word combinations of n-words) where created with the unnest_token()-function from the tydytext package; to minimize app-storage, only the top-10% of each was saved

* In the app the user enters a short sentence; the app searcher for the most probable next word

* A sentence contains one, two or three-or-more words; in the last situation only the last three words are considered 

* If the sentence contains two words (or there was no match in the three-word search), the next word is searched for as the most frequent third-word in the trigram-table based on the two words; if no match is found, the seearch is repeated with only the last word

* If the sentence contains only one word (or there was no match in the two-word search), the most frequent second word is searched for in the bigram-table.

* If all searches do not result in a match, the status-variable in the app is set

Functionality
========================================================

In the user-interface the user enters a (short) sentence in a text-field

Then the users clicks the Submit!-button on the screen to start the prediction

Output is on the right of the input-field:

* an echo of what was entered by the user
* a display of the formatted (lowercase, whitespace stripped) sentence including the prediction
* a display of the status of the prediction ("OK", "empty string, no prediction" or "no prediction found")

This presentation and all source code can be found on github: https://github.com/GerardvanMeurs/Capstone-Project

The application can be used via: https://gvmeurs.shinyapps.io/nxtWordPredictor/


