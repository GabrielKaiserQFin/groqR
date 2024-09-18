#' Run a 'Groq' RStudio Addin
#'
#' @param FUN The function to be executed.
#'
#' @importFrom rstudioapi as.document_range getSourceEditorContext modifyRange
#'
execAddin <- function(FUN) {
  addinFUN <- switch(FUN,
    "rewriter" = rewriter,
    "codeComment" = codeComment,
    "coder" = coder,
    "unitTests" = unitTests,
    "nameIt" = nameIt,
    "roxy" = roxy,
    "debug" = debug,
    "optimizer" = optimizer,
    "codeConverter" = codeConverter,
    stop("`FUN` not found.")
  )
  # Get the current source editor context.
  input <- getSourceEditorContext()
  inputText <- input$selection[[1]]$text
  fileLength <- all(nchar(inputText) == 0)
  # If there is no selected text, get the entire contents of the editor.
  if (fileLength) {
    inputText <- input$contents
  }
  # Paste the text into a single string, separated by newlines.
  inputText <- paste0(inputText, collapse = "\n")


  return(addinFUN(inputText, maxTokens = 800))
}

runAddin_ask <- function() execAddin_ask()
runAddin_rewriter <- function() execAddin("rewriter")
runAddin_codeComment <- function() execAddin("codeComment")
runAddin_coder <- function() execAddin("coder")
runAddin_unitTests <- function() execAddin("unitTests")
runAddin_nameIt <- function() execAddin("nameIt")
runAddin_commentCode <- function() execAddin("commentCode")
runAddin_debug <- function() execAddin("debug")
runAddin_optimizer <- function() execAddin("optimizer")
runAddin_codeConverter <- function() execAddin("codeConverter")


#' Ask 'Groq'
#'
#' Opens an interactive chat session with 'Groq'
#'
#' @importFrom miniUI gadgetTitleBar miniPage
#' @importFrom shiny actionButton br icon observeEvent onStop runGadget stopApp
#' @importFrom shiny textAreaInput numericInput sliderInput selectInput
#' @importFrom shiny updateTextAreaInput wellPanel splitLayout column
#' @importFrom utils getFromNamespace
#'
execAddin_ask <- function() {
  ui <- miniPage(wellPanel(
    # Sets the title.
    gadgetTitleBar("Ask the 'Groq'", NULL),
    # Sets the CSS style to have a horizontal scrollbar if the content overflows
    style = "overflow-x: scroll",
    # Add a line break in HTML.
    br(), br(),
    # Split the app in three columns and add inputs.
    splitLayout(
      column(
        12,
        selectInput("model", "Model:", choices = c(
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
            "whisper-large-v3"), selectize = FALSE)
      ),
      column(
        12,
        sliderInput("temperature", "Temperature:",
          min = 0, max = 2,
          value = 1, step = 0.1
        )
      ),
      column(
        12,
        numericInput("maxTokens", "max Tokens:", 265,
          min = 10, max = 10000
        )
      ),
      cellWidths = c("40%", "45%", "15%")
    ),
    # Add a line break in HTML.
    br(), br(),
    # Add text input panel.
    textAreaInput("question", "Question:", width = "100%", height = "150px"),
    # Add action button.
    actionButton("Ask", "", icon("terminal")),
    # Add a line break in HTML.
    br(), br(),
    # Add text output panel.
    textAreaInput("response", "Response:", width = "100%", height = "150px")
  ))

  server <- function(input, output, session) {
    # This line sets up an observer for the `Ask` button.
    observeEvent(input$Ask, {
      chatResponse <- ask(input$question,
        model = input$model,
        maxTokens = input$maxTokens,
        temperature = input$temperature
      )
      updateTextAreaInput(session, "response", value = chatResponse)
    })
    # This line sets up an observer for the `done` button.
    observeEvent(input$done, {
      stopApp()
    })
  }

  runGadget(ui, server)
}

