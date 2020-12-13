## ui.R
library(shiny)
library(shinydashboard)
library(recommenderlab)
library(data.table)
library(ShinyRatingInput)
library(shinyjs)

source('functions/helpers.R')

shinyUI(dashboardPage(
  skin = "blue",
  dashboardHeader(title = "Movie Recommender"),
  
  dashboardSidebar(disable = TRUE),
  
  dashboardBody(
    includeCSS("css/movies.css"),
    fluidRow(
      box(
        width = 12,
        title = "Step 1: Choose favorite genre",
        status = "info",
        solidHeader = TRUE,
        collapsible = TRUE,
        selectInput(
          "fav_genre",
          "",
          c(
            "Action" = "Action",
            "Adventure" = "Adventure",
            "Animation" = "Animation",
            "Children's" = "Children's",
            "Comedy" = "Comedy",
            "Crime" = "Crime",
            "Documentary" = "Documentary",
            "Drama" = "Drama",
            "Fantasy" = "Fantasy",
            "Film-Noir" = "Film-Noir",
            "Horror" = "Horror",
            "Musical" = "Musical",
            "Mystery" = "Mystery",
            "Romance" = "Romance",
            "Sci-Fi" = "Sci-Fi",
            "Thriller" = "Thriller",
            "War" = "War",
            "Western" = "Western"
          )
        )
      )
    ),
    fluidRow(
      box(
        width = 12,
        title = "Step 2: Rate as many movies as possible",
        status = "info",
        solidHeader = TRUE,
        collapsible = TRUE,
        div(class = "rateitems",
            uiOutput('ratings'))
      )
    ),
    fluidRow(
      useShinyjs(),
      box(
        width = 12,
        status = "info",
        solidHeader = TRUE,
        title = "Step 3: Discover movies you might like",
        br(),
        withBusyIndicatorUI(
          actionButton("btn", "Click here to get your recommendations", class = "btn-warning")
        ),
        br(),
        tableOutput("results")
      )
    )
  )
))
