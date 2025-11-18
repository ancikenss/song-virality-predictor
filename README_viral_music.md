# Song Virality Predictor

This project uses Spotify audio features to predict whether a song is likely to become viral.  
I built a logistic regression model using 120,000+ tracks from Spotify and TikTok.

## What the project includes
- Data cleaning and feature engineering  
- Exploratory analysis (boxplots, correlation heatmap)  
- Logistic regression model for viral prediction  
- Model evaluation (Accuracy, ROC curve, AUC = 0.886)  
- A custom function for predicting virality  
- An interactive **Shiny app** where users adjust song features and instantly see the predicted probability

## How the model works
The model learns from audio features such as:

- danceability  
- energy  
- loudness  
- speechiness  
- acousticness  
- instrumentalness  
- liveness  
- valence  
- tempo  
- popularity  
- duration  
- key  
- mode  

These features are combined to predict the probability that a song becomes viral.

## Model Performance
- **Accuracy:** 94.97%  
- **AUC:** 0.886  

The model has a strong ability to separate viral from non-viral songs.

## Shiny App
Users can adjust audio features using sliders and get:
- Predicted virality probability  
- Label: “Likely viral” or “Likely nonviral”

To run the app in RStudio:

```r
library(shiny)
runApp("virality_app.R")
```

## Files in this project
You can organize your project folder like this:

- `spotify.csv` – Spotify audio features  
- `tiktok.csv` – TikTok viral songs  
- `logit_model.RData` – trained logistic regression model  
- `predict_viral.R` – helper function for predictions  
- `virality_app.R` – Shiny app code  
- `README.md` – this file

