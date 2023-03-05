library(shiny)

shinyServer(function(input, output) {
    
    output$vystup1 <- renderText({      # zadání krevní skupiny
 
        if (input$kr_skup == "A") {
          krskup <- ("A")
        } else if (input$kr_skup == "B") {
            krskup <- ("B")
            } else if (input$kr_skup == "AB") {
               krskup <- ("AB")
                } else if (input$kr_skup == "0") {
                    krskup <- ("0")
                    }
        
        if (input$rh_fakt == "+") {     # zadání Rh faktoru
            rhfakt <- ("+")
            } else if (input$rh_fakt == "-") {
                rhfakt <- ("-")
                }
        
        vysledek1 <- c("Vaše krevní skupina je: ", krskup, rhfakt)
        return(vysledek1)
        
    }) 
    
    # tabulka kombinovatelnosti  
    my_vect <- c(1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1) 
    my_matr <- matrix(my_vect, nrow = 8, ncol = 8)
    
    krevni_skupiny <- as.data.frame(my_matr)
    
    rnames <- c("0+", "0-", "A+", "A-", "B+", "B-", "AB+", "AB-")
    rownames(krevni_skupiny) = rnames
    colnames(krevni_skupiny) = rnames
    
    
    output$vystup2 <- renderText({   
    
        if (input$kr_skup == "A") {
          x <- 1
          } else if (input$kr_skup == "B") {
              x <- 2
              } else if (input$kr_skup == "AB") {
                x <- 3
                } else if (input$kr_skup == "0") {
                  x <- 0
                  }
        
        if (input$rh_fakt == "+") {
          y <- 0
          } else if (input$rh_fakt == "-") {
            y <- 1
            }
        
        z <- (1 + 2*x + y)      # výpočet souřadnice v tabulce
        
        i_r <- which(krevni_skupiny[z,] == 1)       # výpis kombinovatelných
        radky <- paste0(names(krevni_skupiny)[i_r], collapse = ", ")
        
        vysledek2 <- c("Můžete darovat krev příjemcům s následujícími krevními skupinami: ", radky)
        
        return(vysledek2)
        
    })
    
    output$vystup3 <- renderText({   
      
        if (input$kr_skup == "A") {
          x <- 1
          } else if (input$kr_skup == "B") {
            x <- 2
            } else if (input$kr_skup == "AB") {
              x <- 3
              } else if (input$kr_skup == "0") {
                x <- 0
                }

        if (input$rh_fakt == "+") {
          y <- 0
          } else if (input$rh_fakt == "-") {
            y <- 1
            }

      z <- (1 + 2*x + y)        # výpočet souřadnice v tabulce
      
      i_s <- which(krevni_skupiny[,z] == 1)     # výpis kombinovatelných
      sloupce <- paste0(names(krevni_skupiny)[i_s], collapse = ", ")
      
      vysledek3 <- c("Můžete přijímat krev od dárců následujících krevních skupin: ", sloupce)
      
      return(vysledek3)
      
    })
    
  })

