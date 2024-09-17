#' Get Groq Completions Endpoint
#'
#' @param prompt The prompt to generate completions for.
#' @param ... Following arguments can be set manually or in .Renviron:
#'            `GROQ_API_KEY`is the GROQ API key.
#'            `model` Model choice. Default is mistral-7b-instruct.
#'            `systemRole` System role; Default is: "You are a helpful assistant
#'            with extensive knowledge of R programming."
#'            `maxTokens` The maximum integer of completion tokens returned.
#'            `temperature` The amount of randomness in the response,
#'            valued between 0 inclusive and 2 exclusive. Higher values are more
#'            random, and lower values are more deterministic.
#'            `top_p` Nucleus sampling threshold, valued between 0 and 1.
#'            `proxy` Default value is NULL.
#'            `returnType` Default is 3, which returns the output to the
#'            clipboard and returns TRUE, type 2 is unchanged
#'            and type 3 cats the output.
#'
#' @importFrom httr add_headers content content_type_json POST use_proxy
#' @importFrom jsonlite fromJSON
#'
#'

APIcall <- function(prompt, ...) {

  ######################################## .
  #############  Important:  #############
  ######################################## .
  # set R_LIBS_USER and R_PROFILE_USER as enviromental user variable

  args <- list(...)

  for (i in names(args)) {
      assign(i, args[[i]])
  }

  # Set params if necessary
  if (any(Sys.getenv(c(
    "GROQ_model", "GROQ_systemRole", "GROQ_API_KEY",
    "GROQ_maxTokens", "GROQ_temperature", "GROQ_top_p",
    "GROQ_returnType"
  )) == "") && any(!sapply(c("model", "systemRole", "GROQ_API_KEY",
    "maxTokens", "temperature", "top_p", "returnType"), exists))) {
    shiny::shinyApp(ui = ui, server = server)
  }

  if (!exists("GROQ_API_KEY")) GROQ_API_KEY <- Sys.getenv("GROQ_API_KEY")
  if (!exists("systemRole")) systemRole <- Sys.getenv("GROQ_systemRole")
  if (!exists("model")) model <- Sys.getenv("GROQ_model")
  if (!exists("maxTokens")) maxTokens <- Sys.getenv("GROQ_maxTokens")
  if (!exists("temperature")) temperature <- Sys.getenv("GROQ_temperature")
  if (!exists("top_p")) top_p <- Sys.getenv("GROQ_top_p")
  if (!exists("proxy")) proxy <- Sys.getenv("GROQ_proxy")
  if (!exists("returnType")) returnType <- Sys.getenv("GROQ_returnType")


  if (nchar(GROQ_API_KEY) == 0) stop("`GROQ_API_KEY` not provided.")
  if (nchar(systemRole) == 0) stop("`systemRole` not provided.")
  if (nchar(model) == 0) stop("`model` not provided.")
  if (nchar(maxTokens) == 0) stop("`maxTokens` not provided.")
  if (nchar(temperature) == 0) stop("`temperature` not provided.")
  if (nchar(top_p) == 0) stop("`top_p` not provided.")
  if (is.null(proxy) || nchar(proxy) == 0) proxy <- NULL
  if (nchar(returnType) == 0) stop("`returnType` not provided.")

  url <- "https://api.groq.com/openai/v1/chat/completions"

  messages <- list(
    list(role = "system", content = systemRole),
    list(role = "user", content = prompt)
  )



  if (!is.null(proxy)) {
    if (grepl("^(?:\\d{1,3}\\.){3}\\d{1,3}:\\d{2,5}$", proxy)) {
      proxy <- use_proxy(
        gsub(":.*", "", proxy),
        as.numeric(gsub(".*:", "", proxy))
      )
    } else {
      stop("Invalid proxy provided: ", proxy)
    }
  }


  response <- POST(
    url,
    add_headers(
      `Authorization` = paste("Bearer", GROQ_API_KEY),
      `Content-Type`  = "application/json"
    ),
    body = list(
      messages    = messages,
      model       = model[1],
      temperature = as.numeric(temperature[1]),
      max_tokens  = as.integer(maxTokens[1]),
      top_p       = as.integer(top_p[1]),
      stream      = FALSE,
      stop        = NULL
    ),
    encode = "json",
    proxy
  )


  if (!response$status_code %in% 200:299) {
    stop(content(response))
  }

  chatResponse <- content(response, "text", encoding = "UTF-8")
  chatResponse <- jsonlite::fromJSON(chatResponse)
  chatResponse <- trimws(chatResponse$choices$message$content)

  return(responseReturn(chatResponse, returnType))
}


######################################## .
########  Set Model Parameters  ########
######################################## .

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
  shiny::titlePanel("Set GROQ Parameters"),
  shiny::actionButton("btn_set_params", "Set Parameters")
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
#' @param session The Shiny session object.
#'
#' @return NULL
#'
#' @importFrom shiny observeEvent showNotification stopApp fluidPage
#' @importFrom shinyWidgets inputSweetAlert
#'
#'
server <- function(input, session) {
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
