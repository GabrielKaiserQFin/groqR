#' Translate Code from One Language to Another
#'
#' This function takes a snippet of code and translates it from one programming
#' language to another using GROQ API. The default behavior is to read the code
#' from the clipboard and translate from R to Python.
#'
#' @param code A string containing the code to be translated.
#' If not provided, the function will attempt to read from the clipboard.
#' @param from any programming language. Defaults to "R".
#' @param to any programming language. Defaults to "Python".
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
#' @importFrom clipr read_clip
#'
#' @return A string containing the translated code.
#'
#' @examples
#' \dontrun{
#' codeConverter("z <- function(x) scale(x)^2", from = "R", to = "Python")
#' }
#'
#' @export
#'
codeConverter <- function(code = NULL, from = "R", to = "Python", ...) {
  if (is.null(code)) code <- clipr::read_clip(allow_non_interactive = TRUE)
  # Replace all double strings with single string
  code <- gsub('"', "'", code)
  # Collapse the modified 'code' into a character vector
  code <- paste(code, collapse = "\n")
  # Create a prompt string by concatenating the input code
  prompt <- paste0("Translate the following ", from, " code to ", to, ': "',
                   code, '"')

  return(APIcall(prompt, ...))
}
