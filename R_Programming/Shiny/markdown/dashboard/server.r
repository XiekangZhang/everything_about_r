

shinyServer(
  function(input, output, session) {
    output$HistPlot <- renderPlot({
      ggplot(diamonds, aes_string(x=input$VarToPlot)) + 
        geom_histogram(bins=input$HistBins)      
    })
    
    output$DensePlot <- renderPlot({
      ggplot(diamonds, aes_string(x=input$VarToPlot)) + 
        geom_density(fill = "grey50")
    })
    
    output$TheTable <- DT::renderDataTable({
      DT::datatable(diamonds, rownames = FALSE)
    },
    server = TRUE)
    
    theData <- reactive({
      if (is.null(input$FileUpload)) {
        return(NULL)
      }
      readr::read_csv(input$FileUpload$datapath)
    })
    
    observe({
      updateCheckboxGroupInput(
        session = session, 
        inputId = "ColSelection",
        label = "Please choose columns to display",
        choices = names(theData()),
        selected = names(theData())
      )
    })
    
    output$FileTable <- DT::renderDataTable({
      DT::datatable(theData()[, input$ColSelection, drop = FALSE], 
                    rownames = FALSE)
    },
    server = TRUE
    )
    
    observeEvent(input$SwapButton, {
      shinyjs::toggle(id = "LeftText")
      shinyjs::toggle(id = "RightText")
    })
    
    observeEvent(input$AlertButton, {
      shinyjs::alert("This is an alert")
    })
    
    observe({
      shinyjs::toggle(id="LuckyNumber", condition = input$NumGuess == 5)
      shinyjs::toggleState(id="AlertButton", condition = input$NumGuess == 1)
    })
    
    output$PizzaTable <- DT::renderDataTable({
      DT::datatable(
        pizza,
        rownames = FALSE,
        options = list(scrollX = TRUE)
        )
    })
    
    output$PizzaMap <- renderLeaflet({
      leaflet(
          pizza %>% dplyr::slice(as.integer(input$PizzaTable_rows_selected))
        ) %>%
        addTiles() %>%
        addMarkers(
          lng = ~longitude,
          lat = ~latitude,
          popup = ~Name
        )
    })
    
    output$Report <- downloadHandler(
      filename = "/mnt/Documents/Workspace/R/R_Programming/Shiny/markdown/dashboard/report.html",
      content = function(file) {
        tempFile <- file.path("/mnt/Documents/Workspace/R/R_Programming/Shiny/markdown/dashboard", "report.Rmd")
        file.copy("report.Rmd", to=tempFile, overwrite = TRUE)
        
        chosen <- pizza %>% dplyr::slice(as.integer(input$PizzaTable_rows_selected)) %>%
          dplyr::pull(Name)
        
        params <- list(places=chosen)
        
        rmarkdown::render(tempFile, output_file = file, params = params,
                          envir = new.env(parent = globalenv()))
      }
    )
  }
)