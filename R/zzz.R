#' 'Groq': Support Functions

######################################## .
########  Set Model Parameters  ########
######################################## .

#'
#' Runs when attached such as by library() or require()
#'
#' This function is an attachment point for the 'onAttach' event in R packages. It is called when this package is attached to the R session."
#' @param libname The name of the library where this add-on is located.
#' @param pkgname The name of the package that is being attached.
#'
#' @importFrom shiny fluidPage actionButton titlePanel
#' @importFrom shiny observeEvent showNotification stopApp fluidPage shinyApp
#' @importFrom shinyWidgets inputSweetAlert
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET add_headers content content_type_json POST use_proxy
#'
.onAttach <- function(libname, pkgname="groqR") {

    packageStartupMessage("Welcome to groqR! Launching setup...")

    requireNamespace("shiny", quietly = TRUE)

    uiInit <- shiny::fluidPage( # Define UI
        shiny::titlePanel("Set GROQ Parameters"),
        shiny::actionButton("btn_set_params", "Set Parameters")
    )

    serverInit <- function(input, output, session) {


        # Define server logic
        shiny::observeEvent(input$btn_set_params, {
            # Input for GROQ_API_KEY
            shinyWidgets::inputSweetAlert(
                session = session,
                inputId = "GROQ_API_KEY",
                input = "text",
                title = "Enter your GROQ_API_KEY:",
                inputPlaceholder = "e.g., your_api_key_here",
                allowOutsideClick = FALSE,
                showCloseButton = TRUE
            )


            # Select model from options
            shiny::observeEvent(input$GROQ_API_KEY, {

                content <- modelCall(input$GROQ_API_KEY)
                shinyWidgets::inputSweetAlert(
                    session = session,
                    inputId = "model",
                    input = "select",
                    inputOptions = content$id,
                    title = "Select a model:",
                    value = "llama-3.3-70b-versatile"
                )
            })

            # Input for systemRole
            shiny::observeEvent(input$model, {
                shinyWidgets::inputSweetAlert(
                    session = session,
                    inputId = "systemRole",
                    input = "text",
                    title = "Set the system role:",
                    inputPlaceholder = "e.g., You are a helpful assistant.",
                    allowOutsideClick = FALSE,
                    showCloseButton = TRUE,
                    value = "You are a helpful assistant."
                )
            })

            # Input for maxTokens
            shiny::observeEvent(input$systemRole, {
                shinyWidgets::inputSweetAlert(
                    session = session,
                    inputId = "maxTokens",
                    input = "text",
                    title = "Enter the maximum number of tokens:",
                    inputPlaceholder = "e.g., 100",
                    value = "100"
                )
            })

            # Input for temperature
            shiny::observeEvent(input$maxTokens, {
                shinyWidgets::inputSweetAlert(
                    session = session,
                    inputId = "temperature",
                    input = "text",
                    title = "Enter the temperature:",
                    inputPlaceholder = "e.g., 1",
                    value = "1"
                )
            })

            # Input for top_p
            shiny::observeEvent(input$temperature, {
                shinyWidgets::inputSweetAlert(
                    session = session,
                    inputId = "top_p",
                    input = "text",
                    title = "Enter top_p value:",
                    inputPlaceholder = "e.g., 1",
                    value = "1"
                )
            })

            # Input for proxy (optional)
            shiny::observeEvent(input$top_p, {
                shinyWidgets::inputSweetAlert(
                    session = session,
                    inputId = "proxy",
                    input = "text",
                    title = "Enter proxy (optional):",
                    inputPlaceholder = "e.g., http://proxyserver:8080"
                )
            })

            shiny::observeEvent(input$proxy, {
                .GROQparams <- list(
                    GROQ_API_KEY = ifelse(input$GROQ_API_KEY == "",
                                          "https://console.groq.com/keys",
                                          as.character(input$GROQ_API_KEY)),
                    GROQ_model = as.character(input$model),
                    GROQ_systemRole = ifelse(input$systemRole == "",
                                             "You are a helpful assistant.",
                                             as.character(input$systemRole)),
                    GROQ_maxTokens = ifelse(input$maxTokens == "", 1024L,
                                            as.integer(input$maxTokens)),
                    GROQ_temperature = ifelse(input$temperature == "", 1L,
                                              as.numeric(input$temperature)),
                    GROQ_top_p = ifelse(input$top_p == "", 1L, as.numeric(input$top_p)),
                    GROQ_proxy = ifelse(input$proxy == "", NA, input$proxy)
                )
                .GROQparams <- .GROQparams[!is.na(.GROQparams)]
                # Set each item in the list as an environment variable
                showNotification("Copy GROQ parameters to your .Renvrion file and restart R!", type = "message")
                Sys.sleep(3)
                shiny::stopApp()
            })
        })
    }

    on_startup <- function(uiStartup = uiInit, serverStartup = serverInit) {
        # Set params if necessary
        if (any(Sys.getenv(c(
            "GROQ_model", "GROQ_systemRole", "GROQ_API_KEY",
            "GROQ_maxTokens", "GROQ_temperature", "GROQ_top_p"
        )) == "")) {
            shinyApp(ui = uiStartup, server = serverStartup)
        }
    }



    if (interactive()) {
        setHook(packageEvent(pkgname, "onLoad"), function(...) {
            tryCatch(
                {
                   on_startup()
                },
                error = function(e) {
                    packageStartupMessage("Error launching Shiny app: ", e$message)
                }
            )
        })
    } else {
        packageStartupMessage("Skipping initialization (non-interactive mode).")
    }
}



#' Function to query current models
#'
#' The `modelCall` function is designed to  query current models from Groq.
#'
#' @param api_key The Groq API key.
#'
#' @details
#' The function checks the following environment variables:
#' - `GROQ_API_KEY`
#'
#'
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET
#'
#' @return model table
#'
#' @export
#'
modelCall <- function(api_key = Sys.getenv("GROQ_API_KEY")) {

    url <- "https://api.groq.com/openai/v1/models"

    # Set headers
    headers <- add_headers(
        Authorization = paste("Bearer", api_key),
        `Content-Type` = "application/json"
    )

    # Send GET request
    response <- GET(url, headers)
    # Parse and print JSON response
    content <- content(response, as = "text", encoding = "UTF-8")
    content <- fromJSON(content)$data
    return(content)
}

