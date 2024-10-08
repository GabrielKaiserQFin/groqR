#' Ask 'Groq'
#'
#' Note: See also `clearChatSession`.
#'
#' @param text The question to ask 'Groq'.
#' @param ... Following arguments can be set manually or in .Renviron:
#'            `GROQ_API_KEY`is the 'Groq API' key.
#'            `model` Model choice. Default is mistral-7b-instruct.
#'            `systemRole` System role; Default is: "You are a helpful assistant
#'            with extensive knowledge of R programming."
#'            `maxTokens` The maximum integer of completion tokens returned.
#'            `temperature` The amount of randomness in the response,
#'            valued between 0 inclusive and 2 exclusive. Higher values are more
#'            random, and lower values are more deterministic.
#'            `top_p` Nucleus sampling threshold, valued between 0 and 1.
#'            `proxy` Default value is NULL.
#'
#' @examples
#' \dontrun{
#' cat(ask("What do you think about Large language models?"))
#' }
#'
#' @return A character value with the response generated by 'Groq'.
#'
#' @export
#'

ask <- function(text = NULL, ...) {

  if (is.null(text)) text <- clipr::read_clip(allow_non_interactive = TRUE)

  return(APIcall(text, ...))
}
