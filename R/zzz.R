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
.onAttach <- function(libname, pkgname) {
    packageStartupMessage("Welcome to groqR!\n\n\n############################################################\n#####   Execute `on_startup()` on the first-time run   #####\n############################################################\n\n\n")
    on_startup()
}



#'
#' User Interface
#'
#' It creates a fluidPage with a title and an action button for triggering
#' the input event.
#'
#' @importFrom shiny fluidPage actionButton titlePanel
#'
#'
ui <- fluidPage( # Define UI
    titlePanel("Set GROQ Parameters"),
    actionButton("btn_set_params", "Set Parameters")
)


#'
#' Set GROQ Parameters Server Logic
#'
#' This function handles the server logic for the UI, including the observeEvent
#' for the action button. It asks the user to prompt various GROQ inputs.
#' Once the 'proxy' parameter is set, the parameters are written to the
#' environment as environment variables and a notification message is displayed.
#'
#' @param input The input values as they are submitted by the user.
#' @param output The output values.
#' @param session The Shiny session object.
#'
#' @return NULL
#'
#' @importFrom shiny observeEvent showNotification stopApp fluidPage
#' @importFrom shinyWidgets inputSweetAlert
#'
#'
server <- function(input, output, session) {
  # Define server logic
  observeEvent(input$btn_set_params, {
    # Input for GROQ_API_KEY
    inputSweetAlert(
      session = session,
      inputId = "GROQ_API_KEY",
      input = "text",
      title = "Enter your GROQ_API_KEY:",
      inputPlaceholder = "e.g., your_api_key_here",
      allowOutsideClick = FALSE,
      showCloseButton = TRUE
    )

    # Select model from options
    observeEvent(input$GROQ_API_KEY, {
      inputSweetAlert(
        session = session,
        inputId = "model",
        input = "select",
        inputOptions = c(
          "llama-3.1-70b-versatile",
          "llama-3.1-8b-instant",
          "llama3-groq-70b-8192-tool-use-preview",
          "llama3-groq-8b-8192-tool-use-preview",
          "llama-guard-3-8b",
          "llama3-70b-8192",
          "llama3-8b-8192",
          "mixtral-8x7b-32768",
          "gemma-7b-it",
          "gemma2-9b-it",
          "whisper-large-v3"
        ),
        title = "Select a model:"
      )
    })

    # Input for systemRole
    observeEvent(input$model, {
      inputSweetAlert(
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
    observeEvent(input$systemRole, {
      inputSweetAlert(
        session = session,
        inputId = "maxTokens",
        input = "text",
        title = "Enter the maximum number of tokens:",
        inputPlaceholder = "e.g., 1024",
        value = "1024"
      )
    })

    # Input for temperature
    observeEvent(input$maxTokens, {
      inputSweetAlert(
        session = session,
        inputId = "temperature",
        input = "text",
        title = "Enter the temperature:",
        inputPlaceholder = "e.g., 1",
        value = "1"
      )
    })

    # Input for top_p
    observeEvent(input$temperature, {
      inputSweetAlert(
        session = session,
        inputId = "top_p",
        input = "text",
        title = "Enter top_p value:",
        inputPlaceholder = "e.g., 1",
        value = "1"
      )
    })

    # Input for proxy (optional)
    observeEvent(input$top_p, {
      inputSweetAlert(
        session = session,
        inputId = "proxy",
        input = "text",
        title = "Enter proxy (optional):",
        inputPlaceholder = "e.g., http://proxyserver:8080"
      )
    })

     observeEvent(input$proxy, {
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
      print(.GROQparams)

      showNotification("Copy GROQ parameters to your .Renvrion file and restart R!", type = "message")
      Sys.sleep(3)
      stopApp()
    })
  })
}

#' Function to Handle Package Startup Logic
#'
#' The `on_startup` function is designed to execute certain actions when the package is loaded.
#' Specifically, it checks for the presence of required environment variables related to the GROQ system.
#' If any of these variables are missing, it will launch a Shiny application.
#'
#'
#' @details
#' The function checks the following environment variables:
#' - `GROQ_model`
#' - `GROQ_systemRole`
#' - `GROQ_API_KEY`
#' - `GROQ_maxTokens`
#' - `GROQ_temperature`
#' - `GROQ_top_p`
#' - `GROQ_proxy`
#'
#' If any of these variables are not set (i.e., are empty strings), the function triggers the
#' launch of a Shiny application defined by the `ui` and `server` components.
#'
#' @seealso
#' `shiny::shinyApp`
#'
#' @importFrom shiny shinyApp
#'
#' @return None
#'
#' @export
#'
on_startup <- function() {
    # Set params if necessary
    if (any(Sys.getenv(c(
        "GROQ_model", "GROQ_systemRole", "GROQ_API_KEY",
        "GROQ_maxTokens", "GROQ_temperature", "GROQ_top_p"
    )) == "")) {
        shinyApp(ui = ui, server = server)
    }
}

