#' Get Groq Completions Endpoint
#'
#' @param prompt The prompt to generate completions for.
#' @param ... Following arguments can be set manually or in .Reniv:
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
