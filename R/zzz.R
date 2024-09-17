#' Groq: Support Functions

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
#' Once the 'returnType' parameter is set, the parameters are written to the
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

    # Input for returnType
    observeEvent(input$proxy, {
      inputSweetAlert(
        session = session,
        inputId = "returnType",
        input = "text",
        title = "Enter returnType value:",
        inputPlaceholder = "e.g., 1",
        value = "3"
      )
    })

    observeEvent(input$returnType, {
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
        GROQ_proxy = ifelse(input$proxy == "", NA, input$proxy),
        GROQ_returnType = ifelse(input$returnType == "", 1L,
                                 as.integer(input$returnType))
      )
      .GROQparams <- .GROQparams[!is.na(.GROQparams)]
      # Set each item in the list as an environment variable
      Update.Renviron(.GROQparams)

      showNotification("GROQ parameters have been set!", type = "message")
      Sys.sleep(2)
      stopApp()
    })
  })
}

#' Update Renviron file with given list of variables and paths
#'
#' @param my_list A named list containing variables and their values to be added
#'            or updated in the .Renviron file.
#' @param renviron_path The file path of the existing .Renviron file.
#' (@code{file.path(Sys.getenv('HOME'), '.Renviron')}) by default.
#'
#' @return NULL
#'
Update.Renviron <- function(my_list, renviron_path =
                                file.path(Sys.getenv("HOME"), ".Renviron")) {
  # Read existing content of .Renviron if it exists
  if (file.exists(renviron_path)) {
    renv_content <- readLines(renviron_path)
  } else {
    renv_content <- character()
  }

  # Create lines to write from the list
  new_lines <- sapply(names(my_list), function(name) {
    paste0(name, " = ", my_list[[name]])
  })

  # Check for existing variables and replace them
  for (i in seq_along(new_lines)) {
    var_name <- names(my_list)[i]
    existing <- grep(paste0("^", var_name, "="), renv_content)

    if (length(existing) > 0) {
      renv_content[existing] <- new_lines[i]
    } else {
      renv_content <- c(renv_content, new_lines[i])
    }
  }

  # Write the updated content back to .Renviron
  writeLines(renv_content, renviron_path)

  # Notify the user
  cat("The following environment variables were added to .Renviron:\n")
  cat(new_lines, sep = "\n")
}


#' Function to Handle Package Startup Logic
#'
#' The `on_startup` function is designed to execute certain actions when the package is loaded.
#' Specifically, it checks for the presence of required environment variables related to the GROQ system.
#' If any of these variables are missing, it will launch a Shiny application.
#'
#' @details
#' The function checks the following environment variables:
#' - `GROQ_model`
#' - `GROQ_systemRole`
#' - `GROQ_API_KEY`
#' - `GROQ_maxTokens`
#' - `GROQ_temperature`
#' - `GROQ_top_p`
#' - `GROQ_returnType`
#'
#' If any of these variables are not set (i.e., are empty strings), the function triggers the
#' launch of a Shiny application defined by the `ui` and `server` components.
#'
#' @seealso
#' `shiny::shinyApp`
#'
#' @importFrom shiny shinyApp
#'
#' @export
on_startup <- function() {
    # Set params if necessary
    if (any(Sys.getenv(c(
        "GROQ_model", "GROQ_systemRole", "GROQ_API_KEY",
        "GROQ_maxTokens", "GROQ_temperature", "GROQ_top_p",
        "GROQ_returnType"
    )) == "")) {
        shinyApp(ui = ui, server = server)
        packageStartupMessage("GROQ parameters have been set, please restart R!")
    }
}
