library(shiny)

shinyUI(fluidPage(
    
    titlePanel("Kombinovatelnost krevních skupin"),
    
    sidebarLayout(
        sidebarPanel(
            radioButtons("kr_skup", "Vaše krevní skupina: ", c("A", "B", "AB", "0")),
            radioButtons("rh_fakt", "Váš Rh faktor: ", c("+", "-")),
            ),
        
        mainPanel(
            h3("Instrukce"),   # nadpis
            
            p("Vítejte v aplikaci pro zjištění kompatibility krevních skupin."),
            p("V levém panelu zadejte svou krevní skupinu a Rh faktor."),
            
            h3("Výsledek"),   # nadpis
            p(textOutput("vystup1")),  # text poslaný ze server.R
            p(textOutput("vystup2")),
            p(textOutput("vystup3"))
            
        )
    )
))
