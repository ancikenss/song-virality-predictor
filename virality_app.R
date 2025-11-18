library(shiny)

ui <- fluidPage(
  titlePanel("Song Virality Predictor"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("danceability", "Danceability", 
                  min = 0, max = 1, value = 0.6, step = 0.01),
      sliderInput("energy", "Energy", 
                  min = 0, max = 1, value = 0.7, step = 0.01),
      numericInput("loudness", "Loudness (dB)", 
                   value = -5, min = -30, max = 5, step = 1),
      sliderInput("speechiness", "Speechiness", 
                  min = 0, max = 1, value = 0.04, step = 0.01),
      sliderInput("acousticness", "Acousticness", 
                  min = 0, max = 1, value = 0.1, step = 0.01),
      sliderInput("instrumentalness", "Instrumentalness", 
                  min = 0, max = 1, value = 0, step = 0.01),
      sliderInput("liveness", "Liveness", 
                  min = 0, max = 1, value = 0.2, step = 0.01),
      sliderInput("valence", "Valence (happiness)", 
                  min = 0, max = 1, value = 0.7, step = 0.01),
      numericInput("tempo", "Tempo (BPM)", 
                   value = 120, min = 60, max = 220, step = 1),
      numericInput("duration_sec", "Duration (seconds)", 
                   value = 180, min = 30, max = 600, step = 5),
      numericInput("popularity", "Spotify popularity (0-100)", 
                   value = 50, min = 0, max = 100, step = 1),
      numericInput("key", "Musical key (0-11)", 
                   value = 5, min = 0, max = 11, step = 1),
      selectInput("mode", "Mode",
                  choices = c("Minor" = 0, "Major" = 1),
                  selected = 1),
      
      actionButton("predict", "Predict")
    ),
    
    mainPanel(
      h3("Predicted probability of being viral:"),
      textOutput("prob_text"),
      h4("Prediction:"),
      textOutput("label_text")
    )
  )
)

server <- function(input, output, session) {
  
  observeEvent(input$predict, {
    
    new_song <- data.frame(
      danceability = input$danceability,
      energy = input$energy,
      loudness = input$loudness,
      speechiness = input$speechiness,
      acousticness = input$acousticness,
      instrumentalness = input$instrumentalness,
      liveness = input$liveness,
      valence = input$valence,
      tempo = input$tempo,
      duration_sec = input$duration_sec,
      popularity = input$popularity,
      key = input$key,
      mode = as.numeric(input$mode)
    )
    
    prob <- predict(logit_model, newdata = new_song, type = "response")
    
    output$prob_text <- renderText(sprintf("%.1f %%", prob * 100))
    
    output$label_text <- renderText(
      ifelse(prob > 0.5, "Likely VIRAL", "Likely NONVIRAL")
    )
  })
}

shinyApp(ui, server)
