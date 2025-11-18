# Song Virality Predictor
Predicting whether a song is likely to go viral using Spotify & TikTok audio features  
Built with R, Logistic Regression, and Shiny


## Project Overview  
This project uses audio features from Spotify and song visibility on TikTok to predict whether a song is viral or not.  
I trained a logistic regression model to estimate the probability that a song will go viral based on characteristics like:

- danceability  
- energy  
- loudness  
- valence  
- speechiness  
- acousticness  
- instrumentalness  
- liveness  
- tempo  
- duration  
- popularity  

The model achieved:

- Accuracy: ~95%  
- AUC (ROC curve): ~0.886  

## Shiny App: Song Virality Predictor  

This repository includes a simple Shiny web application where users can adjust audio features and get a predicted probability of virality.

Open RStudio and run:

```r
runApp("virality_app.R")
